package com.aden.os.biz;

import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
import com.aden.os.entity.Evaluation;

import java.util.List;

public interface OrderBiz {

    void add(CommodityOrder commodityOrder);

    void edit(CommodityOrder commodityOrder);

    void deliver(Integer orderId, String waybillNumber);

    Integer buyNow(CommodityOrderDetail commodityOrderDetail, Integer userId);

    Integer addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId);

    void settlement(Integer userId);

    void pay(Integer orderId);

    void confirmReceipt(Integer orderId);

    void completed(Integer orderId);

    void remove(Integer id);

    CommodityOrder get(Integer id);

    CommodityOrder getCart(Integer userId);

    String getCommodityNameByOrderDetail(Integer id);

    List<CommodityOrder> getOrderListByStatus(String status);

    List<CommodityOrder> getOrderList(Integer userId, String status);

    List<CommodityOrder> getByUserId(Integer userId);

    List<CommodityOrderDetail> getCommoditySalesRecord(Integer commodityId);

    List<CommodityOrder> getAll();
}
