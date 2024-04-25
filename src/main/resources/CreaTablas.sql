/*Se crea la base de datos */
drop schema if exists happy_times;
drop user if exists happy_admin;
CREATE SCHEMA happy_times ;

/*Se crea un usuario para la base de datos llamado "happy_admin" y tiene la contraseña "happy_pass."*/
create user 'happy_admin'@'%' identified by 'happy_pass.';

/*Se asignan los prvilegios sobr ela base de datos Happy Times al usuario creado */
grant all privileges on happy_times.* to 'happy_admin'@'%';
flush privileges;

/* la tabla de categoria contiene categorias de productos*/
create table happy_times.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table happy_times.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table happy_times.descuento (
  id_descuento INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_descuento),
  foreign key fk_descuento_categoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table happy_times.favorito (
  id_favorito INT NOT NULL AUTO_INCREMENT,
  id_producto INT NOT NULL,
  PRIMARY KEY (id_favorito),
  foreign key fk_favorito_producto (id_producto) references producto(id_producto)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE happy_times.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(50) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table happy_times.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO happy_times.categoria (id_categoria,descripcion,ruta_imagen,activo) VALUES 
('1','Tarjetas', 'https://plugins-media.makeupar.com/smb/blog/post/2022-09-28/6d8981f1-8466-4f16-9063-68593cc384b9.jpg',   true), 
('2','Arreglos florales',  'https://hips.hearstapps.com/hmg-prod/images/arreglos-florales-1529053094.jpg',   true),
('3','Cajas','https://m.media-amazon.com/images/I/71zyo8el5-L.jpg',true),
('4','Globos','https://m.media-amazon.com/images/I/71HHZ4ZPuoL._AC_SL1500_.jpg',    false);

/*Se insertan 4 productos por categoria */
INSERT INTO happy_times.producto (id_producto,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'Tarjeta Cumpleaños','Tarjeta física diseñada para celebrar el día especial de cumpleaños de alguien querido. Con diversos diseños y mensajes personalizados, estas tarjetas ofrecen una forma tangible y significativa de expresar tus buenos deseos en esta ocasión especial. ¡Celebra con estilo y envía una Tarjeta Cumpleaños hoy mismo!',2500,10,'https://static.vecteezy.com/system/resources/previews/002/368/488/non_2x/happy-birthday-elegant-greeting-card-pink-air-balloons-and-falling-confetti-on-white-background-vector.jpg',true),
(2,1,'Tarjeta Graduación','Tarjeta física diseñada para celebrar y felicitar a alguien por su logro académico al graduarse. Con diseños elegantes y mensajes de felicitación, estas tarjetas son una forma especial de expresar tu orgullo y buenos deseos en este importante hito en la vida de alguien. ¡Envía una Tarjeta Graduación y comparte la alegría de este logro único!',3500,12,'https://img.freepik.com/vector-gratis/invitacion-fiesta-graduacion-creativa_23-2147882761.jpg',true),
(3,1,'Tarjeta Aniversario','Tarjeta física diseñada para conmemorar y celebrar un aniversario especial, ya sea de matrimonio, relación u otro evento significativo. Con diseños románticos y mensajes conmovedores, estas tarjetas ofrecen una forma única de expresar amor, gratitud y celebración en esta ocasión especial. ¡Envía una Tarjeta Aniversario y celebra el amor y la unión que perduran en el tiempo!',5000,5,'https://marketplace.canva.com/EADiL852UPE/1/0/1600w/canva-25-aniversario-de-boda-floral-tarjeta-akTzRB0lKJk.jpg',true),
(4,1,'Tarjeta Viaje','Tarjeta física diseñada para desear un feliz viaje a alguien que se embarca en una aventura. Con diseños inspiradores y mensajes alentadores, estas tarjetas son una forma especial de expresar tus mejores deseos y emocionarte por la experiencia que está por venir. ¡Envía una Tarjeta Viaje y comparte la emoción de explorar nuevos horizontes!',10000,20,'https://c8.alamy.com/compes/2hn1t8j/tarjetas-de-viaje-elementos-de-vacaciones-en-la-playa-durante-el-verano-accesorios-de-vacaciones-en-el-mar-banners-de-viaje-equipaje-de-dibujos-animados-ukulele-y-camara-costa-tropical-2hn1t8j.jpg',true),
(5,2,'Arreglo Rosas Blancas','Es un hermoso conjunto floral que transmite elegancia y pureza. Con delicadas rosas blancas cuidadosamente dispuestas, este arreglo es perfecto para expresar sentimientos de amor, admiración, respeto o consuelo. Ya sea para celebrar una ocasión especial o simplemente para iluminar el día de alguien, un Arreglo Rosas Blancas es una elección clásica y significativa.',65000,5,'https://www.floresfrescasrd.com/wp-content/uploads/2023/03/Screenshot_20230307_115320_Photos.jpg',true),
(6,2,'Arreglo Tulipanes','Es un hermoso conjunto floral que irradia alegría y frescura. Con sus tallos elegantes y sus brillantes pétalos en una variedad de colores vibrantes, este arreglo es perfecto para transmitir felicitaciones, buenos deseos o simplemente para alegrar el día de alguien especial. Los tulipanes son flores que simbolizan la primavera y la renovación, haciendo que un Arreglo Tulipanes sea una elección encantadora y llena de significado.',55000,2,'https://laflordelacanela.mx/cdn/shop/products/20220406_catalogo_10mayo2022_LFDLC_WEB_-1_691x.jpg',true),
(7,2,'Arreglo Rosas','Es un elegante conjunto floral que transmite amor, admiración y aprecio. Con sus tallos largos y elegantes y sus hermosos pétalos en una variedad de colores vibrantes, este arreglo es perfecto para expresar sentimientos sinceros en cualquier ocasión especial. Ya sea para celebrar el amor en el Día de San Valentín, para felicitar a alguien por un logro importante o simplemente para hacer sonreír a alguien, un Arreglo Rosas es una elección clásica y conmovedora.',25000,5,'https://www.costaricaflores.com/wp-content/uploads/2023/11/RRA11-arreglo-rosas-de-frente.jpg',true),
(8,2,'Arreglo Girasoles','Es un hermoso conjunto floral que evoca la alegría y la vitalidad de un campo soleado. Con sus tallos altos y robustos y sus brillantes pétalos amarillos que imitan el sol, este arreglo es perfecto para transmitir felicidad, energía positiva y buenos deseos. Los girasoles también simbolizan la admiración y la lealtad, haciendo que un Arreglo Girasoles sea una elección encantadora y llena de significado para celebrar la amistad, el amor o simplemente para iluminar el día de alguien especial.',27600,2,'https://www.chocolatestheocr.com/wp-content/uploads/2022/05/Arreglo-con-Girasoles.jpg',true),
(9,3,'Caja Circular','Es un contenedor versátil y elegante que combina funcionalidad con estilo. Con su diseño circular y materiales de alta calidad, esta caja es perfecta para almacenar objetos pequeños de forma organizada y añadir un toque de sofisticación a cualquier espacio. Ya sea utilizada como un accesorio decorativo o como un práctico elemento de almacenamiento, una Caja Circular es una elección elegante y funcional para cualquier hogar u oficina.',15780,5,'https://farosupplies.com/1576-large_default/caja-redonda-p-micro-y-horno-45-ml.jpg',true),
(10,3,'Caja Rectangular','Es un contenedor práctico y funcional que ofrece una solución de almacenamiento elegante y eficiente. Con su diseño rectangular y líneas limpias, esta caja es ideal para organizar objetos pequeños, documentos o accesorios de manera ordenada y accesible. Fabricada con materiales duraderos y de alta calidad, una Caja Rectangular es una opción versátil que combina estilo y utilidad en cualquier ambiente, ya sea en el hogar, la oficina o cualquier otro espacio.',15000,2,'https://madeheart.com/media/productphoto/860/57875978/1_04_003.jpg',true),
(11,3,'Caja Cuadrada','Es un contenedor compacto y versátil que ofrece una solución de almacenamiento práctica y estilizada. Con su diseño de cuatro lados iguales y líneas simples, esta caja es ideal para organizar objetos pequeños, joyas o recuerdos de manera ordenada y accesible. Fabricada con materiales duraderos y de alta calidad, una Caja Cuadrada es una elección elegante y funcional para cualquier espacio, ya sea en el hogar, la oficina o cualquier otro entorno donde se necesite un almacenamiento ordenado y estético.',25400,5,'https://i.pinimg.com/564x/b6/80/10/b6801033f74ae9b41c086d87efe3f4f9.jpg',true),
(12,3,'Caja Corazón','Es un envase encantador y significativo que evoca amor y ternura. Con su distintiva forma de corazón y materiales de alta calidad, esta caja es perfecta para regalar pequeños detalles, joyas u obsequios especiales. Ya sea utilizada como un empaque elegante o como un elemento decorativo por sí misma, una Caja Corazón añade un toque de romance y cariño a cualquier ocasión especial. Sorprende a tus seres queridos con un regalo que viene desde el corazón en una Caja Corazón.',45000,3,'https://ecobrisamanualidades.com/wp-content/uploads/2022/01/caja-corazon-1024x688.jpg',true),
(13,4,'Globo Elefante','El "Globo Elefante" es una encantadora pieza decorativa que añade un toque lúdico y tierno a cualquier celebración. Con forma de elefante y colores vibrantes, este globo es perfecto para decorar fiestas de cumpleaños, baby showers o cualquier ocasión especial. Su diseño adorable y su tamaño llamativo lo convierten en un elemento decorativo que seguramente capturará la atención y alegrará a los invitados de todas las edades. ¡Celebra de manera divertida y original con un Globo Elefante!',28500,0,'https://globofiesta.com/wp-content/uploads/2019/10/elefant1.jpg',true),
(14,4,'Globo Graduación','Es una forma festiva de celebrar los logros académicos de un graduado. Con un diseño llamativo que incluye mensajes de felicitación y motivación, este globo es perfecto para decorar fiestas de graduación y eventos relacionados. Su tamaño y brillo lo convierten en un punto focal en la decoración, añadiendo un toque especial a la celebración. Celebra el éxito de tu graduado con un Globo Graduación que les recuerde lo lejos que han llegado y lo brillante que es su futuro.',15400,0,'https://www.happytowncr.com/wp-content/uploads/2022/01/qualatex-latex-diamond-clear-graduation-hats-11-latex-balloons-50-count-28896932954201@2x-1.jpg',true),
(15,4,'Globo Estrella','El "Globo Estrella" es un accesorio brillante y alegre que añade un toque de magia a cualquier celebración. Con su forma de estrella y colores vibrantes, este globo es perfecto para decorar fiestas de cumpleaños, eventos especiales o simplemente para alegrar el día de alguien. Su diseño llamativo lo convierte en un elemento decorativo que destaca y crea un ambiente festivo y alegre. Celebra con estilo y brillo con un Globo Estrella que ilumine cualquier ocasión.',33000,0,'https://www.happytowncr.com/wp-content/uploads/2021/07/estrella-dorada.jpg',true),
(16,4,'Globo Decorado','El "Globo Decorado" es un elemento versátil y festivo que añade un toque especial a cualquier celebración. Con una variedad de diseños y estilos disponibles, estos globos son perfectos para decorar fiestas de cumpleaños, baby showers, bodas y eventos corporativos. Desde globos con estampados coloridos hasta globos con mensajes personalizados, hay una amplia gama de opciones para adaptarse a cualquier ocasión y estilo. Celebra de manera creativa y original con un Globo Decorado que añada un toque de diversión y elegancia a tu evento.',27300,0,'https://cdn7.kiwilimon.com/ss_secreto/1487/1487.jpg',true);

INSERT INTO happy_times.descuento (id_descuento,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'Tarjeta Cumpleaños','Tarjeta física diseñada para celebrar el día especial de cumpleaños de alguien querido. Con diversos diseños y mensajes personalizados, estas tarjetas ofrecen una forma tangible y significativa de expresar tus buenos deseos en esta ocasión especial. ¡Celebra con estilo y envía una Tarjeta Cumpleaños hoy mismo!',1500,10,'https://static.vecteezy.com/system/resources/previews/002/368/488/non_2x/happy-birthday-elegant-greeting-card-pink-air-balloons-and-falling-confetti-on-white-background-vector.jpg',true),
(7,2,'Arreglo Rosas','Es un elegante conjunto floral que transmite amor, admiración y aprecio. Con sus tallos largos y elegantes y sus hermosos pétalos en una variedad de colores vibrantes, este arreglo es perfecto para expresar sentimientos sinceros en cualquier ocasión especial. Ya sea para celebrar el amor en el Día de San Valentín, para felicitar a alguien por un logro importante o simplemente para hacer sonreír a alguien, un Arreglo Rosas es una elección clásica y conmovedora.',12500,5,'https://www.costaricaflores.com/wp-content/uploads/2023/11/RRA11-arreglo-rosas-de-frente.jpg',true),
(12,3,'Caja Corazón','Risus tristique donec faucibus cursus dictumst vestibulum maecenas.',20000,3,'https://ecobrisamanualidades.com/wp-content/uploads/2022/01/caja-corazon-1024x688.jpg',true),
(13,4,'Globo Elefante','El "Globo Elefante" es una encantadora pieza decorativa que añade un toque lúdico y tierno a cualquier celebración. Con forma de elefante y colores vibrantes, este globo es perfecto para decorar fiestas de cumpleaños, baby showers o cualquier ocasión especial. Su diseño adorable y su tamaño llamativo lo convierten en un elemento decorativo que seguramente capturará la atención y alegrará a los invitados de todas las edades. ¡Celebra de manera divertida y original con un Globo Elefante!',14000,0,'https://globofiesta.com/wp-content/uploads/2019/10/elefant1.jpg',true);

/*Se insertan 3 registros en la tabla cliente como ejemplo */
INSERT INTO happy_times.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'Esteban','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan', 'Castro Mora',    'jcastro@gmail.com',    '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'Roberto','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca',  'Contreras Mora', 'acontreras@gmail.com', '5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',true),
(3,'Wilberth','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro', 'Mena Loria',     'lmena@gmail.com',      '7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);

insert into happy_times.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_USER',1),
 (2,'ROLE_USER',2),
 (3,'ROLE_USER',3);