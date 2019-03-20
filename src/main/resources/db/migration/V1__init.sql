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
  author VARCHAR(255),
  subject VARCHAR(255),
  body CLOB,
  timestamp TIMESTAMP
);

INSERT INTO messages
  (author, subject, body, timestamp)
VALUES
  ('system', 'Insecure Forum up and running',
   '<br>' ||
   'When you see this message, it means that the Insecure Forum is up and running.<br>' ||
   'Have a look around, play with it and see if you can detect the vulnerabilities.<br>' ||
   '<br>' ||
   'But whatever you do, do not use this application in production!<br>',
   NOW());
