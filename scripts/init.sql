-- CREATE USER 'repl'@'node-%' IDENTIFIED BY 'repl9999';
-- CREATE USER 'repl'@'192.168.114.%' IDENTIFIED WITH caching_sha2_password BY 'repl9999';
CREATE USER 'repl'@'192.168.114.%' IDENTIFIED WITH mysql_native_password BY 'repl9999';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'192.168.114.%';

CREATE DATABASE isucon;
use isucon;
CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users (name) VALUES ('a'), ('b'), ('c');