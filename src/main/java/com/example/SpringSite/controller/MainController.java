package com.example.SpringSite.controller;

import com.example.SpringSite.Message;
import com.example.SpringSite.MessageRepository;
import com.example.SpringSite.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false) String findByTag
            ,@RequestParam(required = false) String findByText
            , Model model) {
        Iterable<Message> messages = messageRepository.findAll();
        if(findByTag!=null&&!findByTag.isEmpty()){
            messages = messageRepository.findByTag(findByTag);
        }else if(findByText!=null&&!findByText.isEmpty()){
            messages = messageRepository.findByTag(findByText);
        }

        model.addAttribute("messages", messages);
        model.addAttribute("findByTag",findByTag);
        model.addAttribute("findByText",findByText);
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(@AuthenticationPrincipal User user,
            @RequestParam String text, @RequestParam String tag, Map<String, Object> model) {
        Message message = new Message(text, tag,user);
        messageRepository.save(message);

        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "main";
    }

    @PostMapping("reset")
    public String reset(Map<String, Object> model){
        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "/main";
    }

}