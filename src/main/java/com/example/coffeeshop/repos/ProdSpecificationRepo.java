package com.example.coffeeshop.repos;

import com.example.coffeeshop.domain.ProductSpecification;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProdSpecificationRepo extends JpaRepository<ProductSpecification, Long> {

    void deleteByProductId(Long id);

    ProductSpecification findByProductId(Long id);

    Optional<ProductSpecification> findById(Long id);
}
