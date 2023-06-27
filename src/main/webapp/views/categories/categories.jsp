<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.leyvaraunt.entities.Categories"%>
<%@page import="com.leyvaraunt.config.Constants"%>
<%
  ArrayList<Categories> category = (ArrayList<Categories>) request.getAttribute("categories");
  String urlCategories = request.getContextPath() + "/categories";
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
            <a href="${urlCategories}?new">
              Agregar nueva categoria
            </a>
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
                <th>Nº Productos</th>
                <th colspan="2"></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="category" items="${categories}">
                <tr>
                  <td>${category.name}</td>
                  <td>${category.countProducts}</td>
                  <td><a href="${urlCategories}?edit=${category.id}">Editar</a></td>
                  <td><a href="${urlCategories}?delete=${category.id}">Eliminar</a></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </body>
</html>
