package com.aden.os.biz.impl;

import com.aden.os.biz.OrderProcessingRecordBiz;
import com.aden.os.dao.OrderProcessingRecordDao;
import com.aden.os.entity.OrderProcessingRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("orderProcessingRecordBiz")
public class OrderProcessingRecordBizImpl implements OrderProcessingRecordBiz {

    @Autowired
    private OrderProcessingRecordDao orderProcessingRecordDao;

    public void addPayRecord(OrderProcessingRecord orderProcessingRecord) {
        orderProcessingRecord.setStatus("to_be_delivered");
        orderProcessingRecord.setTime(new Date());
        orderProcessingRecordDao.insert(orderProcessingRecord);
    }

    public void addDeliverRecord(OrderProcessingRecord orderProcessingRecord) {
        orderProcessingRecord.setStatus("pending_receipt");
        orderProcessingRecord.setTime(new Date());
        orderProcessingRecordDao.insert(orderProcessingRecord);
    }

    public void addConfirmReceiptRecord(OrderProcessingRecord orderProcessingRecord) {
        orderProcessingRecord.setStatus("to_be_commented");
        orderProcessingRecord.setTime(new Date());
        orderProcessingRecordDao.insert(orderProcessingRecord);
    }

    public void addCommentOrderRecord(OrderProcessingRecord orderProcessingRecord) {
        orderProcessingRecord.setStatus("completed");
        orderProcessingRecord.setTime(new Date());
        orderProcessingRecordDao.insert(orderProcessingRecord);
    }

    public List<OrderProcessingRecord> getOrderProcessingRecord(Integer orderId) {
        return orderProcessingRecordDao.selectByOrderId(orderId);
    }
}
