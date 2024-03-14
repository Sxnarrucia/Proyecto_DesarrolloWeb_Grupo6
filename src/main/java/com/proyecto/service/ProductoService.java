/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.service;


import com.proyecto.domain.Producto;
import java.util.List;

/**
 *
 * @author esanarru
 */
public interface ProductoService {
    //Se define la firma del metodo para recuperar los registros 
    //de la tabla producto en una lista

    public List<Producto> getProductos(boolean activos);

    //Se define la firma del metodo para recuperar UN registro de la tabla
    //considerando un valor de idProducto
    public Producto getProducto(Producto producto);

    //Se define la firma del metodo para Crear o Modificar registro
    //Si el idProducto es null, se crea
    //Si el idProducto tiene un valor se modifica
    public void save(Producto producto);

    //Se define la firma del metodo para elimiar un registro
    //Se elimina el registro que tiene idProducto
    public void delete(Producto producto);
}
