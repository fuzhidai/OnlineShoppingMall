package com.aden.os.biz;

import com.aden.os.entity.Evaluation;

import java.util.List;

public interface EvaluationBiz {

    // 添加评论
    void add(Evaluation evaluation);

    // 通过订单明细编号查找评论
    List<Evaluation> getByOrderId(Integer id);

    // 通过商品编号查找评论
    List<Evaluation> getByCommodityId(Integer id);
}
