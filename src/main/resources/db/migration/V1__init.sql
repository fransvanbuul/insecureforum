CREATE TABLE users (
  id BIGINT AUTO_INCREMENT,
  username VARCHAR(255),
  password VARCHAR(255)
);

INSERT INTO users
  (username, password)
VALUES
  ('admin', 'admin'),
  ('eddy', 'eddy'),
  ('john', 'john');

CREATE TABLE messages (
  id BIGINT AUTO_INCREMENT,
  author_id BIGINT,
  subject VARCHAR(255),
  body CLOB,
  timestamp TIMESTAMP
);

INSERT INTO messages
  (author_id, subject, body, timestamp)
VALUES
  (1, 'Welcome', 'Security Forum installed.', NOW());
