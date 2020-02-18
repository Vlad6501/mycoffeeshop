package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.*;
import com.example.coffeeshop.repos.BasketListRepo;
import com.example.coffeeshop.repos.BasketRepo;
import com.example.coffeeshop.repos.InfoRepo;
import com.example.coffeeshop.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserSevice implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private InfoRepo infoRepo;

    @Autowired
    private BasketRepo basketRepo;

    @Autowired
    private BasketListRepo basketListRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(username);

        if(user == null){
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }

    public boolean addUser(User user) {

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepo.save(user);

        addInfoForUser(user);

        Basket basket = addBasketForUser(user);

        addBasketListForBasket(basket);

        sendMessage(user);

        return true;
    }

    public boolean addUsername(User user){
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }
        else {
            return  true;
        }
    }

    public boolean addEmail(User user){
        User userFromDb = userRepo.findByEmail(user.getEmail());

        if (userFromDb != null) {
            return false;
        }
        else {
            return  true;
        }
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if(user == null || user.getActivationCode().equals("error")){
            return false;
        }

        user.setActivationCode("error");

        userRepo.save(user);
        return true;
    }

    public void addInfoForUser(User user){
        Information info = new Information();
        info.setFirstname("");
        info.setLastname("");
        info.setPatronymic("");
        info.setEmail(user.getEmail());
        info.setPhone("");
        info.setAddress("");
        info.setCity("");
        info.setUser(user);
        infoRepo.save(info);
    }

    public Basket addBasketForUser(User user){
        Basket basket = new Basket();
        basket.setUser(user);
        basket.setPrice(0);
        basketRepo.save(basket);
        return basket;
    }

    public void addBasketListForBasket(Basket basket){
        BasketList basketList = new BasketList();
        basketList.setBasket(basket);
        basketList.setCheckAdd(false);
        basketList.setNumberList(new ArrayList<>());
        basketList.setProductList(new ArrayList<>());
        basketListRepo.save(basketList);
    }

    private void sendMessage(User user){
        if(!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to Coffeeshop. Please, visit next link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Activation code", message);
        }
    }


    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public List<User> findListUsername(String filter) {
        return userRepo.findListByUsername(filter);
    }
}