/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

/**
 *
 * @author esanarru
 */
@Data
@Entity
@Table(name="descuento")
public class Descuento implements Serializable{
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_descuento")
    private Long idDescuento;
    //private Long idCategoria; Por asociacion no se usa
    private String descripcion;
    private String detalle;
    private double precio;
    private int existencias;
    private String rutaImagen;
    private boolean activo;
    
    //Asociar dos clases que relacionan tablas
    @ManyToOne
    @JoinColumn(name="id_categoria")
    private Categoria categoria;
}

/*
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
*/