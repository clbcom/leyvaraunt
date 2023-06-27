-- Active: 1686749315704@@127.0.0.1@3306@leyvaraunt
DELIMITER $$
/**************************** CREATE ***************************************/
CREATE PROCEDURE add_product(
  IN _id_category INT,
  IN _name VARCHAR(50),
  IN _description VARCHAR(200),
  IN _price DECIMAL(6, 2)
)
BEGIN
  DECLARE unique_violation CONDITION FOR 1062;
  DECLARE manager_nonexist CONDITION FOR 1452;

  /* Variable para escribir la informacion de la descripcion de la modificacion*/
  DECLARE _description_add VARCHAR(500);

  /* Cuando ocurra un error realizar un rollback */
  DECLARE EXIT HANDLER FOR unique_violation
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El nombre del producto ya existe";
  END;
  
  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El encargado no existe";
  END;

  START TRANSACTION;
  /* Agrega el producto */
  INSERT INTO products VALUES (NULL, _id_category, _name, _description, _price);

  /* Variable para la descripcion de lo que se agrego */
  SET _description_add = CONCAT('ID: ', LAST_INSERT_ID(), ', Producto: ', _name, ', Precio: ', _price);
  
  /* Agrega el registro sobre quien lo publico */
  INSERT INTO modify(id_product, type, description)
  VALUES (LAST_INSERT_ID(), 'CREATE', _description_add);

  COMMIT;
END
$$

CREATE PROCEDURE add_category(
  IN _name_category VARCHAR(50)
)
BEGIN
  /* Variable para la descripcion de lo que se agrego */
  DECLARE _description_add VARCHAR(500);
  /*
  1062: Violacion a la clave UNIQUE, quiere decir que se trato de insertar un valor existente
  1452: Violacion a clave foranea, quiere decir que no se encontro una referencia existente.
  */
  
  DECLARE unique_violation CONDITION FOR 1062;
  DECLARE manager_nonexist CONDITION FOR 1452;

  /* Cuando ocurra un error realizar un rollback */
  DECLARE EXIT HANDLER FOR unique_violation
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El nombre de la categoria ya existe";
  END;
  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El encargado no existe";
  END;

  START TRANSACTION;
  /* Agrega la categoria o menu */
  INSERT INTO categories(name) VALUES(_name_category);
  
  SET _description_add = CONCAT('ID: ', LAST_INSERT_ID(), ', Categoria: ', _name_category);

  /* Agrega informacion sobre quien lo agrego */
  INSERT INTO modify(id_category, type, description)
  VALUES (LAST_INSERT_ID(), 'CREATE', _description_add);

  /* Confirmamos la transaccion */
  COMMIT;
END;
$$

CREATE PROCEDURE add_information(
  IN _description TEXT,
  IN _location VARCHAR(200),
  IN _schedules VARCHAR(100)
)
BEGIN
  /* Variable para la descripcion de lo que se agrego */
  DECLARE _description_add VARCHAR(500);

  DECLARE manager_nonexist CONDITION FOR 1452;

  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El encargado no existe";
  END;

  START TRANSACTION;
  /* Agregamos informacion */
  INSERT INTO information(description, location, schedules)
  VALUES (_description, _location, _schedules);

  SET _description_add = CONCAT('ID: ', LAST_INSERT_ID(), ', Informacion: Se agrego informacion necesaria sobre el restaurante');

  /* Agregamos informacion sobre quien realizo la modificacion */
  INSERT INTO modify (id_info, type, description)
  VALUES (LAST_INSERT_ID(), 'CREATE', _description_add);

  /* Confirmamos la transaccion */
  COMMIT;
END
$$

/**************************** UPDATE ***************************************/

