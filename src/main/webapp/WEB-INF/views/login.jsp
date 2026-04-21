<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">

    <title>Iniciar Sesion</title>
</head>
<body>
    <main class="login-card">
        <h1>Acceso al Sistema</h1>
        <p>Ingresa tus credenciales para continuar.</p>

        <% String errorLogin = (String) request.getAttribute("errorLogin"); %>
        <% if (errorLogin != null) { %>
            <div class="error"><%= errorLogin %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post" novalidate>
            <div class="field">
                <label for="username">Usuario</label>
                <input
                    type="text"
                    id="username"
                    name="username"
                    value="${param.username}"
                    autocomplete="username"
                    required>
            </div>

            <div class="field">
                <label for="password">Contrasena</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    autocomplete="current-password"
                    required>
            </div>

            <button type="submit" class="btn">Iniciar sesion</button>
        </form>
    </main>
</body>
</html>