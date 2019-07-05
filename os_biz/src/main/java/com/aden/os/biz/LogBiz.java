package com.aden.os.biz;

import com.aden.os.entity.Log;

import java.util.List;

public interface LogBiz {

    // 记录系统日志
    void addSystemLog(Log log);

    // 记录登录日志
    void addLoginLog(Log log);

    // 记录操作日志
    void addOperatingLog(Log log);

    // 根据日志类型获取日志列表
    List<Log> getLogByType(String type);

    // 根据管理员编号获取日志列表
    List<Log> getLogByUserId(Integer id);
}
