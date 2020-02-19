package com.example.coffeeshop.repos;

import com.example.coffeeshop.domain.Category;
import com.example.coffeeshop.domain.Product;
import com.example.coffeeshop.domain.Section;
import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.domain.dto.ProductDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductRepo extends CrudRepository<Product, Long> {

    void deleteById(Long id);

    Optional<Product> findById(Long id);


    @Query("select new com.example.coffeeshop.domain.dto.ProductDto(" +
            "   p, " +
            "   count(pl), " +
            "   sum(case when pl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Product p left join p.likes pl " +
            "where p.category =:category " +
            "group by p")
    Page<ProductDto> findAllByCategory(@Param("category")Category category, Pageable pageable, @Param("user") User user);


    @Query("select new com.example.coffeeshop.domain.dto.ProductDto(" +
            "   p, " +
            "   count(pl), " +
            "   sum(case when pl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Product p left join p.likes pl " +
            "where p.checkDiscount =true " +
            "group by p")
    Page<ProductDto> findAllByCheckDiscountTrue(Pageable pageable, @Param("user") User user);


    @Query("select new com.example.coffeeshop.domain.dto.ProductDto(" +
            "   p, " +
            "   count(pl), " +
            "   sum(case when pl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Product p left join p.likes pl " +
            "where p.category =:category and p.section =:section " +
            "group by p")
    Page<ProductDto> findAllBySectionAndCategory(@Param("section")Section section, @Param("category")Category category, Pageable pageable, @Param("user") User user);


    @Query("select new com.example.coffeeshop.domain.dto.ProductDto(" +
            "   p, " +
            "   count(pl), " +
            "   sum(case when pl = :user then 1 else 0 end) > 0" +
            ") " +
            "from Product p left join p.likes pl " +
            "group by p")
    Page<ProductDto> findAll(Pageable pageable, @Param("user") User user);

}
