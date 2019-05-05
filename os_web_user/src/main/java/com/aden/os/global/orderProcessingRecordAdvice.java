package com.aden.os.global;

import com.aden.os.biz.OrderProcessingRecordBiz;
import com.aden.os.entity.OrderProcessingRecord;
import com.aden.os.entity.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Component
@Aspect
public class orderProcessingRecordAdvice {

    @Autowired
    private OrderProcessingRecordBiz orderProcessingRecordBiz;

    @After("execution(* com.aden.os.controller.OrderController.pay(..))")
    public void settlementRecord(JoinPoint joinPoint){
        OrderProcessingRecord orderProcessingRecord = initOrderProcessingRecordInstance(joinPoint);
        orderProcessingRecordBiz.addPayRecord(orderProcessingRecord);
    }

    @After("execution(* com.aden.os.controller.OrderController.confirmReceipt(..))")
    public void confirmReceiptRecord(JoinPoint joinPoint){
        OrderProcessingRecord orderProcessingRecord = initOrderProcessingRecordInstance(joinPoint);
        orderProcessingRecordBiz.addConfirmReceiptRecord(orderProcessingRecord);
    }

    @After("execution(* com.aden.os.controller.OrderController.commentOrder(..))")
    public void commentOrderRecord(JoinPoint joinPoint){
        OrderProcessingRecord orderProcessingRecord = initOrderProcessingRecordInstance(joinPoint);
        orderProcessingRecordBiz.addCommentOrderRecord(orderProcessingRecord);
    }

    private OrderProcessingRecord initOrderProcessingRecordInstance(JoinPoint joinPoint){

        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpServletRequest = attr.getRequest();
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");

        OrderProcessingRecord orderProcessingRecord = new OrderProcessingRecord();
        orderProcessingRecord.setOperatorId(user.getId());
        orderProcessingRecord.setOrderId((Integer) joinPoint.getArgs()[0]);

        return orderProcessingRecord;
    }
}
