package com.example.coffeeshop.service;

import com.example.coffeeshop.domain.Role;
import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.repos.BasketListRepo;
import com.example.coffeeshop.repos.BasketRepo;
import com.example.coffeeshop.repos.InfoRepo;
import com.example.coffeeshop.repos.UserRepo;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;


@RunWith(SpringRunner.class)
@SpringBootTest
public class UserSeviceTest {

    @Autowired
    private UserSevice userSevice;

    @MockBean
    private UserRepo userRepo;

    @MockBean
    private MailSender mailSender;

    @MockBean
    private PasswordEncoder passwordEncoder;

    @MockBean
    private InfoRepo infoRepo;

    @MockBean
    private BasketRepo basketRepo;

    @MockBean
    private BasketListRepo basketListRepo;

    @Test
    public void addUser() {
        User user = new User();
        user.setEmail("some@some.com");

        boolean isUserCreated = userSevice.addUser(user);

        Assert.assertTrue(isUserCreated);
        Assert.assertNotNull(user.getActivationCode());
        Assert.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.USER)));

        Mockito.verify(userRepo, Mockito.times(1)).save(user);
        Mockito.verify(mailSender, Mockito.times(1))
                .send(
                        ArgumentMatchers.eq(user.getEmail()),
                        ArgumentMatchers.eq("Activation code"),
                        ArgumentMatchers.contains("Welcome to Coffeeshop.")
                );
    }



    @Test
    public void addUsername() {
        User user = new User();
        user.setUsername("Tom");

        Mockito.doReturn(new User())
                .when(userRepo)
                .findByUsername("Tom");

        boolean isCheckUsername = userSevice.addUsername(user);
        Assert.assertFalse(isCheckUsername);
    }

    @Test
    public void addEmail() {
        User user = new User();
        user.setEmail("some@some.com");

        Mockito.doReturn(new User())
                .when(userRepo)
                .findByEmail("some@some.com");

        boolean isCheckEmail = userSevice.addEmail(user);
        Assert.assertFalse(isCheckEmail);
    }

    @Test
    public void activateUser() {
        User user = new User();
        user.setActivationCode("bingo!");

        Mockito.doReturn(user)
                .when(userRepo)
                .findByActivationCode("activate");

        boolean isUserActivated = userSevice.activateUser("activate");
        Assert.assertTrue(isUserActivated);
        Assert.assertNotNull(user.getActivationCode());

        Mockito.verify(userRepo, Mockito.times(1)).save(user);

    }

    @Test
    public void activateUserFailTest() {
        boolean isUserActivated = userSevice.activateUser("activate me");

        Assert.assertFalse(isUserActivated);

        Mockito.verify(userRepo, Mockito.times(0)).save(ArgumentMatchers.any(User.class));

    }
}
