package com.aden.os.dao;

import com.aden.os.entity.Commodity;
import com.aden.os.entity.CommodityOrderDetail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommodityOrderDetailDao {

    void insert(CommodityOrderDetail commodityOrderDetail);

    void update(CommodityOrderDetail commodityOrderDetail);

    void delete(Integer id);

    void deleteByOrderId(Integer OrderId);

    CommodityOrderDetail select(Integer id);

    Commodity getCommodityByOrderDetail(Integer id);

    List<CommodityOrderDetail> selectByOrderId(Integer id);

    List<CommodityOrderDetail> selectByCommodityId(Integer CommodityId);

    List<CommodityOrderDetail> selectAll();
}
