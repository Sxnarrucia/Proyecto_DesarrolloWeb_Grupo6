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
@Table(name="favorito")
public class Favorito implements Serializable{
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_favorito")
    private Long idFavorito;
    
    //Asociar dos clases que relacionan tablas
    @OneToOne
    @JoinColumn(name="id_producto")
    private Producto producto;
}