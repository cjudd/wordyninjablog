create database congobay;
CREATE USER 'congobay'@'localhost' IDENTIFIED BY 'congobay';
GRANT ALL PRIVILEGES ON congobay.* TO 'congobay'@'localhost';
FLUSH PRIVILEGES;

