package com.aden.os.biz.impl;

import com.aden.os.biz.OrderBiz;
import com.aden.os.dao.CommodityDao;
import com.aden.os.dao.CommodityOrderDao;
import com.aden.os.dao.CommodityOrderDetailDao;
import com.aden.os.entity.Commodity;
import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("orderBiz")
public class OrderBizImpl implements OrderBiz {

    @Autowired
    private CommodityDao commodityDao;
    @Autowired
    private CommodityOrderDao commodityOrderDao;
    @Autowired
    private CommodityOrderDetailDao commodityOrderDetailDao;

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

        Integer orderId = addToShoppingCart(commodityOrderDetail, userId);
        settlement(orderId);
        return orderId;
    }

    public Integer addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId) {

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

    public void settlement(Integer orderId) {

        // 根据当前用户的编号从数据库中查找该用户的待结算订单
        CommodityOrder commodityOrder = commodityOrderDao.select(orderId);
        if (commodityOrder == null){
            return;
        }

        // 修改订单状态为已结算且待支付
        commodityOrder.setStatus("to_be_paid");

        // 减少数据库中对应商品的库存
        decreaseCommodityStocks(commodityOrder);

        // 更新订单的创建和更新时间
        Date currentTime = new Date();
        commodityOrder.setCreateTime(currentTime);
        commodityOrder.setUpdateTime(currentTime);

        // 将当前订单保存至数据库中
        edit(commodityOrder);
    }

    public void pay(Integer orderId) {

        // 根据当前用户的编号从数据库中查找该用户的待结算订单
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

    public void remove(Integer id) {
        commodityOrderDetailDao.deleteByOrderId(id);
        commodityOrderDao.delete(id);
    }

    public CommodityOrder get(Integer id) {
        return commodityOrderDao.select(id);
    }

    public CommodityOrder getCart(Integer userId) {
        return getOrderCart(userId);
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
