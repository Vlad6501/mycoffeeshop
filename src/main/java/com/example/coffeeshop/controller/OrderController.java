package com.example.coffeeshop.controller;

import com.example.coffeeshop.domain.*;
import com.example.coffeeshop.repos.OrderRepo;
import com.example.coffeeshop.service.BasketSevice;
import com.example.coffeeshop.service.InformationSevice;
import com.example.coffeeshop.service.OrderSevice;
import com.example.coffeeshop.service.ProductSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private ProductSevice productSevice;

    @Autowired
    private InformationSevice informationSevice;

    @Autowired
    private OrderSevice orderSevice;

    @Autowired
    private BasketSevice basketSevice;

    @GetMapping("/basket/createOrderForm/{userId}")
    public String createOrderForm(@PathVariable Long userId,
                                  Model model){
        model.addAttribute("info", informationSevice.findByUser(userId));

        model.addAttribute("baskets", basketSevice.findAllBaskets());
        model.addAttribute("basketsList", basketSevice.findAllBasketsList());
        model.addAttribute("productList", productSevice.findAll());
        return "createOrderForm";
    }

    @PostMapping("/basket/createOrderForm")
    public String createOrder(@RequestParam("userID") Long userId,
                              @RequestParam String firstname,
                              @RequestParam String lastname,
                              @RequestParam String patronymic,
                              @RequestParam String phone,
                              @RequestParam String city,
                              @RequestParam String address,
                              @RequestParam String paymentMethod){
        orderSevice.saveOrderForm(firstname, lastname, patronymic, phone, city, address, userId);
        orderSevice.createOrder(userId, paymentMethod);
        return "redirect:/";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/account/allOrderList")
    public String allOrderList(@RequestParam(required = false, defaultValue = "") String username, Model model){
        List<Order> orders = orderSevice.findListAll();

        if (username != null && !username.isEmpty()) {
            orders = orderRepo.findAllByUser_Username(username);
        }

        model.addAttribute("ordersList", orders);
        model.addAttribute("username", username);
        model.addAttribute("productList", productSevice.findAll());
        model.addAttribute("information", informationSevice.findAll());
        return "allOrderList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/account/allOrderList/{orderId}")
    public String OrderEditForm(@PathVariable Order orderId, Model model){
        model.addAttribute("order", orderId);
        return "orderEditForm";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/account/allOrderList")
    public String saveOrder(@RequestParam String status,
                              @RequestParam String payment,
                              @RequestParam("orderID") Long order){

        orderSevice.saveOrder(order, status, payment);
        return "redirect:/account/allOrderList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/account/allOrderList/delete/{orderId}")
    public String deleteOrder(@PathVariable Order orderId){
        orderSevice.deleteOrder(orderId.getId());
        return "redirect:/account/allOrderList";
    }
}
