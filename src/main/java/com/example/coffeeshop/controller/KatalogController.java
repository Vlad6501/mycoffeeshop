package com.example.coffeeshop.controller;

import java.util.Set;

import com.example.coffeeshop.domain.*;
import com.example.coffeeshop.domain.dto.ProductDto;
import com.example.coffeeshop.service.BasketSevice;
import com.example.coffeeshop.service.ProductSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
public class KatalogController {

    @Autowired
    private BasketSevice basketSevice;

    @Autowired
    private ProductSevice productSevice;

    @GetMapping("/katalog")
    public String katalog() {
        return "katalog";
    }

    @GetMapping("/katalog/product/{productId}/{userId}")
    public String productForm(@PathVariable Long productId,
                              @PathVariable Long userId,
                              Model model){
        Product products = productSevice.findProductForm(productId);
        ProductSpecification prodSpecifics = productSevice.findProductSpecificationForm(productId);

        boolean message = productSevice.productFormCheckMessage(userId, productId);
        model.addAttribute("product", products);
        model.addAttribute("prodSpecific", prodSpecifics);
        model.addAttribute("message", message);
        return "productForm";
    }

    @PostMapping("/katalog/product")
    public String addProductInBasket(@AuthenticationPrincipal User user,
                                     @RequestParam int checkNumber,
                                     @RequestParam("productID") Long productId,
                                     @RequestParam("userID") Long userId){
        if(user != null){
            Product products = productSevice.findProductForm(productId);

            if(basketSevice.basketAddCheck(userId, products, checkNumber)){
                basketSevice.basketAdd(userId, productId, checkNumber);
                return "redirect:/account/basket";
            }
            return "redirect:/katalog/product/" + productId + "/" + userId;
        }
        return "redirect:/login";
    }

    @GetMapping("/katalog/{category}")
    public String productListOfCategory(@PathVariable String category,
                                        @AuthenticationPrincipal User user,
                                        @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                                        Model model){
        String categoryUp = category.toUpperCase();
        Page<ProductDto> page = productSevice.findListCategory(Category.valueOf(categoryUp), pageable, user);

        model.addAttribute("url", "/katalog/" + category);
        model.addAttribute("page", page);
        model.addAttribute("category", category);
        return category;
    }

    @GetMapping("/katalog/{category}/{section}")
    public String productListOfSection(@PathVariable String category,
                                       @PathVariable String section,
                                       @AuthenticationPrincipal User user,
                                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
                                       Model model){
        String categoryUp = category.toUpperCase();
        String sectionUp = section.toUpperCase();
        Page<ProductDto> page = productSevice.findListSection(Section.valueOf(sectionUp), Category.valueOf(categoryUp), pageable, user);

        model.addAttribute("url", "/katalog/" + category + "/" + section);
        model.addAttribute("page", page);
        model.addAttribute("category", category);
        model.addAttribute("section", section);
        return category;
    }

    @GetMapping("/katalog/{currentUser}/{product}/like")
    public String like(
            @PathVariable User currentUser,
            @PathVariable Product product,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        if(currentUser == null){
            return "/login";
        }

        Set<User> likes = product.getLikes();

        if (likes.contains(currentUser)) {
            product.getLikes().remove(currentUser);
        } else {
            product.getLikes().add(currentUser);
        }
        productSevice.saveProduct(product);

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }

}
