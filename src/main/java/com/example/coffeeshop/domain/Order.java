package com.example.coffeeshop.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    @ElementCollection(targetClass=Long.class)
    private List<Long> productList;
    @Column
    @ElementCollection(targetClass=Integer.class)
    private List<Integer> numberList;
    private Date date;
    private int price;
    private String status;
    private String payment;
    private String paymentMethod;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ord_id")
    private User user;

    public Order() {
    }
}
