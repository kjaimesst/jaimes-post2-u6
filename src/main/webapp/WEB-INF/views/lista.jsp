<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<fmt:setLocale value="${sessionScope.locale != null ? sessionScope.locale : 'es'}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="app.titulo" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>

<body>

<h1><fmt:message key="app.titulo" /></h1>

<p>
    <fmt:message key="app.bienvenida" />:
    ${sessionScope.usuarioActual.username}
</p>

<!-- IDIOMA -->
<p>
    <a href="${pageContext.request.contextPath}/idioma?lang=es">Español</a> |
    <a href="${pageContext.request.contextPath}/idioma?lang=en">English</a>
</p>

<!-- MENSAJE -->
<c:if test="${not empty mensaje}">
    <p class="alert-success">${mensaje}</p>
</c:if>

<!-- BOTÓN NUEVO -->
<p>
    <a href="${pageContext.request.contextPath}/productos?accion=formulario">
        + <fmt:message key="menu.nuevo" />
    </a>
</p>

<!-- TABLA -->
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th><fmt:message key="tabla.nombre" /></th>
            <th><fmt:message key="tabla.categoria" /></th>
            <th><fmt:message key="tabla.precio" /></th>
            <th><fmt:message key="tabla.stock" /></th>
            <th><fmt:message key="tabla.acciones" /></th>
        </tr>
    </thead>

    <tbody>

        <!-- 🔥 PROTECCIÓN SI VIENE VACÍO -->
        <c:if test="${empty productos}">
            <tr>
                <td colspan="6">No hay productos registrados</td>
            </tr>
        </c:if>

        <c:forEach var="p" items="${productos}">
            <tr>
                <td>${p.id}</td>
                <td><c:out value="${p.nombre}" /></td>
                <td><c:out value="${p.categoria}" /></td>
                <td>${p.precio}</td>
                <td>${p.stock}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/productos?accion=editar&id=${p.id}">
                        Editar
                    </a>
                    |
                    <a href="${pageContext.request.contextPath}/productos?accion=eliminar&id=${p.id}">
                        Eliminar
                    </a>
                </td>
            </tr>
        </c:forEach>

    </tbody>
</table>

</body>
</html>