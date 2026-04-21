package com.universidad.mvc.controller;

import com.universidad.mvc.service.ProductoService;
import com.universidad.mvc.model.Producto;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {

    private final ProductoService service = new ProductoService();

    // ====== VERIFICAR SESIÓN ======
    private boolean verificarSesion(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession s = req.getSession(false);

        if (s == null || s.getAttribute("usuarioActual") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return false;
        }
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    if (!verificarSesion(req, resp)) return;

    String accion = req.getParameter("accion");

    if (accion == null || accion.equals("listar")) {

        List<Producto> productos = service.obtenerTodos();
        req.setAttribute("productos", productos);

        req.getRequestDispatcher("/WEB-INF/views/lista.jsp")
                .forward(req, resp);
        return;
        }

    if (accion.equals("formulario")) {

        req.getRequestDispatcher("/WEB-INF/views/formulario.jsp")
                .forward(req, resp);
        return;
        }

    if (accion.equals("editar")) {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("producto", service.obtenerPorId(id));

        req.getRequestDispatcher("/WEB-INF/views/formulario.jsp")
                .forward(req, resp);
        return;
        }

    if (accion.equals("eliminar")) {
        int id = Integer.parseInt(req.getParameter("id"));
        service.eliminar(id);

        resp.sendRedirect(req.getContextPath() + "/productos");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!verificarSesion(req, resp)) return;

        guardar(req, resp);
    }

    // ====== VALIDACIONES ======
    private void guardar(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String nombre = req.getParameter("nombre");
        String precioStr = req.getParameter("precio");
        String stockStr = req.getParameter("stock");
        String categoria = req.getParameter("categoria");

        Map<String, String> errores = new LinkedHashMap<>();

        if (nombre == null || nombre.trim().isEmpty())
            errores.put("nombre", "El nombre del producto es obligatorio.");
        else if (nombre.length() > 100)
            errores.put("nombre", "No debe superar 100 caracteres.");

        double precio = 0;
        try {
            precio = Double.parseDouble(precioStr);
            if (precio < 0)
                errores.put("precio", "No puede ser negativo.");
        } catch (Exception e) {
            errores.put("precio", "Debe ser número válido.");
        }

        int stock = 0;
        try {
            stock = Integer.parseInt(stockStr);
            if (stock < 0)
                errores.put("stock", "No puede ser negativo.");
        } catch (Exception e) {
            errores.put("stock", "Debe ser entero válido.");
        }

        if (!errores.isEmpty()) {
            req.setAttribute("errores", errores);
            req.setAttribute("nombre", nombre);
            req.setAttribute("precio", precioStr);
            req.setAttribute("stock", stockStr);
            req.setAttribute("categoria", categoria);

            req.getRequestDispatcher("/WEB-INF/views/formulario.jsp")
                    .forward(req, resp);
            return;
        }

       
        service.guardar(new Producto(0, nombre.trim(), categoria, precio, stock));

        resp.sendRedirect(req.getContextPath() + "/productos");
    }
}
