package com.aden.os.biz;

import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;

import java.util.List;

public interface OrderBiz {

    void add(CommodityOrder commodityOrder);

    void edit(CommodityOrder commodityOrder);

    void buyNow(CommodityOrderDetail commodityOrderDetail, Integer userId);

    void addToShoppingCart(CommodityOrderDetail commodityOrderDetail, Integer userId);

    void settlement(Integer userId);

    void remove(Integer id);

    CommodityOrder get(Integer id);

    List<CommodityOrder> getByUserId(Integer userId);

    List<CommodityOrder> getAll();
}
