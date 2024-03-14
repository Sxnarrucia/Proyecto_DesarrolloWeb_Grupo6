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

/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO happy_times.categoria (id_categoria,descripcion,ruta_imagen,activo) VALUES 
('1','Tarjetas', 'https://plugins-media.makeupar.com/smb/blog/post/2022-09-28/6d8981f1-8466-4f16-9063-68593cc384b9.jpg',   true), 
('2','Arreglos florales',  'https://hips.hearstapps.com/hmg-prod/images/arreglos-florales-1529053094.jpg',   true),
('3','Cajas','https://m.media-amazon.com/images/I/71zyo8el5-L.jpg',true),
('4','Globos','https://m.media-amazon.com/images/I/71HHZ4ZPuoL._AC_SL1500_.jpg',    false);

/*Se insertan 4 productos por categoria */
INSERT INTO happy_times.producto (id_producto,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'Tarjeta Cumpleaños','Lorem ipsum dolor sit amet consectetur adipiscing elit iaculis.',2500,10,'https://static.vecteezy.com/system/resources/previews/002/368/488/non_2x/happy-birthday-elegant-greeting-card-pink-air-balloons-and-falling-confetti-on-white-background-vector.jpg',true),
(2,1,'Tarjeta Graduación','Quisque in ridiculus scelerisque platea accumsan libero sem vel.',3500,12,'https://img.freepik.com/vector-gratis/invitacion-fiesta-graduacion-creativa_23-2147882761.jpg',true),
(3,1,'Tarjeta Aniversario','Natoque lacinia accumsan hendrerit pretium sociis imperdiet a.',5000,5,'https://marketplace.canva.com/EADiL852UPE/1/0/1600w/canva-25-aniversario-de-boda-floral-tarjeta-akTzRB0lKJk.jpg',true),
(4,1,'Tarjeta Viaje','Elementum sagittis dictumst leo curabitur porta, pellentesque interdum .',10000,20,'https://c8.alamy.com/compes/2hn1t8j/tarjetas-de-viaje-elementos-de-vacaciones-en-la-playa-durante-el-verano-accesorios-de-vacaciones-en-el-mar-banners-de-viaje-equipaje-de-dibujos-animados-ukulele-y-camara-costa-tropical-2hn1t8j.jpg',true),
(5,2,'Arreglo Rosas Blancas','Aenean senectus diam vitae curae habitant risus a et netus ante.',65000,5,'https://www.floresfrescasrd.com/wp-content/uploads/2023/03/Screenshot_20230307_115320_Photos.jpg',true),
(6,2,'Arreglo Tulipanes','Auctor id morbi tempor litora fusce potenti, ornare integer imperdiet.',55000,2,'https://laflordelacanela.mx/cdn/shop/products/20220406_catalogo_10mayo2022_LFDLC_WEB_-1_691x.jpg',true),
(7,2,'Arreglo Rosas','Cum placerat etiam lobortis curabitur fames class facilisi hac duis, congue.',25000,5,'https://www.costaricaflores.com/wp-content/uploads/2023/11/RRA11-arreglo-rosas-de-frente.jpg',true),
(8,2,'Arreglo Girasoles','Purus dictumst scelerisque mollis platea malesuada per vehicula lectus.',27600,2,'https://www.chocolatestheocr.com/wp-content/uploads/2022/05/Arreglo-con-Girasoles.jpg',true),
(9,3,'Caja Circular','Morbi egestas sociis magnis curabitur suscipit nostra blandit magna torquent.',15780,5,'https://farosupplies.com/1576-large_default/caja-redonda-p-micro-y-horno-45-ml.jpg',true),
(10,3,'Caja Rectangular','Rhoncus ante magna cursus consequat proin senectus ridiculus,.',15000,2,'https://madeheart.com/media/productphoto/860/57875978/1_04_003.jpg',true),
(11,3,'Caja Cuadrada','Primis quis sollicitudin ac himenaeos dui metus ridiculus.',25400,5,'https://i.pinimg.com/564x/b6/80/10/b6801033f74ae9b41c086d87efe3f4f9.jpg',true),
(12,3,'Caja Corazón','Risus tristique donec faucibus cursus dictumst vestibulum maecenas.',45000,3,'https://ecobrisamanualidades.com/wp-content/uploads/2022/01/caja-corazon-1024x688.jpg',true),
(13,4,'Globo Elefante','Nam ad hac curae mollis dui scelerisque convallis eros.',285000,0,'https://globofiesta.com/wp-content/uploads/2019/10/elefant1.jpg',true),
(14,4,'Globo Graduación','Luctus lacus montes vulputate libero purus est litora.',154000,0,'https://www.happytowncr.com/wp-content/uploads/2022/01/qualatex-latex-diamond-clear-graduation-hats-11-latex-balloons-50-count-28896932954201@2x-1.jpg',true),
(15,4,'Globo Estrella','Nullam porttitor vivamus phasellus tempus in morbi aliquet platea duis.',33000,0,'https://www.happytowncr.com/wp-content/uploads/2021/07/estrella-dorada.jpg',true),
(16,4,'Globo Decorado','Litora metus senectus mattis egestas mus fames tempus suscipit.',27300,0,'https://cdn7.kiwilimon.com/ss_secreto/1487/1487.jpg',true);