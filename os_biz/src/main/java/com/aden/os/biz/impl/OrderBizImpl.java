package com.aden.os.biz.impl;

import com.aden.os.biz.OrderBiz;
import com.aden.os.dao.CommodityOrderDao;
import com.aden.os.dao.CommodityOrderDetailDao;
import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

@Service("orderBiz")
public class OrderBizImpl implements OrderBiz {

    @Autowired
    private CommodityOrderDao commodityOrderDao;
    @Autowired
    private CommodityOrderDetailDao commodityOrderDetailDao;

    private ConcurrentHashMap<Integer, CommodityOrder> commodityOrders = new ConcurrentHashMap<Integer, CommodityOrder>();

    public void add(CommodityOrder commodityOrder) {
        commodityOrderDao.insert(commodityOrder);
    }

    public void edit(CommodityOrder commodityOrder) {
        commodityOrderDao.update(commodityOrder);
    }

    public void buyNow(CommodityOrderDetail commodityOrderDetail, Integer userId) {

        addToShoppingCart(commodityOrderDetail, userId);
        settlement(userId);
    }

    public void addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId) {

        // 根据当前用户的编号从缓存的订单列表中查找当前用户的订单
        CommodityOrder commodityOrder = commodityOrders.get(userId);

        // 如果当前缓存中未存在用户对应的订单则为其创建新的订单
        if (commodityOrder == null){

            commodityOrder = new CommodityOrder();
            commodityOrder.setUserId(userId);
            commodityOrder.setTotalAmount(0f);
            commodityOrder.setCommodityQuantity(0);
            commodityOrder.setWaybillNumber(null);
            commodityOrder.setDetailList(new ArrayList<CommodityOrderDetail>());

            // 订单初始状态为待结算
            commodityOrder.setStatus("pending_settlement");
        }

        // 计算加上当前这笔订单明细后订单的总金额
        float totalAmount = commodityOrder.getTotalAmount() + commodityOrderDetail.getCommodityQuantity()*commodityOrderDetail.getCommodityPrice();
        commodityOrder.setTotalAmount(totalAmount);

        // 计算加上当前这笔订单明细后物品总数
        Integer commodityQuantity = commodityOrder.getCommodityQuantity() + commodityOrderDetail.getCommodityQuantity();
        commodityOrder.setCommodityQuantity(commodityQuantity);

        // 将当前订单明细保存到订单中
        List<CommodityOrderDetail> commodityOrderDetails = commodityOrder.getDetailList();
        commodityOrderDetails.add(commodityOrderDetail);
        commodityOrder.setDetailList(commodityOrderDetails);

        // 更新数据后存回缓存中
        commodityOrders.put(userId, commodityOrder);
    }

    public void settlement(Integer userId) {

        // 根据当前用户的编号从缓存的订单列表中查找当前用户的订单
        CommodityOrder commodityOrder = commodityOrders.get(userId);
        if (commodityOrder == null){
            return;
        }

        // 修改订单状态为已结算
        commodityOrder.setStatus("paid");

        // 为订单的创建和更新时间进行赋值
        Date currentTime = new Date();
        commodityOrder.setCreateTime(currentTime);
        commodityOrder.setUpdateTime(currentTime);

        // 将当前订单保存至数据库中
        add(commodityOrder);
        addDetails(commodityOrder.getDetailList(), commodityOrder.getId());

        // 清空当前用户的订单缓存数据
        commodityOrders.remove(userId);
    }

    public void remove(Integer id) {
        commodityOrderDao.delete(id);
    }

    public CommodityOrder get(Integer id) {
        return commodityOrderDao.select(id);
    }

    public List<CommodityOrder> getByUserId(Integer userId) {
        return commodityOrderDao.selectByUserId(userId);
    }

    public List<CommodityOrder> getAll() {
        return commodityOrderDao.selectAll();
    }

    private void addDetails(List<CommodityOrderDetail> commodityOrderDetails, Integer orderId){

        for (CommodityOrderDetail commodityOrderDetail : commodityOrderDetails) {
            commodityOrderDetail.setOrderId(orderId);
            commodityOrderDetailDao.insert(commodityOrderDetail);
        }
    }
}
