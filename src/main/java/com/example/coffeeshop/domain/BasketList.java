package com.example.coffeeshop.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "basket_list")
public class BasketList {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    @ElementCollection(targetClass=Long.class)
    private List<Long> productList;
    @Column
    @ElementCollection(targetClass=Integer.class)
    private List<Integer> numberList;
    private boolean checkAdd;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "basket_id")
    private Basket basket;

    public BasketList() {
    }
}
