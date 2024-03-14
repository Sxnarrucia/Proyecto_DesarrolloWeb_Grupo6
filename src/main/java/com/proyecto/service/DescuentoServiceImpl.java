/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.service;


import com.proyecto.dao.DescuentoDao;
import com.proyecto.domain.Descuento;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author esanarru
 */
@Service
public class DescuentoServiceImpl implements DescuentoService {
    
    @Autowired
    private DescuentoDao descuentoDao;

    @Override
    @Transactional(readOnly=true)
    public List<Descuento> getDescuentos(boolean activos) {
        var lista=descuentoDao.findAll();
        
        if (activos) { //si se quieren solo activas
            lista.removeIf(c -> !c.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly=true)
    public Descuento getDescuento(Descuento descuento) {
        return descuentoDao.findById(descuento.getIdDescuento()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Descuento descuento) {
        descuentoDao.save(descuento);
    }

    @Override
    @Transactional
    public void delete(Descuento descuento) {
        descuentoDao.delete(descuento);
    }
    
}
