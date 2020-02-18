package com.example.coffeeshop.domain.dto;

import com.example.coffeeshop.domain.Category;
import com.example.coffeeshop.domain.Product;
import com.example.coffeeshop.domain.Section;
import lombok.Getter;

@Getter
public class ProductDto {
    private Long id;
    private String productName;
    private Category category;
    private Section section;
    private int price;
    private String specification;
    private int number;
    private int discount;
    private String filename;
    private boolean checkDiscount;

    private Long likes;
    private boolean myLiked;

    public ProductDto(Product product, Long likes, boolean myLiked) {
        this.id = product.getId();
        this.productName = product.getProductName();
        this.category = product.getCategory();
        this.section = product.getSection();
        this.price = product.getPrice();
        this.specification = product.getSpecification();
        this.number = product.getNumber();
        this.discount = product.getDiscount();
        this.filename = product.getFilename();
        this.likes = likes;
        this.myLiked = myLiked;
    }
}
