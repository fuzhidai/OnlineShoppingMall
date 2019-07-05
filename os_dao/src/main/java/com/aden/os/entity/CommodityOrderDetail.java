package com.aden.os.entity;

public class CommodityOrderDetail {

    // 订单明细编号
    private Integer id;
    // 订单编号
    private Integer orderId;
    // 商品编号
    private Integer commodityId;
    // 商品名称
    private String commodityName;
    // 商品价格
    private Float commodityPrice;
    // 商品数量
    private Integer commodityQuantity;
    // 商品实体
    private Commodity commodity;
    // 订单实体
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
