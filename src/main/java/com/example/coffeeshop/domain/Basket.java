package com.example.coffeeshop.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "basket")
public class Basket {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int price;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "bask_id")
    private User user;

    public Basket() {
    }
}
