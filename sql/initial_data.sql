-- Active: 1686749315704@@127.0.0.1@3306@leyvaraunt

DELIMITER ;

/* Agregaremos al usuario */

CALL add_manager ("Cristhian", "Lima", "clb.com", MD5("clb"));

CALL add_manager ("Erick", "Leyva", "leyva", MD5("leyva"));

CALL
    add_information(
        "En el Restaurante Leyvaraunt, nos enorgullece ofrecerte una experiencia gastronomica excepcional que deleitara todos tus sentidos. Desde nuestra ubicacion privilegiada en el corazon de la ciudad, te invitamos a sumergirte en un mundo de sabores exquisitos, atencion impecable y un ambiente acogedor.
Nuestro equipo de talentosos chefs ha creado un menu diverso y cautivador, cuidadosamente elaborado con los ingredientes mas frescos y de la mas alta calidad. Desde platos tradicionales con un toque moderno hasta creaciones unicas y sorprendentes, cada bocado esta diseñado para transportarte a un viaje culinario lleno de emociones.
En el Restaurante Leyvaraunt, creemos en la importancia de brindar un servicio excepcional. Nuestro personal capacitado y amable estara encantado de guiarte a traves de nuestra oferta gastronomica, recomendarte maridajes perfectos con nuestra seleccion de vinos y asegurarse de que cada detalle de tu experiencia sea memorable.
Ademas de nuestro acogedor salon principal, ofrecemos opciones de comedor al aire libre, perfectas para disfrutar de una comida relajada y apreciar el encanto de la ciudad. Ya sea que estes celebrando una ocasion especial, compartiendo una cena romantica o simplemente buscando una experiencia culinaria excepcional, el Restaurante Leyvaraunt es el lugar ideal.
Nos enorgullece contar con un ambiente sofisticado y elegante, donde el diseño contemporaneo se mezcla con elementos calidos y acogedores. Cada detalle, desde la iluminacion suave hasta la seleccion musical cuidadosamente elegida, ha sido pensado para crear una atmosfera unica y envolvente que te invita a relajarte y disfrutar de cada momento.
Ademas de nuestras deliciosas opciones gastronomicas, tambien ofrecemos servicios de catering para eventos especiales. Ya sea que estes planeando una celebracion privada, una reunion de negocios o cualquier otra ocasion, nuestro equipo estara encantado de crear un menu personalizado que satisfaga tus necesidades y supere tus expectativas.
En el Restaurante Leyvaraunt, nos esforzamos por brindar una experiencia culinaria inolvidable en cada visita. Nos apasiona la comida, el servicio y la satisfaccion de nuestros clientes. Te invitamos a unirte a nosotros y descubrir la excelencia culinaria en un entorno encantador.
¡Esperamos recibirte pronto en el Restaurante Leyvaraunt y deleitarte con nuestras creaciones culinarias unicas!",
        "Encuentranos en el corazon de la ciudad, en una ubicacion privilegiada que combina comodidad y accesibilidad. El Restaurante Delicioso se encuentra en [direccion], justo en el bullicio del centro urbano. Ya sea que estes explorando la ciudad o buscando un lugar cercano para disfrutar de una deliciosa comida, estamos convenientemente ubicados para brindarte una experiencia culinaria excepcional. Nuestro restaurante cuenta con facil acceso en transporte publico y amplio estacionamiento cercano. ¡Te esperamos con los brazos abiertos!",
        "En el Restaurante Leyvaraunt, nos complace ofrecer nuestros servicios para el almuerzo y la cena, asegurandonos de que puedas disfrutar de nuestras exquisitas creaciones en los momentos que mas te convengan. Nuestro horario para el almuerzo es de 13:00 de Lunes a Sabado. Durante este tiempo, te invitamos a degustar nuestros platos exclusivos, preparados con los ingredientes mas frescos y sabrosos.
Para la cena, nuestras puertas se abren a partir de 18:00 de Lunes a Sabado. Durante la noche, puedes disfrutar de una experiencia culinaria unica mientras te sumerges en un ambiente elegante y acogedor. Nuestro equipo esta preparado para ofrecerte un servicio excepcional y garantizar que cada momento sea especial y memorable.
Ten en cuenta que es posible que recomendemos hacer reservas para asegurarte un lugar en nuestro restaurante, especialmente durante las horas pico. Nuestro objetivo es brindarte una experiencia fluida y sin complicaciones, por lo que te animamos a contactarnos y realizar una reserva anticipada.
Ya sea que nos visites para el almuerzo o la cena, te aseguramos que cada visita al Restaurante Leyvaraunt sera una ocasion para deleitar tus sentidos y satisfacer tu paladar. ¡Esperamos verte pronto!"
    );

CALL add_category("Entradas");

CALL add_category("Ensaladas");

CALL add_category("Sopas");

CALL add_category("Especialidad de la casa");

CALL add_category("Clasicos");

CALL add_category("Postres");

CALL add_category("Bebidas");

CALL add_category("Cocteles");

CALL add_category("Vinos");

CALL add_product(1, "Jamon con queso", "NINGUNA", 5);

CALL add_product(1, "Jamon con brocoli", "NINGUNA", 5);

CALL add_product(2, "Ensalada Rusa", "NINGUNA", 7.65);

CALL add_product(2, "Ensalada verde", "NINGUNA", 4.99);

CALL add_product(2, "Ensalada de pepino", "NINGUNA", 6.12);

CALL add_product(3, "Sopa de mani", "NINGUNA", 11);

CALL add_product(3, "Sopa de semola", "NINGUNA", 11);

CALL add_product(3, "Locro", "NINGUNA", 15.68);

CALL add_product(3, "Sopa de tomate", "NINGUNA", 8.75);

CALL add_product(4, "Pollo a la LEYVA", "NINGUNA", 86.68);

CALL add_product(5, "Asado", "NINGUNA", 15.39);

CALL add_product(5, "Chuleta de cerdo", "NINGUNA", 18.99);

CALL add_product(5, "Bistec", "NINGUNA", 14.65);

CALL add_product(5, "Saise", "NINGUNA", 14.65);

CALL add_product(5, "Sajta", "NINGUNA", 14.65);

CALL add_product(5, "Thimpu", "NINGUNA", 16.54);

CALL add_product(5, "Fricase", "NINGUNA", 17.99);

CALL add_product(5, "Fricase especial", "NINGUNA", 22.36);

CALL add_product(6, "Gelatina", "NINGUNA", 5);

CALL add_product(6, "Pudin", "NINGUNA", 9.99);

CALL add_product(6, "Cup Cake", "NINGUNA", 9.5);

CALL add_product(6, "Brazo gitano", "NINGUNA", 10);

CALL add_product(7, "Mocochinchi", "NINGUNA", 2);

CALL add_product(7, "Chicha", "NINGUNA", 3.5);

CALL add_product(7, "Leche de majo", "NINGUNA", 7.43);

CALL add_product(7, "Asai", "NINGUNA", 7.53);

CALL add_product(7, "Jugo de maracuya", "NINGUNA", 4.53);

CALL add_product(8, "Coctleyva", "NINGUNA", 14.99);

CALL add_product(8, "Martini", "NINGUNA", 24.98);

CALL add_product(9, "Vino rozado LAMUE", "NINGUNA", 199.98);

CALL add_product(9, "Vino blanco LAMUE", "NINGUNA", 149.98);

CALL add_product(9, "Vino tinto LAMUE", "NINGUNA", 289.98);

CALL
    add_product(
        9,
        "Vino tinto LAMUE exclusivo",
        "Una cosecha de hace mas de un siglo macerado desde 1893",
        1289.98
    );