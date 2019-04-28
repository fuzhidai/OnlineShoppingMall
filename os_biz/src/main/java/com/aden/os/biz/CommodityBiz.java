package com.aden.os.biz;

import com.aden.os.entity.Commodity;

import java.util.List;

public interface CommodityBiz {

    void add(Commodity commodity);

    void edit(Commodity commodity);

    void changeStatus(Integer id);

    void remove(Integer id);

    Commodity get(Integer id);

    List<Commodity> getEveryTypeTopThree();

    List<Commodity> getByType(Integer typeId);

    List<Commodity> getByStatus(String status);

    Commodity getDetailFromCache(Integer id);

    List<Commodity> getAll();
}
