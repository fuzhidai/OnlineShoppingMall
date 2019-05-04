package com.aden.os.biz;

import com.aden.os.entity.Log;

import java.util.List;

public interface LogBiz {

    void addSystemLog(Log log);

    void addLoginLog(Log log);

    void addOperatingLog(Log log);

    List<Log> getLogByType(String type);

    List<Log> getLogByUserId(Integer id);
}
