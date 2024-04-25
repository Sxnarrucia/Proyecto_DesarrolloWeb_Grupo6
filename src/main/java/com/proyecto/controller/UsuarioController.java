/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyecto.controller;

import com.proyecto.domain.Usuario;
import com.proyecto.service.UsuarioService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author esanarru
 */
@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    UsuarioService usuarioService;

    @GetMapping("/perfil")
    public String perfil(Model model, Principal principal) {

        String un = principal.getName();
        model.addAttribute("usuario", usuarioService.getUsuarioPorUsername(un));

        return "/usuario/perfil";
    }

@PostMapping("/eliminar")
public String eliminarUsuario(HttpServletRequest request, HttpServletResponse response, Principal principal) {
    String username = principal.getName();
    Usuario usuario = usuarioService.getUsuarioPorUsername(username);
    if (usuario != null) {
        usuarioService.delete(usuario);
    }
    
    // Invalidar la sesión actual para que el usuario se desloguee
    new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
    
    return "redirect:/";
}

}
