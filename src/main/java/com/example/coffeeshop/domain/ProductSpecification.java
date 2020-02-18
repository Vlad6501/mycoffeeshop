package com.example.coffeeshop.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "product_specification")
public class ProductSpecification {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String manufacturer;
    private String composition;
    private String type;
    private String packaging;
    private String weight;
    private String country;
    private String validity;
    private String recommended;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "prod_id")
    private Product product;

    public ProductSpecification() {
    }

    public ProductSpecification(String manufacturer, String composition, String type, String packaging, String weight, String country, String validity, String recommended, Product product) {
        this.manufacturer = manufacturer;
        this.composition = composition;
        this.type = type;
        this.packaging = packaging;
        this.weight = weight;
        this.country = country;
        this.validity = validity;
        this.recommended = recommended;
        this.product = product;
    }
}
