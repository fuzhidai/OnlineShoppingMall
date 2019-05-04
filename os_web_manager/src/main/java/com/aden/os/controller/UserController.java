package com.aden.os.controller;

import com.aden.os.biz.UserBiz;
import com.aden.os.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/backstage/user")
public class UserController {

    @Autowired
    private UserBiz userBiz;

    @RequestMapping(value = "/to_login", method = RequestMethod.GET)
    public String toLogin(){
        return "user_login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("phone") String phone, @RequestParam("password") String password, HttpSession session){
        User user = userBiz.verifyInfo(phone, password);
        if (user == null){
            return "redirect:to_login";
        }
        session.setAttribute("user", user);
        return "redirect:/backstage/commodity/list/all";
    }

    @RequestMapping(value = "/{identity}/list", method = RequestMethod.GET)
    public String list(@PathVariable("identity")String identity, Map<String, Object> model){
        model.put("TYPE", identity);
        model.put("LIST", userBiz.getByIdentity(identity));
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
