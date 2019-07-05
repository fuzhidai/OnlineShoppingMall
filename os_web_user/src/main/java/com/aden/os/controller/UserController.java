package com.aden.os.controller;

import com.aden.os.biz.OrderBiz;
import com.aden.os.biz.UserBiz;
import com.aden.os.biz.job.QuartzTest;
import com.aden.os.biz.producer.FileUploadProducer;
import com.aden.os.entity.User;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Map;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {

    @Autowired
    private UserBiz userBiz;
    @Autowired
    private OrderBiz orderBiz;

    @RequestMapping(value = "/to_registered", method = RequestMethod.GET)
    public String toRegistered(){
        return "user_registered";
    }

    @RequestMapping(value = "/to_login", method = RequestMethod.GET)
    public String toLogin(){
        return "user_login";
    }

    @RequestMapping(value = "/to_edit", method = RequestMethod.GET)
    public String toEdit(){
        return "user_edit";
    }

    @RequestMapping(value = "/center", method = RequestMethod.GET)
    public String center(HttpSession session, Map<String, Object> model){
        User user = (User) session.getAttribute("user");
        Integer userId = user.getId();
        model.put("LIST", orderBiz.getByUserId(userId));
        return "user_center";
    }

    @RequestMapping(value = "/registered", method = RequestMethod.POST)
    public String registered(User user, HttpSession session){
        userBiz.add(user);
        session.setAttribute("user", user);
        return "redirect:/commodity/homepage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("phone") String phone, @RequestParam("password") String password, HttpSession session){
        User user = userBiz.verifyInfo(phone, password);
        session.setAttribute("user", user);
        return "redirect:/commodity/homepage";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String signOut(HttpSession session, SessionStatus sessionStatus){
        session.removeAttribute("user");
        sessionStatus.setComplete();
        return "redirect:to_login";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(User inputUser, HttpSession session){

        User user = (User) session.getAttribute("user");

        user.setName(inputUser.getName());
        user.setNickname(inputUser.getNickname());
        user.setEmail(inputUser.getEmail());
        user.setAddress(inputUser.getAddress());
        userBiz.edit(user);

        session.setAttribute("user", user);

        return "redirect:center";
    }

    @RequestMapping(value = "/change_password", method = RequestMethod.POST)
    public String changePassword(@RequestParam("phone") String phone, @RequestParam("password") String password, HttpSession session){
        userBiz.changePassword(phone, password);
        User user = (User) session.getAttribute("user");
        user.setPassword(password);
        session.setAttribute("user", user);

        return "redirect:to_login";
    }
}
