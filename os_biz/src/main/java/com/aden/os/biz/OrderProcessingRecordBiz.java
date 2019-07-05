package com.aden.os.biz;

import com.aden.os.entity.OrderProcessingRecord;

import java.util.List;

public interface OrderProcessingRecordBiz {

    // 添加支付记录
    void addPayRecord(OrderProcessingRecord orderProcessingRecord);

    // 添加发货记录
    void addDeliverRecord(OrderProcessingRecord orderProcessingRecord);

    // 添加确认收货记录
    void addConfirmReceiptRecord(OrderProcessingRecord orderProcessingRecord);

    // 添加评论记录
    void addCommentOrderRecord(OrderProcessingRecord orderProcessingRecord);

    // 根据订单明细编号查找订单处理流程记录列表
    List<OrderProcessingRecord> getOrderProcessingRecord(Integer orderId);
}
