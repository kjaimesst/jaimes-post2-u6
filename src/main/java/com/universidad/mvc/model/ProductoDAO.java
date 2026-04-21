package com.universidad.mvc.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProductoDAO {
    private static final List<Producto> lista = new ArrayList<>();
    private static int contador = 4;
    static {
        lista.add(new Producto(1, "Laptop lenovo", "Computadoras", 299, 10));
        lista.add(new Producto(2, "Smartphone 15pro", "Teléfonos", 999, 25));
        lista.add(new Producto(3, "Mouse", "Periféricos", 1099, 50));
    }
    public List<Producto> findAll() {
        return Collections.unmodifiableList(lista);
    }
    public Producto findById(int id) {
        return lista.stream()
        .filter(p -> p.getId() == id)
        .findFirst().orElse(null);
    }
    public void save(Producto p) {
        p.setId(++contador);
        lista.add(p);
    }
    public void update(Producto p) {
        for (int i = 0; i < lista.size(); i++) {
        if (lista.get(i).getId() == p.getId()) {
        lista.set(i, p); return;
            }
        }
    }
    public void delete(int id) {
        lista.removeIf(p -> p.getId() == id);
    }
}