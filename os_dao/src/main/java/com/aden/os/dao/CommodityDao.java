package com.aden.os.dao;

import com.aden.os.entity.Commodity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommodityDao {

    void insert(Commodity commodity);

    void update(Commodity commodity);

    void delete(Integer id);

    Commodity select(Integer id);

    List<Commodity> selectAll();

    List<Commodity> selectByType(Integer typeId);

    List<Commodity> selectByStatus(String status);

    List<Commodity> selectEveryTypeTopThree();

    List<Commodity> selectSalesVolumeTopTen();
}
