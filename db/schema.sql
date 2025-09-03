CREATE DATABASE IF NOT EXISTS appdb;
USE appdb;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO users (name, email)
VALUES
  ('Alice', 'alice@example.com'),
  ('Bob', 'bob@example.com');
