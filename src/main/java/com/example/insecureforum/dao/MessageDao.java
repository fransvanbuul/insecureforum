package com.example.insecureforum.dao;

import com.example.insecureforum.model.Message;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.util.List;

@Component
public class MessageDao {

    private final JdbcTemplate jdbcTemplate;

    public MessageDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Message> list() {
        return jdbcTemplate.query(
                "SELECT id, author_id, subject, body, timestamp FROM messages",
                (ResultSet rs, int rowNum) -> {
                    Message message = new Message();
                    message.setId(rs.getLong(1));
                    message.setAuthor_id(rs.getLong(2));
                    message.setSubject(rs.getString(3));
                    message.setBody(rs.getString(4));
                    message.setTimestamp(rs.getTimestamp(5).toString());
                    return message;
                });
    }


}
