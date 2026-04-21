package com.universidad.productosweb.service;

import com.universidad.productosweb.model.Producto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductoService {

    private final Map<Long, Producto> productos = new LinkedHashMap<>();
    private Long idActual = 1L;

    public ProductoService() {
        guardar(new Producto(null, "Laptop", "Laptop 16GB RAM", 1500.0));
        guardar(new Producto(null, "Mouse", "Mouse inalámbrico", 30.0));
        guardar(new Producto(null, "Teclado", "Teclado mecánico", 80.0));
    }

    public List<Producto> listar() {
        return new ArrayList<>(productos.values());
    }

    public Producto buscar(Long id) {
        return productos.get(id);
    }

    public Producto guardar(Producto p) {
        if (p.getId() == null) {
            p.setId(idActual++);
        }
        productos.put(p.getId(), p);
        return p;
    }

    public void eliminar(Long id) {
        productos.remove(id);
    }
}