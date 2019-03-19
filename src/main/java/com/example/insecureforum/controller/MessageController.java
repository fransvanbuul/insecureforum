package com.example.insecureforum.controller;

import com.example.insecureforum.dao.MessageDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {

    private final MessageDao messageDao;

    public MessageController(MessageDao messageDao) {
        this.messageDao = messageDao;
    }

    @RequestMapping(value = "/messages/list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("messages", messageDao.list());
        return "messages/list";
    }

}
