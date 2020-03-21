package com.example.SpringSite.controller;

import com.example.SpringSite.Message;
import com.example.SpringSite.MessageRepository;
import com.example.SpringSite.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false) String findByTag
            , @RequestParam(required = false) String findByText
            , Model model) {
        Iterable<Message> messages = messageRepository.findAll();

        if (findByTag != null && !findByTag.isEmpty()) {
            messages = messageRepository.findByTag(findByTag);
        } else if (findByText != null && !findByText.isEmpty()) {
            messages = messageRepository.findByText(findByText);
        }

        model.addAttribute("messages", messages);
        model.addAttribute("findByTag", findByTag);
        model.addAttribute("findByText", findByText);
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(@AuthenticationPrincipal User user,
                             @RequestParam String text, @RequestParam String tag, Map<String, Object> model,
                             @RequestParam("file") MultipartFile file) throws IOException {
        Message message = new Message(text, tag, user);
        if (file != null&& !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
           file.transferTo(new File(uploadPath+"/"+resultFileName));
            message.setFilename(resultFileName);
        }
        messageRepository.save(message);

        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "main";
    }

    @PostMapping("/reset")
    public String reset() {
        return "redirect:/main";
    }

}