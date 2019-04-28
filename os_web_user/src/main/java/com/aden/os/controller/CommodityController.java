package com.aden.os.controller;

import com.aden.os.biz.CommodityBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/commodity")
public class CommodityController {

    @Autowired
    private CommodityBiz commodityBiz;

    @RequestMapping(value = "/homepage", method = RequestMethod.GET)
    public String listAll(Map<String, Object> model){
        model.put("LIST", commodityBiz.getEveryTypeTopThree());
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
        return "commodity_detail";
    }
}
