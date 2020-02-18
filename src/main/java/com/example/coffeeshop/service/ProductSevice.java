package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.*;
import com.example.coffeeshop.domain.dto.ProductDto;
import com.example.coffeeshop.repos.ProdSpecificationRepo;
import com.example.coffeeshop.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class ProductSevice {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProdSpecificationRepo prodSpecificationRepo;

    @Autowired
    private BasketSevice basketSevice;

    public Product addProduct(String productName, String category, String section,
                              int price, int discount, String specification, int number, MultipartFile file) throws IOException {
        Product product = new Product();
        product.setProductName(productName);
        product.setCategory(Category.valueOf(category));
        product.setSection(Section.valueOf(section));
        product.setPrice(price);
        product.setDiscount(discount);
        product.setSpecification(specification);
        product.setNumber(number);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            product.setFilename(resultFilename);
        }

        productRepo.save(product);
        return product;
    }

    public ProductSpecification addProductSpecification(String manufacturer, String composition,
                                           String type, String packaging,
                                           String weight, String country,
                                           String validity, String recommended,
                                           Product product) {
        ProductSpecification prodSpecific = new ProductSpecification();
        prodSpecific.setManufacturer(manufacturer);
        prodSpecific.setComposition(composition);
        prodSpecific.setType(type);
        prodSpecific.setPackaging(packaging);
        prodSpecific.setWeight(weight);
        prodSpecific.setCountry(country);
        prodSpecific.setValidity(validity);
        prodSpecific.setRecommended(recommended);
        prodSpecific.setProduct(product);
        prodSpecificationRepo.save(prodSpecific);
        return prodSpecific;
    }

    public void saveProduct(Long productID, String productName,
                            String category, String section,
                            int price, int discount,
                            String specification, int number) {
        Product prod = productRepo.findById(productID).get();

        prod.setProductName(productName);
        prod.setCategory(Category.valueOf(category));
        prod.setSection(Section.valueOf(section));
        prod.setPrice(price);
        prod.setDiscount(discount);
        prod.setSpecification(specification);
        prod.setNumber(number);

        productRepo.save(prod);
    }

    public void saveProductSpecification(Long prodSpecificID, String manufacturer, String composition,
                                         String type, String packaging,
                                         String weight, String country,
                                         String validity, String recommended) {
        ProductSpecification prodSpecific = prodSpecificationRepo.findById(prodSpecificID).get();

        prodSpecific.setManufacturer(manufacturer);
        prodSpecific.setComposition(composition);
        prodSpecific.setType(type);
        prodSpecific.setPackaging(packaging);
        prodSpecific.setWeight(weight);
        prodSpecific.setCountry(country);
        prodSpecific.setValidity(validity);
        prodSpecific.setRecommended(recommended);

        prodSpecificationRepo.save(prodSpecific);
    }

    public boolean productFormCheckMessage(Long userId, Long productId){
        BasketList basketList = basketSevice.findBasketListByUserId(userId);
        if(basketList.getProductList().contains(productId)){
            if(basketList.isCheckAdd()){
                basketList.setCheckAdd(false);
                basketSevice.saveBasketList(basketList);
                return true;
            }
        }
        return false;
    }

    public Page<ProductDto> findListCategory(Category filter, Pageable pageable, User user) {
        return productRepo.findAllByCategory(filter, pageable, user);
    }

    public Page<ProductDto> findListSection(Section section, Category category, Pageable pageable, User user) {
        return productRepo.findAllBySectionAndCategory(section, category, pageable, user);
    }

    public Page<ProductDto> findListDiscountProduct(Pageable pageable, User user) {
        return productRepo.findAllByCheckDiscountTrue(pageable, user);
    }

    public Product findProductForm(Long id){
        return productRepo.findById(id).get();
    }

    public Page<ProductDto> findAllPage(Pageable pageable, User user){
        return productRepo.findAll(pageable, user);
    }

    public Iterable<Product> findAll(){
        return productRepo.findAll();
    }

    public ProductSpecification findProductSpecificationForm(Long id){
        return prodSpecificationRepo.findByProductId(id);
    }

    public void saveProduct(Product product){
        productRepo.save(product);
    }
}
