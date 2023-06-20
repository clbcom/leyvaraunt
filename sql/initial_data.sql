-- Active: 1686749315704@@127.0.0.1@3306@leyvaraunt
DELIMITER ;

/* Agregaremos al usuario */
CALL add_manager (NULL,"Cristhian", "Lima", "clb.com", MD5("clb"));

CALL add_information(
  1,
  "Alguna descripcion bien perrona generada por chatGPT",
  "alguna localizacion bien perrona para nuestro restaurante igualmente generado por ChatGPT",
  "Unos horarios bien guachines por la tarde (Comida) y por la noche (Cena)"
);

CALL add_category(1, "Entradas");
CALL add_category(1, "Ensaladas");
CALL add_category(1, "Sopas");
CALL add_category(1, "Especialidad de la casa");
CALL add_category(1, "Clasicos");
CALL add_category(1, "Postres");
CALL add_category(1, "Bebidas");
CALL add_category(1, "Cocteles");
CALL add_category(1, "Vinos");

CALL add_product(1, 1, "Jamon con queso", "NINGUNA", 5);
CALL add_product(1, 1, "Jamon con brocoli", "NINGUNA", 5);
CALL add_product(1, 2, "Ensalada Rusa", "NINGUNA", 7.65);
CALL add_product(1, 2, "Ensalada verde", "NINGUNA", 4.99);
CALL add_product(1, 2, "Ensalada de pepino", "NINGUNA", 6.12);
CALL add_product(1, 3, "Sopa de mani", "NINGUNA", 11);
CALL add_product(1, 3, "Sopa de semola", "NINGUNA", 11);
CALL add_product(1, 3, "Locro", "NINGUNA", 15.68);
CALL add_product(1, 3, "Sopa de tomate", "NINGUNA", 8.75);
CALL add_product(1, 4, "Pollo a la LEYVA", "NINGUNA", 86.68);
CALL add_product(1, 5, "Asado", "NINGUNA", 15.39);
CALL add_product(1, 5, "Chuleta de cerdo", "NINGUNA", 18.99);
CALL add_product(1, 5, "Bistec", "NINGUNA", 14.65);
CALL add_product(1, 5, "Saise", "NINGUNA", 14.65);
CALL add_product(1, 5, "Sajta", "NINGUNA", 14.65);
CALL add_product(1, 5, "Thimpu", "NINGUNA", 16.54);
CALL add_product(1, 5, "Fricase", "NINGUNA", 17.99);
CALL add_product(1, 5, "Fricase especial", "NINGUNA", 22.36);
CALL add_product(1, 6, "Gelatina", "NINGUNA", 5);
CALL add_product(1, 6, "Pudin", "NINGUNA", 9.99);
CALL add_product(1, 6, "Cup Cake", "NINGUNA", 9.5);
CALL add_product(1, 6, "Brazo gitano", "NINGUNA", 10);
CALL add_product(1, 7, "Mocochinchi", "NINGUNA", 2);
CALL add_product(1, 7, "Chicha", "NINGUNA", 3.5);
CALL add_product(1, 7, "Leche de majo", "NINGUNA", 7.43);
CALL add_product(1, 7, "Asai", "NINGUNA", 7.53);
CALL add_product(1, 7, "Jugo de maracuya", "NINGUNA", 4.53);
CALL add_product(1, 8, "Coctleyva", "NINGUNA", 14.99);
CALL add_product(1, 8, "Piña colada", "NINGUNA", 19.98);
CALL add_product(1, 8, "Martini", "NINGUNA", 24.98);
CALL add_product(1, 9, "Vino rozado LAMUE", "NINGUNA", 199.98);
CALL add_product(1, 9, "Vino blanco LAMUE", "NINGUNA", 149.98);
CALL add_product(1, 9, "Vino tinto LAMUE", "NINGUNA", 289.98);
CALL add_product(1, 9, "Vino tinto LAMUE exclusivo", "Una cosecha de hace mas de un siglo añejado desde 1893", 1289.98);

CALL add_booking(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.35",
  2,
  '2023-06-18',
  '20:00',
  0,
  "Gran Rozado",
  NULL,
  NULL,
  NULL,
  NULL
);

CALL add_booking(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
  4,
  '2023-06-23',
  '21:00',
  34,
  "Cristhian Lima",
  "5265200114661889",
  "Crithian Lima Blanco",
  STR_TO_DATE("01/05/25", "%d/%m/%y"),
  174
);

CALL add_booking(
  "USER-1-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.35",
  3,
  '2023-06-21',
  '20:00',
  0,
  "Gran Rozado",
  NULL,
  NULL,
  NULL,
  NULL
);

CALL add_booking(
  "USER-2-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
  2,
  '2023-06-24',
  '21:30',
  34,
  "Cristhian Lima",
  "5265200114661889",
  "Crithian Lima Blanco",
  STR_TO_DATE("01/05/25", "%d/%m/%y"),
  174
);

CALL add_booking(
  "USER-1-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.35",
  2,
  '2023-06-16',
  '20:00',
  0,
  "Gran Rozado",
  NULL,
  NULL,
  NULL,
  NULL
);

CALL add_booking(
  "USER-2-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
  2,
  '2023-06-19',
  '21:00',
  34,
  "Cristhian Lima",
  "5265200114661889",
  "Crithian Lima Blanco",
  STR_TO_DATE("01/05/25", "%d/%m/%y"),
  174
);

CALL add_booking(
  "USER-1-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.35",
  2,
  '2023-06-17',
  '13:00',
  0,
  "Gran Rozado",
  NULL,
  NULL,
  NULL,
  NULL
);

CALL add_booking(
  "USER-1-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.35",
  2,
  '2023-06-20',
  '13:15',
  0,
  "Gran Rozado",
  NULL,
  NULL,
  NULL,
  NULL
);

CALL add_booking(
  "USER-2-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
  4,
  '2023-06-24',
  '15:00',
  34,
  "Cristhian Lima",
  "5265200114661889",
  "Crithian Lima Blanco",
  STR_TO_DATE("01/05/25", "%d/%m/%y"),
  174
);
CALL succes_booking(5);
CALL succes_booking(8);
CALL succes_booking(6);
CALL cancel_booking(2);
CALL booking_cleaning();