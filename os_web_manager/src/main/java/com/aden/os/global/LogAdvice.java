package com.aden.os.global;

import com.aden.os.biz.LogBiz;
import com.aden.os.entity.Log;
import com.aden.os.entity.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Component
@Aspect
public class LogAdvice {

    @Autowired
    private LogBiz logBiz;

    @After("execution(* com.aden.os.controller.*.*(..)) && !execution(* com.aden.os.controller.*.*Login(..)) && !execution(* com.aden.os.controller.*.login(..))")
    public void operatingLog(JoinPoint joinPoint){
        Log log = initLogInstance(joinPoint);
        log.setResult("success");
        logBiz.addOperatingLog(log);
    }

    @After("execution(* com.aden.os.controller.*.login(..))")
    public void loginLog(JoinPoint joinPoint){
        Log log = initLogInstance(joinPoint);
        log.setResult("success");
        logBiz.addLoginLog(log);
    }

    public void logoutLog(){}

    @AfterThrowing(pointcut = "execution(* com.aden.os.controller.*.*(..))", throwing = "e")
    public void systemLog(JoinPoint joinPoint, Throwable e){

        Log log = initLogInstance(joinPoint);
        log.setResult(e.getClass().getSimpleName());
        logBiz.addSystemLog(log);
    }

    private Log initLogInstance(JoinPoint joinPoint){

        Log log = new Log();
        log.setModule(joinPoint.getTarget().getClass().getSimpleName());
        log.setOperating(joinPoint.getSignature().getName());
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        User user = (User) session.getAttribute("user");
        log.setoperatorId(user.getId());

        return log;
    }
}
