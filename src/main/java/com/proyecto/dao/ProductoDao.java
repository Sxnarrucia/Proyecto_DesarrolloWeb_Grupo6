/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.dao;


import com.proyecto.domain.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author esanarru
 */
public interface ProductoDao extends JpaRepository<Producto,Long>{
    
}
