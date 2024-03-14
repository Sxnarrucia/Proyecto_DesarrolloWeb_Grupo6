/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.service;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author esanarru
 */

public interface FirebaseStorageService {

    public String cargaImagen(MultipartFile archivoLocalCliente, String carpeta, Long id);

    //El BuketName es el <id_del_proyecto> + ".appspot.com"
    final String BucketName = "happytimes-b9d22.appspot.com";

    //Esta es la ruta básica de este proyecto happytimes
    final String rutaSuperiorStorage = "happytimes";

    //Ubicación donde se encuentra el archivo de configuración Json
    final String rutaJsonFile = "firebase";
    
    //El nombre del archivo Json
    final String archivoJsonFile = "happytimes-b9d22-firebase-adminsdk-u3rs5-2ac00b2941.json";
}

