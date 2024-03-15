/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.controller;

import com.proyecto.domain.Categoria;
import com.proyecto.service.CategoriaService;
import com.proyecto.service.ProductoService;
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
@RequestMapping("/pruebas")
public class PruebasController {

    @Autowired
    private ProductoService productoService;
    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/listado")
    public String listado(Model model) {

        var lista = productoService.getProductos(false);

        model.addAttribute("productos", lista);
        var categorias = categoriaService.getCategorias(false);

        model.addAttribute("categorias", categorias);
        return "/pruebas/listado";
    }

    @GetMapping("/listado/{idCategoria}")
    public String modifica(Categoria categoria, Model model) {
        categoria = categoriaService.getCategoria(categoria);
        var lista = categoria.getProductos();
        model.addAttribute("productos", lista);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/pruebas/listado";
    }
}
