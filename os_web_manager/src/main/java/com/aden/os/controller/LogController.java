package com.aden.os.controller;

import com.aden.os.biz.LogBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/backstage/log")
public class LogController {

    @Autowired
    private LogBiz logBiz;

    @RequestMapping(value = "/{type}/list", method = RequestMethod.GET)
    public String list(@PathVariable("type")String type, Map<String, Object> model){

        model.put("TYPE", type);
        model.put("LIST", logBiz.getLogByType(type));
        return "log_list";
    }

    @RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
    public String list(@PathVariable("id")Integer userId, Map<String, Object> model){

        model.put("TYPE", "personal");
        model.put("LIST", logBiz.getLogByUserId(userId));
        return "log_list";
    }
}
