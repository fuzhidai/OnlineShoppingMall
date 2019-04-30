package com.aden.os.controller;

import com.aden.os.biz.UserBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/backstage/user")
public class UserController {

    @Autowired
    private UserBiz userBiz;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Map<String, Object> model){
        model.put("TYPE", "user_list");
        model.put("LIST", userBiz.getAll());
        return "user_list";
    }

    @RequestMapping(value = "/change_status/{id}/{status}", method = RequestMethod.GET)
    public String changeStatus(@PathVariable("id")Integer id, @PathVariable("status")String status, Map<String, Object> model){
        model.put("TYPE", "user_list");
        userBiz.changeStatus(id, status);
        model.put("LIST", userBiz.getAll());
        return "user_list";
    }

    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id")Integer id, Map<String, Object> model){
        model.put("TYPE", "user_list");
        model.put("DETAIL", userBiz.get(id));
        return "user_detail";
    }
}
