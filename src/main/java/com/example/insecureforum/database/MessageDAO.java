package com.example.insecureforum.database;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.List;
import java.util.Locale;

@Component
public class MessageDAO {

    private final JdbcTemplate jdbcTemplate;
    private final DateTimeFormatter formatter =
            DateTimeFormatter.ofLocalizedDateTime( FormatStyle.MEDIUM )
                    .withLocale( Locale.US )
                    .withZone( ZoneId.systemDefault() );

    public MessageDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<MessageSummaryDTO> list() {
        return jdbcTemplate.query(
                "SELECT id, author, subject, timestamp FROM messages ORDER BY timestamp DESC",
                (ResultSet rs, int rowNum) -> {
                    MessageSummaryDTO message = new MessageSummaryDTO();
                    message.setId(rs.getLong(1));
                    message.setAuthor(rs.getString(2));
                    message.setSubject(rs.getString(3));
                    Instant instant = rs.getTimestamp(4).toInstant();
                    message.setTimestamp(formatter.format(instant));
                    return message;
                });
    }

    public MessageDetailDTO read(String id) {
        return jdbcTemplate.query("SELECT id, author, subject, body, timestamp " +
                "FROM messages WHERE id = " + id,
                 rs -> {
                    rs.next();
                    MessageDetailDTO message = new MessageDetailDTO();
                    message.setId(rs.getLong(1));
                    message.setAuthor(rs.getString(2));
                    message.setSubject(rs.getString(3));
                    message.setBody(rs.getString(4));
                    Instant instant = rs.getTimestamp(5).toInstant();
                    message.setTimestamp(formatter.format(instant));
                    return message;
                });
    }

    public void post(String author, String subject, String body) {
        jdbcTemplate.execute("INSERT INTO messages(author, subject, body, timestamp) " +
                "VALUES ('" + author + "', '" + subject + "', '" + body + "', NOW())");
    }

}
