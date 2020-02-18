package com.example.coffeeshop.controller;

import com.example.coffeeshop.domain.*;
import com.example.coffeeshop.repos.ProdSpecificationRepo;
import com.example.coffeeshop.repos.ProductRepo;
import com.example.coffeeshop.service.ProductSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/account/productList")
public class ProductController {

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProdSpecificationRepo prodSpecificationRepo;

    @Autowired
    private ProductSevice productSevice;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String productList(Model model){
        Iterable<Product> product = productRepo.findAll();

        model.addAttribute("productList", product);
        return "productList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/newProduct")
    public String addProduct() {
        return "newProduct";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/newProduct")
    public String addProduct(@RequestParam String productName,
                             @RequestParam String category,
                             @RequestParam String section,
                             @RequestParam int price,
                             @RequestParam int discount,
                             @RequestParam String specification,
                             @RequestParam int number,
                             @RequestParam("file") MultipartFile file,
                             @RequestParam String manufacturer,
                             @RequestParam String composition,
                             @RequestParam String type,
                             @RequestParam String packaging,
                             @RequestParam String weight,
                             @RequestParam String country,
                             @RequestParam String validity,
                             @RequestParam String recommended,
                             Model model) throws IOException {
        Product product = productSevice.addProduct(productName, category, section, price, discount, specification, number, file);
        ProductSpecification prodSpecific = productSevice.addProductSpecification(manufacturer, composition, type, packaging, weight, country, validity, recommended, product);

        model.addAttribute("product", product);
        model.addAttribute("prodSpecific", prodSpecific);

        Iterable<Product> products = productRepo.findAll();
        Iterable<ProductSpecification> prodSpecifics = prodSpecificationRepo.findAll();
        model.addAttribute("productList", products);
        model.addAttribute("prodSpecificList", prodSpecifics);
        return "redirect:/account/productList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{productId}")
    public String productEditForm(@PathVariable Product productId, Model model) {
        model.addAttribute("prod", productId);
        ProductSpecification prodSpecific = prodSpecificationRepo.findByProductId(productId.getId());
        model.addAttribute("prodSpecific", prodSpecific);
        return "productEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String productSave(
            @RequestParam String productName,
            @RequestParam String category,
            @RequestParam String section,
            @RequestParam int price,
            @RequestParam int discount,
            @RequestParam String specification,
            @RequestParam int number,
            @RequestParam("productID") Long product,
            @RequestParam String manufacturer,
            @RequestParam String composition,
            @RequestParam String type,
            @RequestParam String packaging,
            @RequestParam String weight,
            @RequestParam String country,
            @RequestParam String validity,
            @RequestParam String recommended,
            @RequestParam("prodSpecificID") Long prodSpecific
    ){
        productSevice.saveProduct(product, productName, category, section, price, discount, specification, number);
        productSevice.saveProductSpecification(prodSpecific, manufacturer, composition, type, packaging, weight, country, validity, recommended);
        return "redirect:/account/productList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/delete/{productId}")
    public String deleteProduct(@PathVariable Long productId){
        prodSpecificationRepo.deleteByProductId(productId);
        productRepo.deleteById(productId);
        return "redirect:/account/productList";
    }
}
