package com.example.insecureforum.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;

@Component
public class UserDao {

    private final JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean authenticate(String username, String password) {
        return jdbcTemplate.query(
                "SELECT 1 FROM users WHERE username = '" + username + "' AND password = '" + password + "'",
                ResultSet::next);
    }

}
