package com.aden.os.biz.impl;

import com.aden.os.biz.LogBiz;
import com.aden.os.dao.LogDao;
import com.aden.os.entity.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("logBiz")
public class LogBizImpl implements LogBiz {

    @Autowired
    private LogDao logDao;

    public void addSystemLog(Log log) {
        log.setType("system");
        log.setTime(new Date());
        logDao.insert(log);
    }

    public void addLoginLog(Log log) {
        log.setType("login");
        log.setTime(new Date());
        logDao.insert(log);
    }

    public void addOperatingLog(Log log) {
        log.setType("operating");
        log.setTime(new Date());
        logDao.insert(log);
    }

    public List<Log> getLogByType(String type) {
        return logDao.selectByType(type);
    }

    public List<Log> getLogByUserId(Integer id) {
        return logDao.selectByOperator(id);
    }
}
