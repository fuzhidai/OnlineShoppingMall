package com.aden.os.biz;

import com.aden.os.entity.CommodityCategory;

import java.util.List;

public interface CommodityCategoryBiz {

    void add(CommodityCategory commodityCategory);

    void edit(CommodityCategory commodityCategory);

    void remove(Integer id);

    CommodityCategory get(Integer id);

    List<CommodityCategory> getAll();
}
