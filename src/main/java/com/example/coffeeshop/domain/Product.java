package com.example.coffeeshop.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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

    @ManyToMany
    @JoinTable(
            name = "product_likes",
            joinColumns = { @JoinColumn(name = "product_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id")}
    )
    private Set<User> likes = new HashSet<>();

    public Product() {
    }

    public void setDiscount(int discount) {
        this.discount = discount;
        if(discount != 0){
            checkDiscount = true;
        }
        else {
            checkDiscount = false;
        }
    }
}
