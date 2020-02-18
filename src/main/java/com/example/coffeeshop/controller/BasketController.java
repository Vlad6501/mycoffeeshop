package com.example.coffeeshop.controller;

import com.example.coffeeshop.service.BasketSevice;
import com.example.coffeeshop.service.ProductSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class BasketController {

    @Autowired
    private BasketSevice basketSevice;

    @Autowired
    private ProductSevice productSevice;

    @GetMapping("/account/basket")
    public String userBasket(Model model) {
        model.addAttribute("baskets", basketSevice.findAllBaskets());
        model.addAttribute("basketsList", basketSevice.findAllBasketsList());
        model.addAttribute("productList", productSevice.findAll());
        return "basket";
    }

    @GetMapping("/account/basket/deleteAllBasket/{userId}")
    public String deleteAllBasket(@PathVariable Long userId) {
        basketSevice.deleteAllBasket(userId);
        return "redirect:/account/basket";
    }

    @GetMapping("/account/basket/deleteProductInBasket/{userId}/{productId}")
    public String deleteProduct(@PathVariable Long userId, @PathVariable Long productId) {
        basketSevice.deleteProduct(userId, productId);
        return "redirect:/account/basket";
    }
}
