package com.example.coffeeshop.controller;

import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.domain.dto.ProductDto;
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
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private ProductSevice productSevice;

    @GetMapping
    public String home(@PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                       @AuthenticationPrincipal User user,
                       Model model) {
        Page<ProductDto> page = productSevice.findAllPage(pageable, user);
        model.addAttribute("page", page);
        return "home";
    }

    @GetMapping("discount")
    public String discount(@PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                           @AuthenticationPrincipal User user,
                           Model model){
        Page<ProductDto> page = productSevice.findListDiscountProduct(pageable, user);

        model.addAttribute("url", "/discount");
        model.addAttribute("page", page);
        return "discount";
    }

    @GetMapping("aboutUs")
    public String aboutUs(){
        return "aboutUs";
    }

    @GetMapping("delivery")
    public String delivery(){
        return "delivery";
    }

    @GetMapping("contact")
    public String contact(){
        return "contact";
    }

    @GetMapping("warranty")
    public String warranty(){
        return "warranty";
    }
}
