package com.aden.os.dao;

import com.aden.os.entity.CommodityCategory;

import java.util.List;

public interface CommodityCategoryDao {

    void insert(CommodityCategory commodityCategory);

    void update(CommodityCategory commodityCategory);

    void delete(Integer id);

    CommodityCategory select(Integer id);

    List<CommodityCategory> selectAll();
}
