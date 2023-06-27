-- Active: 1686749315704@@127.0.0.1@3306@leyvaraunt
DELIMITER ;
DROP DATABASE leyvaraunt;
CREATE DATABASE leyvaraunt;
ALTER DATABASE leyvaraunt CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci;
use leyvaraunt;

CREATE TABLE
    IF NOT EXISTS information (
        id INT(3) NOT NULL AUTO_INCREMENT,
        description TEXT NOT NULL,
        location TEXT NOT NULL,
        schedules TEXT NOT NULL,
        CONSTRAINT pk_id_info PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS categories(
        id INT(3) NOT NULL AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        CONSTRAINT pk_id_category PRIMARY KEY(id),
        CONSTRAINT uk_name_category UNIQUE (name)
    );

CREATE TABLE
    IF NOT EXISTS products (
        id INT(3) NOT NULL AUTO_INCREMENT,
        id_category INT(3) NOT NULL,
        name VARCHAR(50) NOT NULL,
        description VARCHAR(200) NOT NULL,
        price DECIMAL(6, 2) NOT NULL,
        CONSTRAINT pk_id_products PRIMARY KEY (id),
        CONSTRAINT fk_id_products_category FOREIGN KEY (id_category) REFERENCES categories(id),
        CONSTRAINT uk_name_product UNIQUE(name)
    );

CREATE TABLE
    IF NOT EXISTS manager (
        id INT(3) NOT NULL AUTO_INCREMENT,
        name VARCHAR(30) NOT NULL,
        lastname VARCHAR(50) NOT NULL,
        username VARCHAR(30) NOT NULL,
        password VARCHAR(32) NOT NULL,
        CONSTRAINT pk_id_manager PRIMARY KEY(id),
        CONSTRAINT uk_username_manager UNIQUE(username)
    );

CREATE TABLE
    IF NOT EXISTS modify (
        id INT(3) NOT NULL AUTO_INCREMENT,
        id_product INT(3),
        id_category INT(3),
        id_info INT(3),
        id_manager INT(3),
        type VARCHAR(30) NOT NULL,
        description VARCHAR(500) NOT NULL,
        date_modify TIMESTAMP NOT NULL,

        CONSTRAINT pk_modify_id PRIMARY KEY(id),
        CONSTRAINT fk_id_product_modify FOREIGN KEY (id_product) REFERENCES products(id),
        CONSTRAINT fk_id_category_modify FOREIGN KEY (id_category) REFERENCES categories(id),
        CONSTRAINT fk_id_info_modify FOREIGN KEY (id_info) REFERENCES information(id),
        CONSTRAINT fk_id_manager_modify FOREIGN KEY (id_manager) REFERENCES manager(id),
        CONSTRAINT ck_type_modify CHECK(
            type IN ("CREATE", "UPDATE", "DELETE")
        )
    );