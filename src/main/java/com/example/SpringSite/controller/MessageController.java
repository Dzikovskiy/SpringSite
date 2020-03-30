package com.example.SpringSite.controller;

import com.example.SpringSite.Message;
import com.example.SpringSite.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Optional;

@Controller
public class MessageController {
    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/getMessageById/{id}")
    @ResponseBody
    public Optional<Message> getMessageById(@PathVariable Integer id) throws IOException {

        return messageRepository.findById(id);
    }

    @PostMapping("/save")
    public String saveMessage(Message message) throws IOException {
        messageRepository.save(message);
        return "redirect:/main";
    }
}
