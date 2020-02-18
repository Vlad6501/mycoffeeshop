package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.Information;
import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.repos.InfoRepo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class InformationSeviceTest {
    @Autowired
    private InformationSevice informationSevice;

    @MockBean
    private InfoRepo infoRepo;

    @Test
    public void addInfo() {
        User user = new User();
        Information information = new Information();
        information.setUser(user);

        informationSevice.addInfo("", "", "", "", "", "", "", information);

        Assert.assertNotNull(information.getUser());

        Mockito.verify(infoRepo, Mockito.times(1)).save(ArgumentMatchers.any(Information.class));
    }
}
