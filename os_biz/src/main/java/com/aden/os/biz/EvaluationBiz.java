package com.aden.os.biz;

import com.aden.os.entity.Evaluation;

import java.util.List;

public interface EvaluationBiz {

    void add(Evaluation evaluation);

    List<Evaluation> getByOrderId(Integer id);

    List<Evaluation> getByCommodityId(Integer id);}
