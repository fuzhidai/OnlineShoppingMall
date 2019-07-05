package com.aden.os.entity;

import java.util.Date;
import java.util.List;

public class CommodityOrder {

    // 订单编号
    private Integer id;
    // 用户编号
    private Integer userId;
    // 订单状态
    private String status;
    // 商品总数量
    private Integer commodityQuantity;
    // 商品总金额
    private Float totalAmount;
    // 运单号
    private String waybillNumber;
    // 创建时间
    private Date createTime;
    // 更新时间
    private Date updateTime;
    // 订单明细列表
    private List<CommodityOrderDetail> detailList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getCommodityQuantity() {
        return commodityQuantity;
    }

    public void setCommodityQuantity(Integer commodityQuantity) {
        this.commodityQuantity = commodityQuantity;
    }

    public Float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getWaybillNumber() {
        return waybillNumber;
    }

    public void setWaybillNumber(String waybillNumber) {
        this.waybillNumber = waybillNumber;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public List<CommodityOrderDetail> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<CommodityOrderDetail> detailList) {
        this.detailList = detailList;
    }
}
