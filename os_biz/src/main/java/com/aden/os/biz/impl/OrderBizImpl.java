package com.aden.os.biz.impl;

import com.aden.os.biz.OrderBiz;
import com.aden.os.biz.global.JedisClient;
import com.aden.os.dao.CommodityDao;
import com.aden.os.dao.CommodityOrderDao;
import com.aden.os.dao.CommodityOrderDetailDao;
import com.aden.os.entity.Commodity;
import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.*;

@Service("orderBiz")
public class OrderBizImpl implements OrderBiz {

    @Autowired
    private CommodityDao commodityDao;
    @Autowired
    private CommodityOrderDao commodityOrderDao;
    @Autowired
    private CommodityOrderDetailDao commodityOrderDetailDao;
    @Autowired
    private JedisClient jedisClient;

    private static final String REDIS_CART = "cart";

    public void add(CommodityOrder commodityOrder) {
        commodityOrderDao.insert(commodityOrder);
    }

    public void edit(CommodityOrder commodityOrder) {
        commodityOrderDao.update(commodityOrder);
    }

    public void deliver(Integer orderId, String waybillNumber) {
        CommodityOrder commodityOrder = get(orderId);
        commodityOrder.setWaybillNumber(waybillNumber);
        commodityOrder.setStatus("pending_receipt");
        commodityOrder.setUpdateTime(new Date());
        edit(commodityOrder);
    }

    public Integer buyNow(CommodityOrderDetail commodityOrderDetail, Integer userId) {

        addToShoppingCart(commodityOrderDetail, userId);
        return settlement(userId).getId();
    }

