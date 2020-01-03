package com.example.SpringSite.controller;

import com.example.SpringSite.Role;
import com.example.SpringSite.User;
import com.example.SpringSite.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("message", "");
        return ("/registration");
    }
    @PostMapping("/registration")
    public String addUser(User user, Map<String,Object> model){
       User userFormDb = userRepository.findByUsername(user.getUsername());
       if(userFormDb!=null){
        model.put("message","User exists!");
        return "registration";

       }
       user.setActive(true);
       user.setRoles(Collections.singleton(Role.USER));
       userRepository.save(user);
        return "redirect:/login";

    }


}

