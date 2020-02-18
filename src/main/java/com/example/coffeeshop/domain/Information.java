package com.example.coffeeshop.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "information")
public class Information {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String firstname;
    private String lastname;
    private String patronymic;
    private String email;
    private String phone;
    private String city;
    private String address;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "inf_id")
    private User user;

    public Information(){}
}