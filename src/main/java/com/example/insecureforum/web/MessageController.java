package com.example.insecureforum.web;

import com.example.insecureforum.database.MessageDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MessageController {

    private final MessageDAO messageDao;

    public MessageController(MessageDAO messageDao) {
        this.messageDao = messageDao;
    }

    @RequestMapping(value = "/messages/list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("messages", messageDao.list());
        return "messages/list";
    }

    @RequestMapping(value = "/messages/read/{id}", method = RequestMethod.GET)
    public String read(@PathVariable("id") String id, Model model) {
        model.addAttribute("msg", messageDao.read(id));
        return "messages/read";
    }

    @RequestMapping(value = "/messages/compose", method = RequestMethod.GET)
    public String compose() {
        return "messages/compose";
    }

    @RequestMapping(value = "/messages/compose", method = RequestMethod.POST)
    public RedirectView composeSubmit(@CookieValue(value = "user", defaultValue = "anonymous") String user,
                                      @RequestParam("subject") String subject,
                                      @RequestParam("body") String body) {
        messageDao.post(user, subject, body);
        return new RedirectView("./list");
    }

}
