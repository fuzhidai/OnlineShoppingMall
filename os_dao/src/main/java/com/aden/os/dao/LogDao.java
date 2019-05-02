package com.aden.os.dao;

import com.aden.os.entity.Log;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogDao {

    void insert(Log log);

    List<Log> selectByType(String type);

    List<Log> selectByOperator(Integer id);
}
