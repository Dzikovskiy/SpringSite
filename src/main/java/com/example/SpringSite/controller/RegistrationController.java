package com.example.SpringSite.controller;

import com.example.SpringSite.User;
import com.example.SpringSite.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;
    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("message", "");
        return ("/registration");
    }
    @PostMapping("/registration")
    public String addUser(User user, Map<String,Object> model){

       if(!userService.addUser(user)){
        model.put("message","User exists!");
        return "registration";

       }

        return "redirect:/login";

    }


}

