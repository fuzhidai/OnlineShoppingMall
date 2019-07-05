package com.aden.os.biz;

import com.aden.os.entity.Commodity;
import sun.plugin.com.event.COMEventHandler;

import java.util.List;

public interface CommodityBiz {

    // 添加商品
    Commodity add(Commodity commodity);

    // 修改商品
    Commodity edit(Commodity commodity);

    // 修改商品状态
    Commodity changeStatus(Integer id);

    // 商品上架
    Commodity inStockCommodity(Integer id);

    // 移除商品
    void remove(Integer id);

    // 根据商品编号获取商品
    Commodity get(Integer id);

    // 获取每种商品的销量前三位商品
    List<Commodity> getEveryTypeTopThree();

    // 获取销量前十的商品列表
    List<Commodity> getSalesVolumeTopTen();

    // 通过商品的类型类获取商品列表
    List<Commodity> getByType(Integer typeId);

    // 通过商品的状态来获取商品列表
    List<Commodity> getByStatus(String status);

    // 从缓存中获取商品
    Commodity getDetailFromCache(Integer id);

    // 获取全部商品
    List<Commodity> getAll();
}
