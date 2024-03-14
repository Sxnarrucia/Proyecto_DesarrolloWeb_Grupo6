/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.service;


import com.proyecto.domain.Categoria;
import java.util.List;

/**
 *
 * @author esanarru
 */
public interface CategoriaService {
    //Se define la firma del metodo para recuperar los registros 
    //de la tabla categoria en una lista

    public List<Categoria> getCategorias(boolean activos);

    //Se define la firma del metodo para recuperar UN registro de la tabla
    //considerando un valor de idCategoria
    public Categoria getCategoria(Categoria categoria);

    //Se define la firma del metodo para Crear o Modificar registro
    //Si el idCategoria es null, se crea
    //Si el idCategoria tiene un valor se modifica
    public void save(Categoria categoria);

    //Se define la firma del metodo para elimiar un registro
    //Se elimina el registro que tiene idCategoria
    public void delete(Categoria categoria);
}
