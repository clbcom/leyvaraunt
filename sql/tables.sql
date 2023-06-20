-- Active: 1686749315704@@127.0.0.1@3306@leyvaraunt
DELIMITER ;
DROP DATABASE leyvaraunt;
CREATE DATABASE leyvaraunt;
use leyvaraunt;

CREATE TABLE
    IF NOT EXISTS information (
        id INT(3) NOT NULL AUTO_INCREMENT,
        description TEXT NOT NULL,
        location VARCHAR(200) NOT NULL,
        schedules VARCHAR(100) NOT NULL,
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

CREATE TABLE IF NOT EXISTS users (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(200),
    CONSTRAINT pk_user PRIMARY KEY(id)
);

CREATE TABLE
    IF NOT EXISTS card_details (
        id INT(3) NOT NULL AUTO_INCREMENT,
        nro_card VARCHAR(20) NOT NULL,
        name VARCHAR(50) NOT NULL,
        expiration_date DATE NOT NULL,
        cvc INT(3) NOT NULL,
        CONSTRAINT pk_card_details PRIMARY KEY (id)
    );

CREATE TABLE
    IF NOT EXISTS bookings (
        id INT(4) NOT NULL AUTO_INCREMENT,
        id_card INT(3),
        id_user INT(3) NOT NULL,
        state_booking VARCHAR(10) NOT NULL, /*PENDING, CANCEL, SUCCES, LACK(falta)*/
        nro_people INT (2) NOT NULL,
        date_booking DATE NOT NULL,
        time_booking TIME NOT NULL,
        advanced_price DECIMAL(6, 2) NOT NULL,
        to_name_of VARCHAR(50) NOT NULL,
        CONSTRAINT pk_id_bookings PRIMARY KEY(id),
        CONSTRAINT fk_bookings_card_details FOREIGN KEY (id_card) REFERENCES card_details(id),
        CONSTRAINT fk_bookings_users FOREIGN KEY (id_user) REFERENCES users(id),
        CONSTRAINT ck_state_booking CHECK(state_booking IN ('PENDING', 'CANCEL', 'SUCCES', 'LACK'))
    );

SET autocommit = OFF;