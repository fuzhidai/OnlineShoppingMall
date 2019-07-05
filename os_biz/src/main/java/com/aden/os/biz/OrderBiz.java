package com.aden.os.biz;

import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
import com.aden.os.entity.Evaluation;

import java.util.List;

public interface OrderBiz {

    // 添加订单
    void add(CommodityOrder commodityOrder);

    // 修改订单
    void edit(CommodityOrder commodityOrder);

    // 订单发货
    void deliver(Integer orderId, String waybillNumber);

    // 立即购买
    Integer buyNow(CommodityOrderDetail commodityOrderDetail, Integer userId);

    // 加入购物车
    void addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId);

    // 结算订单
    CommodityOrder settlement(Integer userId);

    // 支付订单
    void pay(Integer orderId);

    // 确认收货
    void confirmReceipt(Integer orderId);

    // 已完成
    void completed(Integer orderId);

    // 删除订单
    void remove(Integer id);

    // 增加购物车中商品的数量
    void increaseCommodityQuantity(Integer userId, Integer commodityId);

    // 减少购物车中商品的数量
    void decreaseCommodityQuantity(Integer userId, Integer commodityId);

    // 移除购物车中的商品
    void removeCommodity(Integer userId, Integer commodityId);

    // 根据订单号获取订单
    CommodityOrder get(Integer id);

    // 获取购物车
    CommodityOrder getCart(Integer userId);

    // 清空购物车
    void clearCart(Integer userId);

    // 通过订单明细获取商品编号
    String getCommodityNameByOrderDetail(Integer id);

    // 通过订单状态获取订单列表
    List<CommodityOrder> getOrderListByStatus(String status);

    // 获取订单列表
    List<CommodityOrder> getOrderList(Integer userId, String status);

    // 通过用户编号获取订单列表
    List<CommodityOrder> getByUserId(Integer userId);

    // 获取商品的销售订单
    List<CommodityOrderDetail> getCommoditySalesRecord(Integer commodityId);

    // 获取所有订单
    List<CommodityOrder> getAll();
}