    // 购物车保存至内存中
    public void addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId) {

        // 查找当前购物车中是否存在当前商品的订单详情
        Boolean hexists = jedisClient.hexists(REDIS_CART + ":" + userId, String.valueOf(commodityOrderDetail.getCommodityId()));

        if (hexists){
            // 获取之前购物车中当前商品订单详情JSON字符串
            String json = jedisClient.hget(REDIS_CART + ":" + userId, String.valueOf(commodityOrderDetail.getCommodityId()));
            // 将JSON字符串转化为实例对象
            CommodityOrderDetail oldCommodityOrderDetail = JSON.parseObject(json, CommodityOrderDetail.class);

            // 通过原来商品的数量加上新添加的商品数量来获取当前商品的最新数量
            Integer commodityQuantity = oldCommodityOrderDetail.getCommodityQuantity() + commodityOrderDetail.getCommodityQuantity();
            oldCommodityOrderDetail.setCommodityQuantity(commodityQuantity);

            // 将原订单详情转化为将要插入的对象实例
            commodityOrderDetail = oldCommodityOrderDetail;
        }

        // 将当前商品的订单详情更新至内存中
        jedisClient.hset(REDIS_CART + ":" + userId, String.valueOf(commodityOrderDetail.getCommodityId()), JSON.toJSONString(commodityOrderDetail));
    }

    // 购物车保存至数据库
    public Integer addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId, boolean isRedis) {

        // 如果数据库中不存在购物车则新创建
        CommodityOrder commodityOrder = getOrderCart(userId);

        // 计算加上当前这笔订单明细后订单的总金额
        float totalAmount = commodityOrder.getTotalAmount() + commodityOrderDetail.getCommodityQuantity()*commodityOrderDetail.getCommodityPrice();
        commodityOrder.setTotalAmount(totalAmount);

        // 计算加上当前这笔订单明细后物品总数
        Integer commodityQuantity = commodityOrder.getCommodityQuantity() + commodityOrderDetail.getCommodityQuantity();
        commodityOrder.setCommodityQuantity(commodityQuantity);

        // 将当前的订单明细插入数据库中
        addDetails(commodityOrderDetail, commodityOrder.getId());

        // 更新数据库中的当前订单数据
        edit(commodityOrder);
        return commodityOrder.getId();
    }

    public CommodityOrder settlement(Integer userId) {

        // 根据当前用户的编号从内存中查找该用户的待结算订单
        CommodityOrder commodityOrder = getCart(userId);

        // 如果订单为空则直接返回错误提示码
        if (commodityOrder.getCommodityQuantity() == 0){
            return null;
        }

        // 修改运单号为空
        commodityOrder.setWaybillNumber(null);
        // 修改订单状态为已结算且待支付
        commodityOrder.setStatus("to_be_paid");

        // 减少数据库中对应商品的库存
        decreaseCommodityStocks(commodityOrder);

        // 更新订单的创建和更新时间
        Date currentTime = new Date();
        commodityOrder.setCreateTime(currentTime);
        commodityOrder.setUpdateTime(currentTime);

        // 将当前订单保存至数据库中
        add(commodityOrder);
        // 将订单商品详情保存至数据库中
        List<CommodityOrderDetail> commodityOrderDetailList = commodityOrder.getDetailList();
        for (CommodityOrderDetail commodityOrderDetail: commodityOrderDetailList){
            addDetails(commodityOrderDetail, commodityOrder.getId());
        }
        // 清空内存中的购物车记录
        clearCart(userId);

        return commodityOrder;
    }

    public void pay(Integer orderId) {

        // 根据订单号查找订单
        CommodityOrder commodityOrder = get(orderId);
        if (commodityOrder == null){
            return;
        }

        // 修改订单状态为已支付
        commodityOrder.setStatus("to_be_delivered");
        // 付款成功后更新数据库中商品的销量
        increaseCommoditySalesVolume(commodityOrder);
        // 更新最后订单最后操作时间
        commodityOrder.setUpdateTime(new Date());

        // 将当前订单保存至数据库中
        edit(commodityOrder);
    }

    public void confirmReceipt(Integer orderId) {

        // 根据当前用户的编号从数据库中查找该用户的待结算订单
        CommodityOrder commodityOrder = get(orderId);
        if (commodityOrder == null){
            return;
        }

        // 修改订单状态为待评价
        commodityOrder.setStatus("to_be_commented");
        // 更新最后订单最后操作时间
        commodityOrder.setUpdateTime(new Date());

        // 将当前订单保存至数据库中
        edit(commodityOrder);
    }

    public void completed(Integer orderId) {

        // 根据当前用户的编号从数据库中查找该用户的待结算订单
        CommodityOrder commodityOrder = get(orderId);
        if (commodityOrder == null){
            return;
        }

        // 修改订单状态为已完成
        commodityOrder.setStatus("completed");
        // 更新最后订单最后操作时间
        commodityOrder.setUpdateTime(new Date());

        // 将当前订单保存至数据库中
        edit(commodityOrder);
    }

    public void remove(Integer id) {
        commodityOrderDetailDao.deleteByOrderId(id);
        commodityOrderDao.delete(id);
    }

    /**
     * 实现购物车页面对商品的数量增加操作
     * @param userId 用户编号
     * @param commodityId 商品编号
     */
    @Override
    public void increaseCommodityQuantity(Integer userId, Integer commodityId) {

        // 从内存中获取当前用户购物车中当前商品的字符串信息
        String json = jedisClient.hget(REDIS_CART + ":" + userId, String.valueOf(commodityId));
        // 将字符串JSON转换为实体对象
        CommodityOrderDetail commodityOrderDetail = JSON.parseObject(json, CommodityOrderDetail.class);

        // 获取当前商品的库存数量
        Integer commodityStockQuantity = commodityDao.select(commodityId).getStock();
        // 计算购物车中商品数量增加后的数量
        Integer commodityQuantity = commodityOrderDetail.getCommodityQuantity() + 1;
        // 若当前订单将购买的数量不大于库存数量则增加订单中的该商品数量
        if (commodityQuantity <= commodityStockQuantity){
            commodityOrderDetail.setCommodityQuantity(commodityQuantity);
            // 将更新后的订单信息更新至内存
            jedisClient.hset(REDIS_CART + ":" + userId, String.valueOf(commodityId), JSON.toJSONString(commodityOrderDetail));
        }
    }

    /**
     * 实现购物车页面对商品的数量减少操作
     * @param userId 用户编号
     * @param commodityId 商品编号
     */
    @Override
    public void decreaseCommodityQuantity(Integer userId, Integer commodityId) {

        // 从内存中获取当前用户购物车中当前商品的字符串信息
        String json = jedisClient.hget(REDIS_CART + ":" + userId, String.valueOf(commodityId));
        // 将字符串JSON转换为实体对象
        CommodityOrderDetail commodityOrderDetail = JSON.parseObject(json, CommodityOrderDetail.class);
        // 计算购物车中商品数量减少后的数量
        int commodityQuantity = commodityOrderDetail.getCommodityQuantity() - 1;

        // 数量减少后若数量为0则直接移除此商品
        if (commodityQuantity == 0){
            removeCommodity(userId, commodityId);
        }else{
            commodityOrderDetail.setCommodityQuantity(commodityQuantity);
        }
        // 将更新后的订单信息更新至内存
        jedisClient.hset(REDIS_CART + ":" + userId, String.valueOf(commodityId), JSON.toJSONString(commodityOrderDetail));
    }

    /**
     * 实现购物车页面对商品的移除操作
     * @param userId 用户编号
     * @param commodityId 商品编号
     */
    @Override
    public void removeCommodity(Integer userId, Integer commodityId) {

        // 从内存中直接删除购物车中当前商品
        jedisClient.hdel(REDIS_CART + ":" + userId, String.valueOf(commodityId));
    }

    public CommodityOrder get(Integer id) {
        return commodityOrderDao.select(id);
    }

    // 从内存中获取购物车
    public CommodityOrder getCart(Integer userId) {

        // 从内存中获取当前用户购物车中全部的商品详情的域值对
        Map<Object, Object> commodityOrderDetails = jedisClient.hgetall(REDIS_CART + ":" + userId);

        // 将全部的商品详情域值对转化为对象实例
        List<CommodityOrderDetail> commodityOrderDetailList = new ArrayList<CommodityOrderDetail>();
        CommodityOrderDetail commodityOrderDetail;
        for (Object json: commodityOrderDetails.values()) {
            commodityOrderDetail = JSON.parseObject((String) json, CommodityOrderDetail.class);
            commodityOrderDetailList.add(commodityOrderDetail);
        }

        // 计算当前订单商品的总件数和总价
        Integer commodityQuantity = 0;
        float totalAmount = 0f;
        for (CommodityOrderDetail item: commodityOrderDetailList){
            commodityQuantity += item.getCommodityQuantity();
            totalAmount += item.getCommodityQuantity() * item.getCommodityPrice();
        }

        // 创建用户当前购物车订单并填充相关信息
        CommodityOrder commodityOrder = new CommodityOrder();
        commodityOrder.setDetailList(commodityOrderDetailList);
        commodityOrder.setCommodityQuantity(commodityQuantity);
        commodityOrder.setTotalAmount(totalAmount);
        commodityOrder.setUserId(userId);
        // 订单状态为待结算
        commodityOrder.setStatus("pending_settlement");

        return commodityOrder;
    }

    @Override
    public void clearCart(Integer userId) {
        Map<Object, Object> entries = jedisClient.hgetall(REDIS_CART + ":" + userId);
        Set<Object> commodityIdSet = entries.keySet();
        for (Object commodityId: commodityIdSet){
            jedisClient.hdel(REDIS_CART + ":" + userId, (String)commodityId);
        }
    }

    // 从数据库中获取购物车
    public CommodityOrder getCart(Integer userId, boolean isRedis) {
        return getOrderCart(userId);
    }

    public String getCommodityNameByOrderDetail(Integer id) {
        return commodityOrderDetailDao.getCommodityByOrderDetail(id).getName();
    }

    public List<CommodityOrder> getOrderListByStatus(String status) {

        List<CommodityOrder> commodityOrderList;
        if ("all".equals(status)){
            commodityOrderList = commodityOrderDao.selectAll();
        }else{
            commodityOrderList = commodityOrderDao.selectByStatus(status);
        }
        return commodityOrderList;
    }

    public List<CommodityOrder> getOrderList(Integer userId, String status) {

        List<CommodityOrder> commodityOrderList;
        if ("all".equals(status)){
            commodityOrderList = commodityOrderDao.selectAll();
        }else{
            commodityOrderList = commodityOrderDao.selectByUserIdAndStatus(userId, status);
        }
        return commodityOrderList;
    }

    public List<CommodityOrder> getByUserId(Integer userId) {
        return commodityOrderDao.selectByUserId(userId);
    }

    public List<CommodityOrderDetail> getCommoditySalesRecord(Integer commodityId) {
        return commodityOrderDetailDao.selectByCommodityId(commodityId);
    }

    public List<CommodityOrder> getAll() {
        return commodityOrderDao.selectAll();
    }

    private void addDetails(CommodityOrderDetail commodityOrderDetail, Integer orderId){
        commodityOrderDetail.setOrderId(orderId);
        commodityOrderDetailDao.insert(commodityOrderDetail);
    }

    // 购物车保存至数据库的初始操作
    private CommodityOrder getOrderCart(Integer userId){

        // 根据当前用户的编号从数据库中查找该用户的待结算订单
        CommodityOrder commodityOrder = null;
        List<CommodityOrder> commodityOrderList = commodityOrderDao.selectByUserIdAndStatus(userId, "pending_settlement");
        if (commodityOrderList != null && commodityOrderList.size() > 0){
            commodityOrder = commodityOrderList.get(0);
        }

        // 如果当前数据库中不存在用户的待结算订单则创建
        if (commodityOrder == null){

            Date currentTime = new Date();
            commodityOrder = new CommodityOrder();

            // 订单初始状态为待结算
            commodityOrder.setStatus("pending_settlement");
            commodityOrder.setUserId(userId);
            commodityOrder.setTotalAmount(0f);
            commodityOrder.setCommodityQuantity(0);
            commodityOrder.setWaybillNumber(null);
            commodityOrder.setDetailList(new ArrayList<CommodityOrderDetail>());
            commodityOrder.setCreateTime(currentTime);
            commodityOrder.setUpdateTime(currentTime);

            // 插入数据库
            add(commodityOrder);
        }

        return commodityOrder;
    }

    private void decreaseCommodityStocks(CommodityOrder commodityOrder){

        // 获取订单中订单明细中的商品详情
        List<CommodityOrderDetail> commodityOrderDetailList = commodityOrder.getDetailList();

        // 更新数据库中商品的库存信息
        for (CommodityOrderDetail commodityOrderDetail : commodityOrderDetailList) {
            Commodity commodity = commodityDao.select(commodityOrderDetail.getCommodityId());
            if (commodity != null && commodity.getStock() >= commodityOrderDetail.getCommodityQuantity()) {
                commodity.setStock(commodity.getStock() - commodityOrderDetail.getCommodityQuantity());
            }
            commodityDao.update(commodity);
        }
    }

    private void increaseCommoditySalesVolume(CommodityOrder commodityOrder){

        // 获取订单中订单明细中的商品详情
        List<CommodityOrderDetail> commodityOrderDetailList = commodityOrder.getDetailList();

        // 更新数据库中商品的库存信息
        for (CommodityOrderDetail commodityOrderDetail : commodityOrderDetailList) {
            Commodity commodity = commodityDao.select(commodityOrderDetail.getCommodityId());
            if (commodity != null) {
                commodity.setSalesVolume(commodity.getSalesVolume() + commodityOrderDetail.getCommodityQuantity());
            }
            commodityDao.update(commodity);
        }
    }
}