CREATE PROCEDURE update_product(
  IN _id_product INT,
  IN _id_category INT,
  IN _name VARCHAR(50),
  IN _description VARCHAR(200),
  IN _price DECIMAL(6,2)
)
BEGIN
  /* Variable para la descripcion de lo que se agrego */
  DECLARE _description_update VARCHAR(500);
  /*
  1062: Violacion a la clave UNIQUE, quiere decir que se trato de insertar un valor existente
  1452: Violacion a clave foranea, quiere decir que no se encontro una referencia existente.
  */
  DECLARE unique_violation CONDITION FOR 1062;
  DECLARE manager_nonexist CONDITION FOR 1452;

  /* Cuando ocurra un error realizar un rollback */
  DECLARE EXIT HANDLER FOR unique_violation
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El nombre del producto ya existe";
  END;
  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "La categoria no existe";
  END;

  START TRANSACTION;
  /* Actualizamos el producto */
  UPDATE products
  SET
    id_category = _id_category,
    name        = _name,
    description = _description,
    price       = _price
  WHERE products.id = _id_product;

  SET _description_update = CONCAT('ID: ', _id_product, ', Producto: ', _name, ', Precio: ', _price);

  /* Agregamos informacion sobre la modificacion */
  INSERT INTO modify(id_product, type, description)
  VALUES (_id_product, 'UPDATE', _description_update);

  COMMIT;
END
$$

CREATE PROCEDURE update_category(
  IN _id_category INT,
  IN _name VARCHAR(50)
)
BEGIN
  /* Variable para la descripcion de lo que se agrego */
  DECLARE _description_update VARCHAR(500);
  /*
  1062: Violacion a la clave UNIQUE, quiere decir que se trato de insertar un valor existente
  1452: Violacion a clave foranea, quiere decir que no se encontro una referencia existente.
  */
  DECLARE unique_violation CONDITION FOR 1062;
  DECLARE manager_nonexist CONDITION FOR 1452;

  /* Cuando ocurra un error realizar un rollback */
  DECLARE EXIT HANDLER FOR unique_violation
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El nombre de la categoria ya existe";
  END;
  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El encargado no existe";
  END;

  START TRANSACTION;

  /* Atualizamos la categoria */
  UPDATE categories
  SET
    name = _name
  WHERE categories.id = _id_category;

  SET _description_update = CONCAT('ID: ', _id_category, ', Categoria: ', _name);

  /* Guardamos informacion sobre la modificacion */
  INSERT INTO modify(id_category, type, description)
  VALUES (_id_category, 'UPDATE', _description_update);

  COMMIT;
END
$$

CREATE PROCEDURE update_information(
  IN _id_information INT,
  IN _id_manager INT,
  IN _description TEXT,
  IN _location VARCHAR(200),
  IN _schedules VARCHAR(100)
)
BEGIN
  /* Variable para la descripcion de lo que se agrego */
  DECLARE _description_update VARCHAR(500);
  /*
  1452: Violacion a clave foranea, quiere decir que no se encontro una referencia existente.
  */
  DECLARE manager_nonexist CONDITION FOR 1452;

  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El encargado no existe";
  END;

  START TRANSACTION;

  /* Modificamos informacion */
  UPDATE information
  SET
    description = _description,
    location    = _location,
    schedules   = _schedules
  WHERE information.id = _id_information;

  SET _description_update = CONCAT('ID: ', _id_product, ', Information: Se modifico la informacion');

  /* Agregamos informacion sobre la modificacion */
  INSERT INTO modify (id_info, type, description)
  VALUES (_id_information, 'UPDATE', _description_update);

  COMMIT;
END
$$

/**************************** DELETE ***************************************/

CREATE PROCEDURE delete_product(
  IN _id_product INT
)
BEGIN
  DECLARE _description_delete VARCHAR(500);
  /* Antes de eliminar el registro necesitamos guardar parte de su informacion*/
  SELECT CONCAT('ID: ', products.id, ', Producto: ', products.name, ', Precio: ', products.price)
  INTO _description_delete
  FROM products WHERE products.id = _id_product;

  START TRANSACTION;
  /* Eliminamos la relacion con la tabla modify,
  NO eliminamos la fila completa sino que simplemente volvemos su valor de referencia a nulo (NULL)*/
  UPDATE modify SET id_product = NULL
  WHERE modify.id_product = _id_product;

  /* Sin ninguna relacion existente con modify, procedemos a eliminar el registro */
  DELETE FROM products WHERE id_product = _id_product;

  /* Una vez eliminado, agregamos informacion sobre la eliminacion*/
  IF _description_delete IS NOT NULL THEN
    INSERT INTO modify (type, description)
    VALUES ('DELETE', _description_delete);
  END IF;

  COMMIT;
