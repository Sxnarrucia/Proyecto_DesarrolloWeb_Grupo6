
package com.proyecto.service;

import com.proyecto.domain.Item;
import java.util.ArrayList;
import java.util.List;


public interface ItemService {
    //Estructura para almacenar en memoria la lista del carrito
    
    List<Item> listaItems = new ArrayList<>();
    
    public List<Item> gets();
    
    public Item get(Item item);
    
    public void delete(Item item);
    
    public void save(Item item);
    
    
}
