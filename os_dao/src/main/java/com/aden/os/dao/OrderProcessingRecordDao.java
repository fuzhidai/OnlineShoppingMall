package com.aden.os.dao;

import com.aden.os.entity.OrderProcessingRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderProcessingRecordDao {

    void insert(OrderProcessingRecord orderProcessingRecord);

    List<OrderProcessingRecord> selectByOrderId(Integer orderId);
}
