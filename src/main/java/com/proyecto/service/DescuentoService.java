/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.service;


import com.proyecto.domain.Descuento;
import java.util.List;

/**
 *
 * @author esanarru
 */
public interface DescuentoService {
    //Se define la firma del metodo para recuperar los registros 
    //de la tabla descuento en una lista

    public List<Descuento> getDescuentos(boolean activos);

    //Se define la firma del metodo para recuperar UN registro de la tabla
    //considerando un valor de idDescuento
    public Descuento getDescuento(Descuento descuento);

    //Se define la firma del metodo para Crear o Modificar registro
    //Si el idDescuento es null, se crea
    //Si el idDescuento tiene un valor se modifica
    public void save(Descuento descuento);

    //Se define la firma del metodo para elimiar un registro
    //Se elimina el registro que tiene idDescuento
    public void delete(Descuento descuento);
}
