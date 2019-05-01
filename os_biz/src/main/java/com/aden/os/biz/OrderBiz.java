package com.aden.os.biz;

import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;

import java.util.List;

public interface OrderBiz {

    void add(CommodityOrder commodityOrder);

    void edit(CommodityOrder commodityOrder);

    Integer buyNow(CommodityOrderDetail commodityOrderDetail, Integer userId);

    void addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId);

    void settlement(Integer userId);

    void pay(Integer orderId);

    void remove(Integer id);

    CommodityOrder get(Integer id);

    CommodityOrder getCart(Integer userId);

    List<CommodityOrder> getByUserId(Integer userId);

    List<CommodityOrder> getAll();
}
