package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.BasketList;
import com.example.coffeeshop.domain.Product;
import com.example.coffeeshop.domain.ProductSpecification;
import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.repos.ProdSpecificationRepo;
import com.example.coffeeshop.repos.ProductRepo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProductSeviceTest {
    @Autowired
    private ProductSevice productSevice;

    @MockBean
    private BasketSevice basketSevice;

    @MockBean
    private ProductRepo productRepo;

    @MockBean
    private ProdSpecificationRepo prodSpecificationRepo;


    @Test
    public void addProduct() throws Exception {
        FileInputStream fis = new FileInputStream(new File("C:/Users/vladk/Desktop/mycoffeeshop/src/test/resources/9280.jpg"));
        MultipartFile file = new MockMultipartFile("file", "9280.jpg", "", fis);
        Product product = productSevice.addProduct(
                "Pelican Rouge",
                "COFFEE",
                "GRAINS",
                245,
                0,
                "specification",
                29,
                file);

        Assert.assertNotNull(product.getProductName());
        Assert.assertNotNull(product.getCategory());
        Assert.assertNotNull(product.getSection());
        Assert.assertNotEquals(0, product.getPrice());
        Assert.assertEquals(0, product.getDiscount());
        Assert.assertNotNull(product.getSpecification());
        Assert.assertNotEquals(0, product.getNumber());
        Assert.assertNotNull(product.getFilename());

        Mockito.verify(productRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(Product.class));
    }

    @Test
    public void addProductFailTest() throws Exception {
        Product product = productSevice.addProduct(
                "Pelican Rouge",
                "COFFEE",
                "GRAINS",
                245,
                0,
                "specification",
                29,
                null);

        Assert.assertNotNull(product.getProductName());
        Assert.assertNotNull(product.getCategory());
        Assert.assertNotNull(product.getSection());
        Assert.assertNotEquals(0, product.getPrice());
        Assert.assertEquals(0, product.getDiscount());
        Assert.assertNotNull(product.getSpecification());
        Assert.assertNotEquals(0, product.getNumber());

        Assert.assertNull(product.getFilename());

        Mockito.verify(productRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(Product.class));
    }

    @Test
    public void addProductSpecification() {
        Product product = new Product();
        ProductSpecification prodSpecific = productSevice.addProductSpecification(
                "Pelican Rouge",
                "60% Арабика, 40% Робуста ",
                "Капсулы",
                "Коробка 10 капсул по 5 гр.",
                "50 г",
                "Нидерланды",
                "24 месяцев со дня упаковки",
                "Эспрессо, Ho.Re.Ca.",
                product
        );

        Assert.assertNotNull(prodSpecific.getProduct());
        Mockito.verify(prodSpecificationRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(ProductSpecification.class));
    }

    @Test
    public void productFormCheckMessage() {
        User user = new User();
        Product product = new Product();
        product.setId(2L);
        BasketList basketList = new BasketList();

        basketList.setProductList(new ArrayList<>());
        basketList.getProductList().add(product.getId());
        basketList.setCheckAdd(true);

        Mockito.doReturn(basketList)
                .when(basketSevice)
                .findBasketListByUserId(user.getId());
        boolean isProductFormCheckMessage = productSevice.productFormCheckMessage(user.getId(), product.getId());

        Assert.assertTrue(isProductFormCheckMessage);

        Mockito.verify(basketSevice, Mockito.times(1))
                .saveBasketList(ArgumentMatchers.any(BasketList.class));
    }
}
