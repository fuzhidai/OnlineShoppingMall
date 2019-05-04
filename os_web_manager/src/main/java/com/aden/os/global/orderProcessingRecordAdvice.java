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

    @After("execution(* com.aden.os.controller.OrderController.deliver(..))")
    public void deliverRecord(JoinPoint joinPoint){

        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpServletRequest = attr.getRequest();
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");

        OrderProcessingRecord orderProcessingRecord = new OrderProcessingRecord();
        orderProcessingRecord.setOperatorId(user.getId());
        orderProcessingRecord.setOrderId((Integer) joinPoint.getArgs()[0]);

        orderProcessingRecordBiz.addDeliverRecord(orderProcessingRecord);
    }
}
