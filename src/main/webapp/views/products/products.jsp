<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.leyvaraunt.entities.Product"%>
<%@page import="com.leyvaraunt.config.Constants"%>
<%
  String urlProducts = request.getContextPath() + "/products";
  String errorMessage = (String) request.getAttribute(Constants.KEYNAME_ERROR_MESSAJE);
%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <jsp:include page="/templates/styles.jsp">
      <jsp:param name="titleJsp" value="Leyvaraunt" />
    </jsp:include>
  </head>
  <body>
    <div class="root">
      <jsp:include page="/templates/header.jsp"></jsp:include>
      <main class="main_container">
        <div class="container">
          <div class="row">
            <a href="${urlProducts}?new"> Agregar nuevo producto </a>
          </div>
          <c:if test="<%= errorMessage != null %>">
            <div class="row">
              <p class="error_msg"><%= errorMessage %></p>
            </div>
          </c:if>
          <table>
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Categoria</th>
                <th>Descripcion</th>
                <th>Precio Bs.</th>
                <th colspan="2"></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="product" items="${products}">
                <tr>
                  <td><c:out value="${product.name}"/></td>
                  <td><c:out value="${product.category}"/></td>
                  <td><c:out value="${product.description}"/></td>
                  <td><c:out value="${product.price}"/></td>
                  <td>
                    <a href="${urlProducts}?edit=${product.id}">Editar</a>
                  </td>
                  <td>
                    <a href="${urlProducts}?delete=${product.id}">Eliminar</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </body>
</html>