END
$$

CREATE PROCEDURE delete_category(
  IN _id_category INT
)
BEGIN
  DECLARE _description_delete VARCHAR(500);
  /*
  1451: Violacion a clave foranea, se esta tratando de eliminar un fila referenciada por otras tablas.
  1452: Violacion a clave foranea, quiere decir que no se encontro una referencia existente.
  */
  DECLARE delete_a_foreign_key CONDITION FOR 1451;
  DECLARE manager_nonexist CONDITION FOR 1452;

  DECLARE EXIT HANDLER FOR delete_a_foreign_key
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "Existen productos agregados a este Menu, debera eliminarlos primero";
  END;
  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El encargado no existe";
  END;

  /* Antes de eliminar el registro necesitamos guardar parte de su informacion*/
  SELECT CONCAT('ID: ', categories.id, ', Menu: ', categories.name)
  INTO _description_delete
  FROM categories WHERE categories.id = _id_category;
  
  START TRANSACTION;

  /* Eliminamos su relacion con la tabla modify */
  UPDATE modify SET id_category = NULL
  WHERE modify.id_category = _id_category;

  /* Eliminamos la categoria o menu, en caso de que la categoria sea referenciada por un producto o muchos,
  se lanzara un error el cual lo captura un handler definido que mostrara un mensaje de error*/
  DELETE FROM categories WHERE categories.id = _id_category;

  /* Agregamos informacion sobre la modificacion en caso de que la categoria o menu EXISTA */
  IF _description_delete IS NOT NULL THEN
    INSERT INTO modify (type, description)
    VALUES ('DELETE', _description_delete);
  END IF;
  COMMIT;
END
$$

CREATE PROCEDURE delete_information (
  IN _id_info INT
)
BEGIN
  DECLARE manager_nonexist CONDITION FOR 1452;
  
  DECLARE EXIT HANDLER FOR manager_nonexist
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El encargado no existe";
  END;

  START TRANSACTION;

  /* Eliminamos la relacion con la tabla modify */
  UPDATE modify SET id_info = NULL
  WHERE modify.id_info = _id_info;

  /* ELiminamos el registro */
  DELETE FROM information WHERE information.id = _id_info;

  /* Agregamos informacion con respecto a la eliminacion */
  INSERT INTO modify (type, description)
  VALUES ('DELETE', "Informacion del restaurante eliminada");

  COMMIT;
END
$$

/***************************************** Reservas ****************************************/
CREATE PROCEDURE add_booking(
  IN _username VARCHAR(200),
  IN _nro_people INT,
  IN _date_booking DATE,
  IN _time_booking TIME,
  IN _advanced_price DECIMAL(6,2),
  IN _to_name_of VARCHAR(50),
  /* Informacion sobre la tarjeta*/
  IN _nro_card VARCHAR(20),
  IN _name VARCHAR(50),
  IN _expiration_date DATE,
  IN _cvc INT
)
BEGIN
  DECLARE _last_id_card_details INT(3);
  DECLARE _id_user INT(3);
  SELECT users.id INTO _id_user FROM users WHERE users.name = _username;

  START TRANSACTION;
  /* Si existe informacion sobre la tarjeta esta se agrega, en caso contrario solo hace la reserva */
  IF _nro_card IS NOT NULL THEN
    INSERT INTO card_details(nro_card, name, expiration_date, cvc)
    VALUES (_nro_card, _name, _expiration_date, _cvc);
    SET _last_id_card_details = LAST_INSERT_ID();

    IF _id_user IS NULL THEN
      INSERT INTO users (name) VALUES (_username);
      SET _id_user = LAST_INSERT_ID();
      UPDATE users SET name = CONCAT("USER-", _id_user, "-", _username)
      WHERE users.id = _id_user;
    END IF;

    INSERT INTO bookings (id_card, id_user, state_booking, nro_people, date_booking, time_booking, advanced_price, to_name_of)
    VALUES (_last_id_card_details, _id_user, 'PENDING', _nro_people, _date_booking, _time_booking, _advanced_price, _to_name_of);
  ELSE
    IF _id_user IS NULL THEN
      INSERT INTO users (name) VALUES (_username);
      SET _id_user = LAST_INSERT_ID();
      UPDATE users SET name = CONCAT("USER-", _id_user, "-", _username)
      WHERE users.id = _id_user;
    END IF;

    INSERT INTO bookings (id_user, state_booking, nro_people, date_booking, time_booking, advanced_price, to_name_of)
    VALUES (_id_user, 'PENDING', _nro_people, _date_booking, _time_booking, _advanced_price, _to_name_of);
  END IF;
  COMMIT;
