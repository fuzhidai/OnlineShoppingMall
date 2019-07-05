package com.aden.os.entity;

import java.util.Date;

public class OrderProcessingRecord {

    // 订单详情编号
    private Integer orderId;
    // 操作人编号
    private Integer operatorId;
    // 订单更新状态
    private String status;
    // 操作时间
    private Date time;
    // 操作人姓名
    private String operator;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}
