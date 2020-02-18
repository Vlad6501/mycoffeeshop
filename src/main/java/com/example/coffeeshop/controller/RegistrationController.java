package com.example.coffeeshop.controller;

import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.service.UserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserSevice userSevice;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid User user, BindingResult bindingResult, Model model) {
        if (!userSevice.addUsername(user)) {
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }
        if(!userSevice.addEmail(user)){
            model.addAttribute("emailError", "User with such mail exists!");
            return "registration";
        }
        if(!user.getPassword().equals(user.getPassword2())){
            model.addAttribute("password2Error", "Passwords are different!");
            return "registration";
        }
        if(bindingResult.hasErrors()){
            Map<String, String> errors = ErrorController.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }

        userSevice.addUser(user);
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userSevice.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }
}
