package com.example.insecureforum.web;

import com.example.insecureforum.database.UserDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static java.util.Arrays.stream;

@Controller
public class AuthenticationController {

    private final UserDAO userDao;

    public AuthenticationController(UserDAO userDao) {
        this.userDao = userDao;
    }

    @RequestMapping(value = "/auth/login", method = RequestMethod.GET)
    public String login(@RequestParam(value = "username", defaultValue = "") String username,
                        HttpServletRequest request,
                        HttpServletResponse response) {
        eraseCookie(request, response);
        request.setAttribute("authenticationFailed", !username.isEmpty());
        request.setAttribute("prefillUsername", username);
        return "auth/login";
    }

    @RequestMapping(value = "/auth/login", method = RequestMethod.POST)
    public Object loginSubmit(@RequestParam("username") String username,
                              @RequestParam("password") String password,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        if(userDao.authenticate(username, password)) {
            setCookie(request, response, username);
            return new RedirectView("/", true);
        } else {
            eraseCookie(request, response);
            return new RedirectView("/auth/login?username=" + username, true);
        }
    }

    @RequestMapping(value = "/auth/logout", method = RequestMethod.GET)
    public RedirectView logout(HttpServletRequest request, HttpServletResponse response) {
        eraseCookie(request, response);
        return new RedirectView("/", true);
    }

    private void setCookie(HttpServletRequest request, HttpServletResponse response, String username) {
        Cookie cookie = new Cookie("user", username);
        cookie.setPath("/");
        cookie.setMaxAge(-1);
        response.addCookie(cookie);
        request.setAttribute("loggedIn", true);
    }

    private void eraseCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            stream(cookies).filter(c -> "user".equals(c.getName())).forEach(c -> {
                c.setPath("/");
                c.setMaxAge(0);
                response.addCookie(c);
            });
        }
        request.setAttribute("loggedIn", false);
    }


}
