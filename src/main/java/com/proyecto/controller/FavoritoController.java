/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.controller;

import com.proyecto.domain.Item;
import com.proyecto.domain.Producto;
import com.proyecto.service.ItemService;
import com.proyecto.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author esanarru
 */
@Controller
public class FavoritoController {

    @Autowired
    private ProductoService productoService;
    @Autowired
    private ItemService itemService;

    @GetMapping("/favorito/agregar/{idProducto}")
    public ModelAndView agregar(Item item, Model model) {
        Item item2 = itemService.get(item);
        if (item2 == null) {
            Producto p = productoService.getProducto(item);
            item2 = new Item(p);
        }
        itemService.save(item2);
        var lista = itemService.gets();

        model.addAttribute("listaItems", lista);

        return new ModelAndView("/favorito/fragmentos :: verCarrito");
    }

    @GetMapping("/favorito/listado")
    public String listado(Model model) {
        var lista = itemService.gets();
        model.addAttribute("listaItems", lista);
        return "/favorito/listado";
    }

    @GetMapping("/favorito/eliminar/{idProducto}")
    public String eliminar(Item item) {
        itemService.delete(item);
        return "redirect:/favorito/listado";
    }

}
