<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html><html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>${empty producto ? "Nuevo Producto" : "Editar Producto"}</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">

    </head>
    <body>
        <h1>${empty producto ? "Registrar Producto" : "Editar Producto"}</h1>
        <form method="post" action="<c:url value="/productos"/>">
            <c:if test="${not empty errores}">
                <div class="alert-error">
                    <ul><c:forEach var="e"
                    items="${errores}"><li>${e.value}</li></c:forEach></ul>
                </div>
            </c:if>
            <c:if test="${not empty producto}">
                <input type="hidden" name="id" value="${producto.id}">
                <input type="hidden" name="accion" value="actualizar">
            </c:if>
            <c:if test="${empty producto}">
                <input type="hidden" name="accion" value="guardar">
            </c:if>
            <label>Nombre:
                <input type="text" name="nombre" value="<c:out value="${not empty nombre ? nombre : producto.nombre}"/>"
                class="${not empty errores.nombre ? 'input-error' : ''}">
                <c:if test="${not empty errores.nombre}">
                    <span class="campo-error">${errores.nombre}</span>
                </c:if>
            </label>
            <label>Categoría:
                <input type="text" name="categoria"
                value="<c:out value="${producto.categoria}"/>">
            </label>
            <label>Precio:
                <input type="number" name="precio" step="0.01" min="0" required
                value="${producto.precio}">
            </label>
            <label>Stock:
                <input type="number" name="stock" min="0" required
                value="${producto.stock}">
            </label>
            <button type="submit">${empty producto ? "Guardar" :
            "Actualizar"}</button>
            <a href="<c:url value="/productos"/>">Cancelar</a>
        </form>
    </body>
</html>