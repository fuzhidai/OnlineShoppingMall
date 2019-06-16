package com.aden.os.controller;

import com.aden.os.biz.CommodityBiz;
import com.aden.os.biz.CommodityCategoryBiz;
import com.aden.os.entity.Commodity;
import com.aden.os.entity.CommodityCategory;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> model){
        model.put("TYPE", "add");
        model.put("TYPES", commodityCategoryBiz.getAll());
        return "commodity_add";
    }

    @RequestMapping("/{type}/detail/{id}")
    public String detail(@PathVariable("id")Integer id, @PathVariable("type")String type, Map<String, Object> model){
        model.put("TYPE", type);
        model.put("DETAIL", commodityBiz.getDetailFromCache(id));
        return "commodity_detail";
    }

    @RequestMapping("/{type}/to_edit/{id}")
    public String toEdit(@PathVariable("id")Integer id, @PathVariable("type")String type, Map<String, Object> model){
        model.put("TYPE", type);
        model.put("TYPES", commodityCategoryBiz.getAll());
        model.put("DETAIL", commodityBiz.getDetailFromCache(id));
        return "commodity_add";
    }

    @RequestMapping("/add")
    public String add(Commodity commodity){
        commodityBiz.add(commodity);
        return "commodity_add";
    }

    @RequestMapping("/{status}/change_status/{id}")
    public String changeStatus(@PathVariable("id")Integer id, @PathVariable("status")String status, Map<String, Object> model){
        model.put("TYPE", status);
        commodityBiz.changeStatus(id);
        model.put("LIST", commodityBiz.getByStatus(status));
        return "commodity_list";
    }

    @RequestMapping("/list/{status}")
    public String list(@PathVariable("status")String status){
        return "redirect:" + status + "/1";
    }

    @RequestMapping("/list/{status}/{index}")
    public String list(@PathVariable("status")String status, @PathVariable("index")Integer index, Map<String, Object> model){

        Page<?> page = PageHelper.startPage(index, 10);
        List<Commodity> commodities = commodityBiz.getByStatus(status);
        PageInfo<?> pageInfo = page.toPageInfo();

        model.put("LIST", commodities);
        model.put("INFO", pageInfo);
        model.put("TYPE", status);
        return "commodity_list";
    }

}
