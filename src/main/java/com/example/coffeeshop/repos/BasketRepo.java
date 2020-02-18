package com.example.coffeeshop.repos;

import com.example.coffeeshop.domain.Basket;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BasketRepo extends JpaRepository<Basket, Long> {


    Basket findByUserId(Long id);
}
