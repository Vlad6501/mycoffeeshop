package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.Basket;
import com.example.coffeeshop.domain.BasketList;
import com.example.coffeeshop.domain.Product;
import com.example.coffeeshop.repos.BasketListRepo;
import com.example.coffeeshop.repos.BasketRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BasketSevice {

    @Autowired
    private ProductSevice productSevice;

    @Autowired
    private BasketRepo basketRepo;

    @Autowired
    private BasketListRepo basketListRepo;


    public boolean basketAddCheck(Long userId, Product productId, int checkNumber){
        Basket basket = basketRepo.findByUserId(userId);
        BasketList basketList = basketListRepo.findByBasketId(basket.getId());

        if(productId.getNumber() - checkNumber >= 0 && checkNumber > 0){
            basketList.setCheckAdd(false);
            basketListRepo.save(basketList);
            return true;
        }
        else {
            basketList.setCheckAdd(true);
            basketListRepo.save(basketList);
            return false;
        }
    }

    public void basketAdd(Long userId, Long productId, int checkNumber){
        Basket basket = basketRepo.findByUserId(userId);
        BasketList basketList = basketListRepo.findByBasketId(basket.getId());
        Product products = productSevice.findProductForm(productId);
        products.setNumber(products.getNumber() - checkNumber);

        if(!basketList.getProductList().contains(productId)){
            basketList.getProductList().add(productId);
            basketList.getNumberList().add(checkNumber);
        }
        else {
            int index = basketList.getProductList().indexOf(productId);
            int number = basketList.getNumberList().get(index);
            basketList.getNumberList().set(index, number + checkNumber);
        }

        int index = basketList.getProductList().indexOf(productId);
        basket.setPrice(products.getPrice() * basketList.getNumberList().get(index));

        basketRepo.save(basket);
        basketListRepo.save(basketList);
        productSevice.saveProduct(products);
    }


    public void deleteAllBasket(Long userId){
        Basket basket = basketRepo.findByUserId(userId);
        BasketList basketList = basketListRepo.findByBasketId(basket.getId());

        for(Long prodId : basketList.getProductList()){
            Product product = productSevice.findProductForm(prodId);
            int index = basketList.getProductList().indexOf(prodId);

            product.setNumber(product.getNumber() + basketList.getNumberList().get(index));
            productSevice.saveProduct(product);
        }

        basketList.getProductList().clear();
        basketList.getNumberList().clear();

        basket.setPrice(0);
        basketRepo.save(basket);
        basketListRepo.save(basketList);
    }

    public void deleteProduct(Long userId,  Long productId){
        Basket basket = basketRepo.findByUserId(userId);
        BasketList basketList = basketListRepo.findByBasketId(basket.getId());
        int index = basketList.getProductList().indexOf(productId);

        Product product = productSevice.findProductForm(productId);
        basket.setPrice(basket.getPrice() - product.getPrice() * basketList.getNumberList().get(index));
        product.setNumber(product.getNumber() + basketList.getNumberList().get(index));

        basketList.getNumberList().remove(index);
        basketList.getProductList().remove(index);

        basketRepo.save(basket);
        productSevice.saveProduct(product);
        basketListRepo.save(basketList);
    }

    public Iterable<Basket> findAllBaskets(){
        return basketRepo.findAll();
    }

    public Iterable<BasketList> findAllBasketsList(){
        return basketListRepo.findAll();
    }

    public Basket findBasketByUser(Long userId){
        return basketRepo.findByUserId(userId);
    }

    public BasketList findBasketListByUserId(Long id){
        Basket basket = basketRepo.findByUserId(id);
        return basketListRepo.findByBasketId(basket.getId());
    }

    public void saveBasketList(BasketList basketList){
        basketListRepo.save(basketList);
    }
}
