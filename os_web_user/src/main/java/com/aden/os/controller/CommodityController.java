package com.aden.os.controller;

import com.aden.os.biz.CommodityBiz;
import com.aden.os.biz.EvaluationBiz;
import com.aden.os.biz.OrderBiz;
import com.aden.os.biz.UserBiz;
import com.aden.os.dto.CommoditySalesRecord;
import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
import com.aden.os.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/commodity")
public class CommodityController {

    @Autowired
    private CommodityBiz commodityBiz;
    @Autowired
    private OrderBiz orderBiz;
    @Autowired
    private UserBiz userBiz;
    @Autowired
    private EvaluationBiz evaluationBiz;

    @RequestMapping(value = "/homepage", method = RequestMethod.GET)
    public String listAll(Map<String, Object> model){
        model.put("LIST", commodityBiz.getEveryTypeTopThree());
        model.put("HOT_LIST", commodityBiz.getSalesVolumeTopTen());
        return "commodity_homepage";
    }

    @RequestMapping(value = "/list_type/{id}", method = RequestMethod.GET)
    public String listType(@PathVariable("id")Integer id, Map<String, Object> model){
        model.put("LIST", commodityBiz.getByType(id));
        return "commodity_list";
    }

    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id")Integer id, Map<String, Object> model){

        model.put("DETAIL", commodityBiz.get(id));

        List<CommodityOrderDetail> commodityOrderDetailList = orderBiz.getCommoditySalesRecord(id);
        List<CommoditySalesRecord> commoditySalesRecordList = new ArrayList<>();
        for (CommodityOrderDetail commodityOrderDetail: commodityOrderDetailList){
            CommodityOrder commodityOrder = orderBiz.get(commodityOrderDetail.getOrderId());
            User user = userBiz.get(commodityOrder.getUserId());

            CommoditySalesRecord commoditySalesRecord = new CommoditySalesRecord();
            commoditySalesRecord.setNickname(user.getNickname().substring(0, 2) + "*****");
            commoditySalesRecord.setQuantity(commodityOrder.getCommodityQuantity());
            commoditySalesRecord.setStatus(commodityOrder.getStatus());
            commoditySalesRecord.setTime(commodityOrder.getCreateTime());
            commoditySalesRecord.setEvaluation(5);
            commoditySalesRecordList.add(commoditySalesRecord);
        }

        model.put("SALES_RECORD", commoditySalesRecordList);
        model.put("EVALUATION", evaluationBiz.getByCommodityId(id));
        return "commodity_detail";
    }
}
