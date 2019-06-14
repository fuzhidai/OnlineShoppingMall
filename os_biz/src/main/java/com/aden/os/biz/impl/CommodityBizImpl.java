package com.aden.os.biz.impl;

import com.aden.os.biz.CommodityBiz;
import com.aden.os.dao.CommodityDao;
import com.aden.os.entity.Commodity;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("commodityBiz")
public class CommodityBizImpl implements CommodityBiz {

    private List<Commodity> cache;

    private final CommodityDao commodityDao;

    public CommodityBizImpl(CommodityDao commodityDao) {
        this.commodityDao = commodityDao;
    }

    public void add(Commodity commodity) {
        commodity.setCreateTime(new Date());
        commodity.setUpdateTime(new Date());

        // 若未设置上架时间则为立即上架，否则为定时上架
        if (commodity.getAddedTime() == null){
            commodity.setAddedTime(new Date());
        }else {

            
        }

        commodity.setSalesVolume(0);
        commodity.setImage(null);
        commodityDao.insert(commodity);
    }

    public void setCache(List<Commodity> cache) {
        this.cache = cache;
    }

    public void edit(Commodity commodity) {
        commodityDao.update(commodity);
    }

    public void changeStatus(Integer id) {
        Commodity commodity = getDetailFromCache(id);
        commodity.setAddedTime(new Date());
        commodity.setUpdateTime(new Date());

        if ("in_stock".equals(commodity.getStatus())){
            commodity.setStatus("for_sale");
        }else if ("for_sale".equals(commodity.getStatus())){
            commodity.setStatus("in_stock");
        }
        commodityDao.update(commodity);
    }

    public void remove(Integer id) {
        commodityDao.delete(id);
    }

    public Commodity get(Integer id) {
        return commodityDao.select(id);
    }

    public List<Commodity> getEveryTypeTopThree(){
        cache = commodityDao.selectEveryTypeTopThree();
        return cache;
    }

    public List<Commodity> getByType(Integer typeId) {
        cache = commodityDao.selectByType(typeId);
        return cache;
    }

    public List<Commodity> getByStatus(String status){

        if ("all".equals(status)){
            return getAll();
        }else{
            cache = commodityDao.selectByStatus(status);
            return cache;
        }
    }

    public Commodity getDetailFromCache(Integer id){

        if (cache == null){
            getAll();
        }

        for (Commodity commodity : cache) {
            if (commodity.getId() == id.intValue()) {
                return commodity;
            }
        }
        return null;
    }

    public List<Commodity> getAll() {
        cache = commodityDao.selectAll();
        return cache;
    }
}
