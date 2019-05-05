package com.aden.os.dao;

import com.aden.os.entity.Evaluation;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EvaluationDao {

    void insert(Evaluation user);

    void update(Evaluation user);

    void delete(Integer id);

    List<Evaluation> selectByOrderId(Integer id);

    List<Evaluation> selectByCommodityId(Integer id);
}
