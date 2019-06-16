package com.aden.os.controller;

import com.aden.os.biz.EvaluationBiz;
import com.aden.os.biz.OrderBiz;
import com.aden.os.biz.OrderProcessingRecordBiz;
import com.aden.os.entity.CommodityOrder;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage/order")
public class OrderController {

    @Autowired
    private OrderBiz orderBiz;
    @Autowired
    private OrderProcessingRecordBiz orderProcessingRecordBiz;
    @Autowired
    private EvaluationBiz evaluationBiz;

    @RequestMapping(value = "/list/{type}", method = RequestMethod.GET)
    public String list(@PathVariable("type")String status){
        return "redirect:" + status + "/1";
    }

    @RequestMapping(value = "/list/{type}/{index}", method = RequestMethod.GET)
    public String list(@PathVariable("type")String status, @PathVariable("index")Integer index, Map<String, Object> model){

        Page<?> page = PageHelper.startPage(index, 10);
        List<CommodityOrder> commodityOrders = orderBiz.getOrderListByStatus(status);
        PageInfo<?> pageInfo = page.toPageInfo();

        model.put("INFO", pageInfo);
        if ("all".equals(status)){
            model.put("TYPE", "all_orders");
        }else{
            model.put("TYPE", status);
        }
        model.put("LIST", commodityOrders);
        return "order_list";
    }

    @RequestMapping(value = "/{type}/to_deliver/{id}", method = RequestMethod.GET)
    public String toDeliver(@PathVariable("type")String type, @PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("TYPE", type);
        model.put("DETAIL", orderBiz.get(orderId));
        return "order_deliver";
    }

    @RequestMapping(value = "/{type}/detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("type")String type, @PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("TYPE", type);
        model.put("DETAIL", orderBiz.get(orderId));
        model.put("RECORD", orderProcessingRecordBiz.getOrderProcessingRecord(orderId));
        model.put("EVALUATION", evaluationBiz.getByOrderId(orderId));
        return "order_detail";
    }

    @RequestMapping(value = "/deliver", method = RequestMethod.POST)
    public String deliver(@RequestParam("id")Integer orderId, @RequestParam("waybillNumber")String waybillNumber){
        orderBiz.deliver(orderId, waybillNumber);
        return "redirect:list/all";
    }
}
