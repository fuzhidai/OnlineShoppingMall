package com.aden.os.biz.impl;

import com.aden.os.biz.EvaluationBiz;
import com.aden.os.dao.EvaluationDao;
import com.aden.os.entity.Evaluation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("evaluationBiz")
public class EvaluationBizImpl implements EvaluationBiz {

    @Autowired
    private EvaluationDao evaluationDao;

    public void add(Evaluation evaluation) {
        evaluation.setTime(new Date());
        evaluationDao.insert(evaluation);
    }

    public List<Evaluation> getByOrderId(Integer id) {
        return evaluationDao.selectByOrderId(id);
    }

    public List<Evaluation> getByCommodityId(Integer id) {
        return evaluationDao.selectByCommodityId(id);
    }
}
