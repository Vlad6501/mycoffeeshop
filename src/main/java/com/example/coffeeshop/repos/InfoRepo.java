package com.example.coffeeshop.repos;

import com.example.coffeeshop.domain.Information;
import com.example.coffeeshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface InfoRepo extends JpaRepository<Information, Long> {

    void deleteById(Long id);

    Information findByUser(User user);

    Optional<Information> findById(Long id);
}