package com.aden.os.controller;

import com.aden.os.biz.OrderBiz;
import com.aden.os.entity.CommodityOrderDetail;
import com.aden.os.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderBiz orderBiz;

    @RequestMapping(value = "/buy_now", method = RequestMethod.POST)
    public String buyNow(HttpSession session, CommodityOrderDetail commodityOrderDetail){
        User user = (User) session.getAttribute("user");
        if (user == null){
            return "redirect:/user/to_login";
        }

        Integer userId = user.getId();
        orderBiz.buyNow(commodityOrderDetail, userId);
        return "redirect:/user/center";
    }

    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id")Integer order_id, Map<String, Object> model){
        model.put("DETAIL", orderBiz.get(order_id));
        return "order_detail";
    }
}
