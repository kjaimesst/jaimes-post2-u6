<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<title>Error del sistema</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
	</head>
	<body>
		<div class="contenedor">
			<h1>Ocurrió un error</h1>
			<p class="codigo">
				Código: ${requestScope['jakarta.servlet.error.status_code']}
			</p>
			<p>
				${requestScope['jakarta.servlet.error.message']}
			</p>

			<c:if test="${not empty pageContext.exception}">
				<h3>Detalle técnico</h3>
				<div class="detalle">
					<c:out value="${pageContext.exception}"/>
				</div>
			</c:if>

			<div class="acciones">
				<a href="<c:url value='/productos'/>">Volver al listado de productos</a>
			</div>
		</div>
	</body>
</html>