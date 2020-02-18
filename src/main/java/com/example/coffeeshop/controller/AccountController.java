package com.example.coffeeshop.controller;

import com.example.coffeeshop.domain.Information;
import com.example.coffeeshop.domain.Order;
import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.service.InformationSevice;
import com.example.coffeeshop.service.OrderSevice;
import com.example.coffeeshop.service.ProductSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AccountController {

    @Autowired
    private OrderSevice orderSevice;

    @Autowired
    private InformationSevice informationSevice;

    @Autowired
    private ProductSevice productSevice;

    @GetMapping("/account")
    public String account() {
        return "account";
    }

    @GetMapping("/account/information")
    public String main(Model model) {
        model.addAttribute("users", informationSevice.findAll());
        return "information";
    }

    @PostMapping("/account/information")
    public String add(@RequestParam String firstname,
                      @RequestParam String lastname,
                      @RequestParam String patronymic,
                      @RequestParam String email,
                      @RequestParam String phone,
                      @RequestParam String city,
                      @RequestParam String address,
                      @RequestParam("userID") Long userId,
                      Model model) {
        Information info = informationSevice.findByUser(userId);
        informationSevice.addInfo(firstname, lastname, patronymic, email, phone, city, address, info);
        model.addAttribute("users", informationSevice.findAll());
        return "information";
    }

    @GetMapping("/account/information/{infoId}")
    public String informationEditForm(@PathVariable Long infoId,
                                      Model model) {
        model.addAttribute("info", informationSevice.findById(infoId));
        return "informationEdit";
    }

    @GetMapping("/account/orders")
    public String orders(@PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                         Model model) {
        Page<Order> page = orderSevice.findListAllPage(pageable);
        model.addAttribute("url", "/account/orders");
        model.addAttribute("page", page);
        model.addAttribute("productList", productSevice.findAll());
        return "ordersList";
    }

    @GetMapping("/account/favoriteProducts")
    public String favoriteProducts( @AuthenticationPrincipal User user,
                                   @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                                   Model model) {
        model.addAttribute("page", productSevice.findAllPage(pageable, user));
        model.addAttribute("url", "/account/favoriteProducts");
        return "favoriteProducts";
    }
}