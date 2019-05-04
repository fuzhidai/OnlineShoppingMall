package com.aden.os.controller;

import com.aden.os.biz.EvaluationBiz;
import com.aden.os.biz.OrderBiz;
import com.aden.os.biz.OrderProcessingRecordBiz;
import com.aden.os.entity.CommodityOrder;
import com.aden.os.entity.CommodityOrderDetail;
import com.aden.os.entity.Evaluation;
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
    @Autowired
    private OrderProcessingRecordBiz orderProcessingRecordBiz;
    @Autowired
    private EvaluationBiz evaluationBiz;

    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public String buy(@RequestParam("type")String type, HttpSession session, CommodityOrderDetail commodityOrderDetail, Map<String, Object> model){
        User user = (User) session.getAttribute("user");
        Integer userId = user.getId();
        if ("now".equals(type)){
            Integer orderId = orderBiz.buyNow(commodityOrderDetail, userId);
            model.put("DETAIL", orderBiz.get(orderId));
            return "order_operating";

        } else {
            orderBiz.addToShoppingCart(commodityOrderDetail, userId);
            return "redirect:/commodity/detail/"+commodityOrderDetail.getCommodityId();
        }
    }

    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("DETAIL", orderBiz.get(orderId));
        model.put("RECORD", orderProcessingRecordBiz.getOrderProcessingRecord(orderId));
        return "order_detail";
    }

    @RequestMapping(value = "/to_pay/{id}", method = RequestMethod.GET)
    public String toPay(@PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("DETAIL", orderBiz.get(orderId));
        return "order_operating";
    }

    @RequestMapping(value = "/to_confirm_receipt/{id}", method = RequestMethod.GET)
    public String toConfirmReceipt(@PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("DETAIL", orderBiz.get(orderId));
        return "order_operating";
    }

    @RequestMapping(value = "/to_comment_order/{id}", method = RequestMethod.GET)
    public String toCommentOrder(@PathVariable("id")Integer orderId, Map<String, Object> model){
        model.put("DETAIL", orderBiz.get(orderId));
        return "order_operating";
    }

    @RequestMapping(value = "/to_comment_commodity/{id}", method = RequestMethod.GET)
    public String toCommentCommodity(@PathVariable("id")Integer orderDetailId, Map<String, Object> model){
        model.put("ORDER_ID", orderDetailId);
        model.put("DETAIL", orderBiz.getCommodityNameByOrderDetail(orderDetailId));
        return "order_evaluation";
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

    @RequestMapping(value = "/confirm_receipt", method = RequestMethod.POST)
    public String confirmReceipt(@RequestParam("orderId")Integer orderId){
        orderBiz.confirmReceipt(orderId);
        return "redirect:/user/center";
    }

    @RequestMapping(value = "/comment_order", method = RequestMethod.POST)
    public String commentOrder(@RequestParam("orderId")Integer orderId){
        orderBiz.completed(orderId);
        return "redirect:/user/center";
    }

    @RequestMapping(value = "/comment_commodity", method = RequestMethod.POST)
    public String commentCommodity(@RequestParam("orderId")Integer orderId, Evaluation evaluation){
        evaluationBiz.add(evaluation);
        return "redirect:/order/to_comment_order/" + orderId;
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
