package com.example.coffeeshop.repos;

import com.example.coffeeshop.domain.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrderRepo extends JpaRepository<Order, Long> {

    void deleteById(Long id);

    Optional<Order> findById(Long id);

    List<Order> findAllByUser_Username(String username);

    List<Order> findAllByUser_Id(Long id);

    Page<Order> findAll(Pageable pageable);
}
