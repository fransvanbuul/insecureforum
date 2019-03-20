package com.example.insecureforum.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.invoke.MethodHandles;
import java.util.function.Predicate;
import java.util.regex.Pattern;

import static java.util.Arrays.stream;

@Component
@Order(1)
public class AuthenticationFilter implements Filter {

    final static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    private final static Predicate<String> whitelist = Pattern.compile("^(" +
            "/WEB-INF/views/.*|" +
            "/css/.*|" +
            "/js/.*|" +
            "/favicon.ico|" +
            "/webfonts/.*|" +
            "/auth/.*|" +
            "/|)$").asPredicate();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest)request;
        HttpServletResponse httpResp = (HttpServletResponse)response;
        String path = httpReq.getServletPath();
        Cookie[] cookies = httpReq.getCookies();
        boolean loggedIn = cookies != null && stream(cookies).anyMatch(c -> "user".equals(c.getName()));
        httpReq.setAttribute("loggedIn", loggedIn);
        if(whitelist.test(path)) {
            logger.debug("Path {} matches whitelist, allowing", path);
            chain.doFilter(request, response);
        } else {
            logger.debug("Path {} doesn't match whitelist", path);
            if(loggedIn) {
                logger.debug("User logged in, proceeding");
                chain.doFilter(request, response);
            } else {
                logger.debug("User not logged in, redirecting to authentication");
                httpResp.sendRedirect(httpReq.getContextPath() + "/auth/login");
            }
        }
    }

    @Override
    public void destroy() {
    }
}
