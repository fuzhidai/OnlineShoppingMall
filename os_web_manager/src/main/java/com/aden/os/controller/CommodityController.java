package com.aden.os.controller;

import com.aden.os.biz.CommodityBiz;
import com.aden.os.biz.CommodityCategoryBiz;
import com.aden.os.entity.Commodity;
import com.aden.os.entity.CommodityCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage/commodity")
public class CommodityController {

    @Autowired
    private CommodityBiz commodityBiz;
    @Autowired
    private CommodityCategoryBiz commodityCategoryBiz;

    @RequestMapping("/toAdd")
    public String toAdd(Map<String, Object> model){
        model.put("TYPE", "add");
        model.put("TYPES", commodityCategoryBiz.getAll());
        return "commodity_add";
    }

    @RequestMapping("/toDetail/{id}")
    public String toDetail(@PathVariable("id")Integer id, Map<String, Object> model){

        model.put("TYPE", "add");
        model.put("DETAIL", commodityBiz.getDetailFromCache(id));
        return "commodity_detail";
    }

    @RequestMapping("/add")
    public String add(Commodity commodity){
        commodityBiz.add(commodity);
        return "commodity_add";
    }

    @RequestMapping("/list/{status}")
    public String list(@PathVariable("status")String status, Map<String, Object> model){
        model.put("LIST", commodityBiz.getByStatus(status));
        model.put("TYPE", status);
        return "commodity_list";
    }



}
