package com.example.coffeeshop.repos;

import com.example.coffeeshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepo extends JpaRepository<User, Long> {

    List<User> findListByUsername(String username);

    User findByUsername(String username);

    User findByEmail(String email);

    Optional<User> findById(Long id);

    User findByActivationCode(String code);

    void deleteById(Long id);
}
