/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.controller;



import com.proyecto.domain.Categoria;
import com.proyecto.service.CategoriaService;
import com.proyecto.service.DescuentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author esanarru
 */
@Controller
@RequestMapping("/descuento")
public class DescuentoController {
    
    @Autowired
    private DescuentoService descuentoService;
    @Autowired
    private CategoriaService categoriaService;
    
    @GetMapping("/listado")
    public String listado(Model model){
        
        var lista = descuentoService.getDescuentos(false);
        model.addAttribute("descuentos", lista);
        
        var categorias = categoriaService.getCategorias(false);      
        model.addAttribute("categorias", categorias);
        
        return "/descuento/listado";
    }
    
    @GetMapping("/listado/{idCategoria}")
    public String modifica(Categoria categoria, Model model){
        categoria = categoriaService.getCategoria(categoria);
        var lista = categoria.getProductos();
        model.addAttribute("descuentos", lista);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/descuento/listado";
    }
}
