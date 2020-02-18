package com.example.coffeeshop.repos;

import com.example.coffeeshop.domain.BasketList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BasketListRepo extends JpaRepository<BasketList, Long> {

    BasketList findByBasketId(Long id);
}
