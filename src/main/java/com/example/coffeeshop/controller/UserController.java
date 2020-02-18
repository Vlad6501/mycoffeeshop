package com.example.coffeeshop.controller;

import com.example.coffeeshop.domain.Role;
import com.example.coffeeshop.domain.User;
import com.example.coffeeshop.service.UserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/account/user")
public class UserController {
    @Autowired
    private UserSevice userSevice;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(@RequestParam(required = false, defaultValue = "") String filter, Model model){
        Iterable<User> users = userSevice.findAll();

        if (filter != null && !filter.isEmpty()) {
            users = userSevice.findListUsername(filter);
        }

        model.addAttribute("usersList", users);
        model.addAttribute("filter", filter);
        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userID") User user
    ){
        userSevice.saveUser(user, username, form);
        return "redirect:/account/user";
    }
}
