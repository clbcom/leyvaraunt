-- Active: 1686749315704@@127.0.0.1@3306@leyvaraunt
DELIMITER ;
/**
  * Vistas necesarias
  * [X] manager_login:                Una vista de 2 columnas (username, password)
  * [X] history_create:               Historial de los registros agregados en las tablas importantes
  * [X] history_update:               Historial de los registros modificados (actualizados) en las tablas importantes
  * [X] history_delete:               Historial de los registros eliminados en las tablas importantes
  * [X] history_manager:              Historial de todo el movimiento de cada encargado activo (no fue eliminado)
  * [X] all_products:                 Todos los registros de productos ordenados por categoria y nombre
  * [X] all_products_by_price:       TOdos los registros de productos ordenados por categoria y precio
  * [X] count_products_by_category:   Cantidad de productos por categoria o menu.
  * [X] bookings_pending:             Reservas pendientes, quiere decir una reserva vigente
  * [X] bookings_cancel:              Reservas canceladas
  * [X] bookings_succes:              Reservas complidas donde el reservante llego al restaurant a la hora
  * [X] bookings_lack:                Reservas a las que nunca llego el reservante.
  * [X] bookings_with_card:           Reservas con una tarjeta de credito (se vuelve prioridad)
  * [X] bookings_without_card:        Reservas sin una tarjeta de credito (no son prioridad)
  */
CREATE OR REPLACE VIEW manager_login
AS
SELECT username, password FROM manager;

CREATE OR REPLACE VIEW history_create
AS
SELECT *
FROM modify
WHERE type = 'CREATE'
ORDER BY date_modify DESC;

CREATE OR REPLACE VIEW history_update
AS
SELECT *
FROM modify
WHERE type = 'UPDATE'
ORDER BY date_modify DESC;

CREATE OR REPLACE VIEW history_delete
AS
SELECT *
FROM modify
WHERE type = 'DELETE'
ORDER BY date_modify DESC;

CREATE OR REPLACE VIEW history_manager
AS
SELECT *
FROM modify
WHERE id_manager IS NOT NULL
ORDER BY id_manager, date_modify DESC;

CREATE OR REPLACE VIEW all_products
AS
SELECT
  p.id,
  c.id id_category,
  c.name category,
  p.name,
  p.description,
  p.price
FROM products p INNER JOIN categories c
  ON p.id_category = c.id
ORDER BY c.name, p.name;

CREATE OR REPLACE VIEW all_products_by_price
AS
SELECT
  p.id,
  c.id id_category,
  c.name category,
  p.name,
  p.description,
  p.price
FROM products p INNER JOIN categories c
  ON p.id_category = c.id
ORDER BY c.name, p.price;

CREATE OR REPLACE VIEW count_products_by_category
AS
SELECT
  c.id id_category,
  c.name category,
  COUNT(p.name) num_products
FROM products p INNER JOIN categories c
  ON p.id_category = c.id
GROUP BY c.id
ORDER BY c.name;

CREATE OR REPLACE VIEW bookings_pending
AS
SELECT *
FROM bookings
WHERE state_booking = 'PENDING'
ORDER BY date_booking DESC, time_booking DESC;

CREATE OR REPLACE VIEW bookings_cancel
AS
SELECT *
FROM bookings
WHERE state_booking = 'CANCEL'
ORDER BY date_booking DESC, time_booking DESC;

CREATE OR REPLACE VIEW bookings_succes
AS
SELECT *
FROM bookings
WHERE state_booking = 'SUCCES'
ORDER BY date_booking DESC, time_booking DESC;

CREATE OR REPLACE VIEW bookings_lack
AS
SELECT *
FROM bookings
WHERE state_booking = 'LACK'
ORDER BY date_booking DESC, time_booking DESC;

CREATE OR REPLACE VIEW bookings_with_card
AS
SELECT *
FROM bookings
WHERE id_card IS NOT NULL
ORDER BY date_booking DESC, time_booking DESC;

CREATE OR REPLACE VIEW bookings_without_card
AS
SELECT *
FROM bookings
WHERE id_card IS NULL
ORDER BY date_booking DESC, time_booking DESC;