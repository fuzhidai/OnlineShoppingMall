package com.aden.os.biz;

import com.aden.os.entity.CommodityCategory;

import java.util.List;

public interface CommodityCategoryBiz {

    // 添加商品种类
    void add(CommodityCategory commodityCategory);

    // 编辑商品种类
    void edit(CommodityCategory commodityCategory);

    // 移除商品种类
    void remove(Integer id);

    // 通过商品种类编号获取商品种类信息
    CommodityCategory get(Integer id);

    // 获取所有商品种类
    List<CommodityCategory> getAll();
}
