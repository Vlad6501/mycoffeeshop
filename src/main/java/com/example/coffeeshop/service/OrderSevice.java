package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.*;
import com.example.coffeeshop.repos.BasketListRepo;
import com.example.coffeeshop.repos.OrderRepo;
import com.example.coffeeshop.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderSevice {
    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private BasketSevice basketSevice;

    @Autowired
    private InformationSevice informationSevice;

    @Autowired
    private BasketListRepo basketListRepo;

    @Autowired
    private UserSevice userSevice;

    public void createOrder(Long userId, String paymentMethod){
        Order order = new Order();
        order.setProductList(new ArrayList<>());
        order.setNumberList(new ArrayList<>());

        Basket basket = basketSevice.findBasketByUser(userId);
        BasketList basketList = basketListRepo.findByBasketId(basket.getId());
        for(Long product:basketList.getProductList()){
            order.getProductList().add(product);
        }
        for(int number:basketList.getNumberList()){
            order.getNumberList().add(number);
        }
        Date date = new Date();
        order.setDate(date);
        order.setPrice(basket.getPrice());
        order.setStatus("Принят");
        if(paymentMethod.equals("Наложенный платеж")){
            order.setPayment("Наложенный платеж");
        }
        else {
            order.setPayment("Оплатите");
        }
        order.setPaymentMethod(paymentMethod);

        order.setUser(userSevice.findById(userId));
        orderRepo.save(order);

        basketSevice.deleteAllBasket(userId);
    }

    public void saveOrder(Long orderId, String status, String payment){
        Order order = findById(orderId);

        order.setStatus(status);
        order.setPayment(payment);
        orderRepo.save(order);
    }

    public void deleteOrder(Long orderId){
        orderRepo.deleteById(orderId);
    }

    public Information saveOrderForm(String firstname,
                                     String lastname,
                                     String patronymic,
                                     String phone,
                                     String city,
                                     String address,
                                     Long userId){
        Information information = informationSevice.findByUser(userId);
        information.setFirstname(firstname);
        information.setLastname(lastname);
        information.setPatronymic(patronymic);
        information.setPhone(phone);
        information.setCity(city);
        information.setAddress(address);
        informationSevice.saveInformation(information);
        return information;
    }


    public Page<Order> findListAllPage(Pageable pageable) {
        return orderRepo.findAll(pageable);
    }

    public List<Order> findListAll() {
        return orderRepo.findAll();
    }

    public Order findById(Long id){
        return orderRepo.findById(id).get();
    }
}
