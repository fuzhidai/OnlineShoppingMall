package com.aden.os.entity;

import java.util.Date;

public class Evaluation {

    // 评价编号
    private Integer id;
    // 订单明细编号
    private Integer orderDetailId;
    // 评价星级
    private Integer grade;
    // 评价内容
    private String content;
    // 评价图片
    private String image;
    // 评价时间
    private Date time;
    // 用户昵称
    private String userName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