END
$$

CREATE PROCEDURE cancel_booking(IN _id_booking INT)
BEGIN
  START TRANSACTION;
  UPDATE bookings SET state_booking = 'CANCEL'
  WHERE bookings.id = _id_booking;
  COMMIT;
END
$$

CREATE PROCEDURE succes_booking(IN _id_booking INT)
BEGIN
  START TRANSACTION;
  UPDATE bookings SET state_booking = 'SUCCES'
  WHERE bookings.id = _id_booking;
  COMMIT;
END
$$

/* SU llamada al procedimiento no se hara todo el tiempo, sino cuando algun encargado
decida hacerlo, obviamente desde una interfaza grafica */
CREATE PROCEDURE booking_cleaning()
BEGIN
  START TRANSACTION;
  UPDATE bookings SET state_booking = 'LACK'
  WHERE bookings.state_booking = 'PENDING'
    AND (bookings.date_booking <= CURDATE()
    OR bookings.time_booking <= CURTIME());
  COMMIT;
END
$$
/************************************** Manager (encargadoss) ************************************************/
CREATE PROCEDURE add_manager(
  IN _name VARCHAR(30),
  IN _lastname VARCHAR(50),
  IN _username VARCHAR(30),
  IN _password VARCHAR(32)
)
BEGIN
  DECLARE exist_username_unique_violation CONDITION FOR 1062;
  DECLARE EXIT HANDLER FOR exist_username_unique_violation
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El nombre de usuario ya existe, elija otro";
  END;

  START TRANSACTION;
  INSERT INTO manager(name, lastname, username, password)
  VALUES (_name, _lastname, _username, _password);
  
  INSERT INTO modify(id_manager, type, description)
  VALUES (LAST_INSERT_ID(), 'CREATE', CONCAT("Encargado: Se agrego a un nuevo encargado con ID: ", LAST_INSERT_ID(), ", Nombre de usuario: ", _username));
  
  COMMIT;
END
$$

CREATE PROCEDURE update_manager(
  IN _id_manager INT,
  IN _name VARCHAR(30),
  IN _lastname VARCHAR(50),
  IN _username VARCHAR(30),
  IN _password VARCHAR(32)
)
BEGIN
  DECLARE exist_username_unique_violation CONDITION FOR 1062;
  DECLARE EXIT HANDLER FOR exist_username_unique_violation
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '23000'
      SET MESSAGE_TEXT = "El nombre de usuario ya existe, elija otro";
  END;

  START TRANSACTION;
  UPDATE manager
  SET
    name      = _name,
    lastname  = _lastname,
    username  = _username,
    password  = _password
  WHERE manager.id = _id_manager;
  
  INSERT INTO modify(id_manager, type, description)
  VALUES (_id_manager, 'CREATE', CONCAT("Encargado: Se actualizo informacion del encargado con ID: ", _id_manager, ", Nombre de usuario: ", _username));

  COMMIT;
END
$$

CREATE PROCEDURE delete_manager (
  IN _id_manager_to_delete INT
)
BEGIN
  START TRANSACTION;
  /* Elimina toda relacion con la tabla de modificaciones */
  UPDATE modify SET modify.id_manager = NULL
  WHERE modify.id_manager = _id_manager_to_delete;

  /* Registramos la eliminacion del encargado */
  INSERT INTO modify (type, description)
  VALUES ('DELETE', CONCAT("Encargado: Se elimino al encargado con numero de ID: " + _id_manager_to_delete));

  /* Finalmente se procede a eliminar al encargado */
  DELETE FROM manager WHERE manager.id = _id_manager_to_delete;
  COMMIT;
END
$$

DELIMITER ;