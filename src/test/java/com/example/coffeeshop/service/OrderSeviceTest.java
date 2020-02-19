package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.*;
import com.example.coffeeshop.repos.BasketListRepo;
import com.example.coffeeshop.repos.BasketRepo;
import com.example.coffeeshop.repos.OrderRepo;
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
public class OrderSeviceTest {
    @Autowired
    private OrderSevice orderSevice;

    @MockBean
    private BasketRepo basketRepo;

    @MockBean
    private BasketListRepo basketListRepo;

    @MockBean
    private BasketSevice basketSevice;

    @MockBean
    private UserSevice userSevice;

    @MockBean
    private OrderRepo orderRepo;

    @MockBean
    private InformationSevice informationSevice;

    @Test
    public void createOrder() {
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
        basket.setPrice(400);

        String paymentMethod = "Наложенный платеж";

        Mockito.doReturn(basketList)
                .when(basketListRepo)
                .findByBasketId(basket.getId());
        Mockito.doReturn(basket)
                .when(basketSevice)
                .findBasketByUser(user.getId());
        Mockito.doReturn(user)
                .when(userSevice)
                .findById(user.getId());
        orderSevice.createOrder(user.getId(), paymentMethod);

        Mockito.verify(orderRepo, Mockito.times(1))
                .save(ArgumentMatchers.any(Order.class));
        Mockito.verify(basketSevice, Mockito.times(1))
                .deleteAllBasket(user.getId());
    }

    @Test
    public void saveOrderForm() {
        User user = new User();

        Mockito.doReturn(new Information())
                .when(informationSevice)
                .findByUser(user.getId());
        Information information = orderSevice.saveOrderForm(
                "f",
                "l",
                "p",
                "p",
                "c",
                "a",
                user.getId());

        Assert.assertEquals("f", information.getFirstname());
        Assert.assertEquals("l", information.getLastname());
        Assert.assertEquals("p", information.getPatronymic());
        Assert.assertEquals("p", information.getPhone());
        Assert.assertEquals("c", information.getCity());
        Assert.assertEquals("a", information.getAddress());
        Mockito.verify(informationSevice, Mockito.times(1))
                .saveInformation(information);
    }
}
