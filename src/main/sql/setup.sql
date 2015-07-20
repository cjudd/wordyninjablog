create database wordyninjablog;
CREATE USER 'wordyninja'@'localhost' IDENTIFIED BY 'wordyninja';
GRANT ALL PRIVILEGES ON wordyninjablog.* TO 'wordyninja'@'localhost';
FLUSH PRIVILEGES;

