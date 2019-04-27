package com.aden.os.biz.impl;

import com.aden.os.biz.CommodityCategoryBiz;
import com.aden.os.dao.CommodityCategoryDao;
import com.aden.os.entity.CommodityCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("commodityCategoryBiz")
public class CommodityCategoryBizImpl implements CommodityCategoryBiz {

    @Autowired
    private CommodityCategoryDao commodityCategoryDao;

    public void add(CommodityCategory commodityCategory) {
        commodityCategoryDao.insert(commodityCategory);
    }

    public void edit(CommodityCategory commodityCategory) {
        commodityCategoryDao.update(commodityCategory);
    }

    public void remove(Integer id) {
        commodityCategoryDao.delete(id);
    }

    public CommodityCategory get(Integer id) {
        return commodityCategoryDao.select(id);
    }

    public List<CommodityCategory> getAll() {
        return commodityCategoryDao.selectAll();
    }
}
