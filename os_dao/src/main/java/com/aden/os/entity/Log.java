package com.aden.os.entity;

import java.util.Date;

public class Log {

    // 日志类型
    private String type;
    // 管理员编号
    private Integer operatorId;
    // 管理员姓名
    private String operator;
    // 具体操作
    private String operating;
    // 操作模块
    private String module;
    // 操作结果
    private String result;
    // 操作结果
    private Date time;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getOperator_id() {
        return operatorId;
    }

    public void setoperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperating() {
        return operating;
    }

    public void setOperating(String operating) {
        this.operating = operating;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
