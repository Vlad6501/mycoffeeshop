package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.Basket;
import com.example.coffeeshop.domain.BasketList;
import com.example.coffeeshop.domain.Product;
import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.repos.BasketListRepo;
import com.example.coffeeshop.repos.BasketRepo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BasketSeviceTest {
    @Autowired
    private BasketSevice basketSevice;

    @MockBean
    private ProductSevice productSevice;

    @MockBean
    private BasketRepo basketRepo;

    @MockBean
    private BasketListRepo basketListRepo;

    @Test
    public void basketAddCheck() {
        User user = new User();
        Product product = new Product();
        Basket basket = new Basket();
        BasketList basketList = new BasketList();

        product.setNumber(20);
        int checkNumber = 2;

        Mockito.doReturn(basket)
                .when(basketRepo)
                .findByUserId(user.getId());
        Mockito.doReturn(basketList)
                .when(basketListRepo)
                .findByBasketId(basket.getId());
        boolean isBasketAddCheck = basketSevice.basketAddCheck(user.getId(), product, checkNumber);

        Assert.assertTrue(isBasketAddCheck);
        Assert.assertFalse(basketList.isCheckAdd());

        Mockito.verify(basketListRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(BasketList.class));
    }

    @Test
    public void basketAddCheckFailTest() {
        User user = new User();
        Product product = new Product();
        Basket basket = new Basket();
        BasketList basketList = new BasketList();

        product.setNumber(5);
        int checkNumber = 7;

        Mockito.doReturn(basket)
                .when(basketRepo)
                .findByUserId(user.getId());
        Mockito.doReturn(basketList)
                .when(basketListRepo)
                .findByBasketId(basket.getId());
        boolean isBasketAddCheck = basketSevice.basketAddCheck(user.getId(), product, checkNumber);

        Assert.assertFalse(isBasketAddCheck);
        Assert.assertTrue(basketList.isCheckAdd());

        Mockito.verify(basketListRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(BasketList.class));
    }

    @Test
    public void basketAdd() {
        User user = new User();
        Product product = new Product();
        Basket basket = new Basket();
        BasketList basketList = new BasketList();
        basketList.setProductList(new ArrayList<>());
        basketList.setNumberList(new ArrayList<>());

        product.setNumber(5);
        product.setPrice(125);
        int checkNumber = 2;

        Mockito.doReturn(basket)
                .when(basketRepo)
                .findByUserId(user.getId());
        Mockito.doReturn(basketList)
                .when(basketListRepo)
                .findByBasketId(basket.getId());
        Mockito.doReturn(product)
                .when(productSevice)
                .findProductForm(product.getId());
        basketSevice.basketAdd(user.getId(), product.getId(), checkNumber);

        int index = basketList.getProductList().indexOf(product.getId());
        int number = basketList.getNumberList().get(index);

        Assert.assertEquals(3, product.getNumber());
        Assert.assertTrue(basketList.getProductList().contains(product.getId()));
        Assert.assertTrue(basketList.getNumberList().contains(checkNumber));
        Assert.assertEquals(checkNumber, number);
        Assert.assertEquals(250, number * product.getPrice());

        Mockito.verify(basketRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(Basket.class));
        Mockito.verify(basketListRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(BasketList.class));
        Mockito.verify(productSevice, Mockito.times(1))
                .saveProduct(ArgumentMatchers.any(Product.class));
    }

    @Test
    public void deleteAllBasket() {
        User user = new User();
        Product product = new Product();
        Basket basket = new Basket();
        BasketList basketList = new BasketList();
        basketList.setProductList(new ArrayList<>());
        basketList.setNumberList(new ArrayList<>());
        basketList.getProductList().add(product.getId());

        product.setNumber(5);
        int checkNumber = 2;
        basketList.getNumberList().add(checkNumber);

        Mockito.doReturn(basket)
                .when(basketRepo)
                .findByUserId(user.getId());
        Mockito.doReturn(basketList)
                .when(basketListRepo)
                .findByBasketId(basket.getId());
        Mockito.doReturn(product)
                .when(productSevice)
                .findProductForm(product.getId());
        basketSevice.deleteAllBasket(user.getId());

        Assert.assertEquals(7, product.getNumber());
        Assert.assertFalse(basketList.getProductList().contains(product.getId()));
        Assert.assertFalse(basketList.getNumberList().contains(checkNumber));
        Assert.assertEquals(0, basket.getPrice());

        Mockito.verify(basketRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(Basket.class));
        Mockito.verify(basketListRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(BasketList.class));
        Mockito.verify(productSevice, Mockito.times(1))
                .saveProduct(ArgumentMatchers.any(Product.class));
    }

    @Test
    public void deleteProduct() {
        User user = new User();
        Product product = new Product();
        Product productTwo = new Product();
        product.setId(1L);
        productTwo.setId(2L);
        Basket basket = new Basket();
        BasketList basketList = new BasketList();
        basketList.setProductList(new ArrayList<>());
        basketList.setNumberList(new ArrayList<>());
        basketList.getProductList().add(product.getId());
        basketList.getProductList().add(productTwo.getId());

        product.setNumber(5);
        product.setPrice(125);
        productTwo.setNumber(9);
        productTwo.setPrice(340);
        int checkNumber = 2;
        basketList.getNumberList().add(checkNumber);
        basketList.getNumberList().add(checkNumber);
        basket.setPrice(930);

        int index = basketList.getProductList().indexOf(product.getId());
        int number = basketList.getNumberList().get(index);

        Mockito.doReturn(basket)
                .when(basketRepo)
                .findByUserId(user.getId());
        Mockito.doReturn(basketList)
                .when(basketListRepo)
                .findByBasketId(basket.getId());
        Mockito.doReturn(product)
                .when(productSevice)
                .findProductForm(product.getId());
        basketSevice.deleteProduct(user.getId(), product.getId());

        Assert.assertEquals(7, product.getNumber());
        Assert.assertEquals(9, productTwo.getNumber());
        Assert.assertFalse(basketList.getProductList().contains(product.getId()));
        Assert.assertEquals(checkNumber, number);
        Assert.assertEquals(680, basket.getPrice());

        Mockito.verify(basketRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(Basket.class));
        Mockito.verify(basketListRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(BasketList.class));
        Mockito.verify(productSevice, Mockito.times(1))
                .saveProduct(ArgumentMatchers.any(Product.class));
    }
}
