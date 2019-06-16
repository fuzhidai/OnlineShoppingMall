package com.aden.os.controller;

import com.aden.os.biz.LogBiz;
import com.aden.os.entity.Log;
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
@RequestMapping("/backstage/log")
public class LogController {

    @Autowired
    private LogBiz logBiz;

    @RequestMapping(value = "/list/{type}", method = RequestMethod.GET)
    public String list(@PathVariable("type")String type){

        return "redirect:" + type + "/1";
    }

    @RequestMapping(value = "/list/{type}/{index}", method = RequestMethod.GET)
    public String list(@PathVariable("type")String type, @PathVariable("index")Integer index, Map<String, Object> model){

        Page<?> page = PageHelper.startPage(index, 10);
        List<Log> logs = logBiz.getLogByType(type);
        PageInfo<?> pageInfo = page.toPageInfo();

        model.put("TYPE", type);
        model.put("INFO", pageInfo);
        model.put("LIST", logs);
        return "log_list";
    }

    @RequestMapping(value = "/personal/{userId}/list", method = RequestMethod.GET)
    public String list(@PathVariable("userId")Integer userId, Map<String, Object> model){

        return "redirect:list/1";
    }

    @RequestMapping(value = "/personal/{userId}/list/{index}", method = RequestMethod.GET)
    public String list(@PathVariable("userId")Integer userId, @PathVariable("index")Integer index, Map<String, Object> model){

        Page<?> page = PageHelper.startPage(index, 10);
        List<Log> logs = logBiz.getLogByUserId(userId);
        PageInfo<?> pageInfo = page.toPageInfo();

        model.put("TYPE", "personal");
        model.put("INFO", pageInfo);
        model.put("LIST", logs);
        return "log_list";
    }
}
