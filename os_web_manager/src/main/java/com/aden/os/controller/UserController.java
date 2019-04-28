package com.aden.os.controller;

import com.aden.os.biz.UserBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
