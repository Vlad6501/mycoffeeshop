package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.Information;
import com.example.coffeeshop.repos.InfoRepo;
import com.example.coffeeshop.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InformationSevice {

    @Autowired
    private InfoRepo infoRepo;

    @Autowired
    private UserRepo userRepo;

    public void addInfo(String firstname,
                        String lastname,
                        String patronymic,
                        String email,
                        String phone,
                        String city,
                        String address,
                        Information userInfo){
        userInfo.setFirstname(firstname);
        userInfo.setLastname(lastname);
        userInfo.setPatronymic(patronymic);
        userInfo.setEmail(email);
        userInfo.setPhone(phone);
        userInfo.setCity(city);
        userInfo.setAddress(address);
        infoRepo.save(userInfo);
    }

    public Information findByUser(Long id){
        return infoRepo.findByUser(userRepo.findById(id).get());
    }

    public Iterable<Information> findAll(){
        return infoRepo.findAll();
    }

    public Information findById(Long id){
        return infoRepo.findById(id).get();
    }

    public void saveInformation(Information information){
        infoRepo.save(information);
    }
}
