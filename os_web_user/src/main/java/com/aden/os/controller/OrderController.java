package com.aden.os.controller;

import com.aden.os.biz.OrderBiz;
import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
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
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderBiz orderBiz;

    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public String buy(@RequestParam("type")String type, HttpSession session, CommodityOrderDetail commodityOrderDetail, Map<String, Object> model){
        User user = (User) session.getAttribute("user");
        Integer userId = user.getId();
        if ("now".equals(type)){
            Integer orderId = orderBiz.buyNow(commodityOrderDetail, userId);
            model.put("DETAIL", orderBiz.get(orderId));
            return "order_pay";

        } else {
            orderBiz.addToShoppingCart(commodityOrderDetail, userId);
            return "redirect:/commodity/detail/"+commodityOrderDetail.getCommodityId();
        }
    }

    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("DETAIL", orderBiz.get(orderId));
        return "order_detail";
    }

    @RequestMapping(value = "/to_pay/{id}", method = RequestMethod.GET)
    public String toPayByGet(@PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("DETAIL", orderBiz.get(orderId));
        return "order_pay";
    }

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public String pay(@RequestParam("orderId")Integer orderId){
        orderBiz.pay(orderId);
        return "redirect:/user/center";
    }

    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    public String cancel(@RequestParam("type")String type, @RequestParam("id")Integer orderId){
        orderBiz.remove(orderId);

        if ("list".equals(type)){
            return "redirect:/order/list/to_be_paid";
        }else{
            return "redirect:/user/center";
        }
    }

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String cart(HttpSession session, Map<String, Object> model){
        User user = (User) session.getAttribute("user");
        CommodityOrder commodityOrder = orderBiz.getCart(user.getId());
        model.put("DETAIL", commodityOrder);
        return "order_cart";
    }

    @RequestMapping(value = "/list/{type}", method = RequestMethod.GET)
    public String list(@PathVariable("type")String type, HttpSession session, Map<String, Object> model){
        User user = (User) session.getAttribute("user");
        model.put("TYPE", type);
        model.put("LIST", orderBiz.getOrderList(user.getId(), type));
        return "order_list";
    }
}
