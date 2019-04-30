package com.aden.os.entity;

public class CommodityOrderDetail {

    private Integer id;
    private Integer orderId;
    private Integer commodityId;
    private String commodityName;
    private Float commodityPrice;
    private Integer commodityQuantity;
    private Commodity commodity;
    private CommodityOrder commodityOrder;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public Float getCommodityPrice() {
        return commodityPrice;
    }

    public void setCommodityPrice(Float commodityPrice) {
        this.commodityPrice = commodityPrice;
    }

    public Integer getCommodityQuantity() {
        return commodityQuantity;
    }

    public void setCommodityQuantity(Integer commodityQuantity) {
        this.commodityQuantity = commodityQuantity;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public CommodityOrder getCommodityOrder() {
        return commodityOrder;
    }

    public void setCommodityOrder(CommodityOrder commodityOrder) {
        this.commodityOrder = commodityOrder;
    }
}
