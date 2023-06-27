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
      <jsp:param name="titleJsp" value="Historial" />
    </jsp:include>
  </head>
  <body>
    <div class="root">
      <jsp:include page="/templates/header.jsp"></jsp:include>
      <main class="main_container">
        <div class="container">
          <div class="row">
            <h2>Historial de cambios</h2>
          </div>
          <c:if test="<%= errorMessage != null %>">
            <div class="row">
              <p class="error_msg"><%= errorMessage %></p>
            </div>
          </c:if>
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Tipo</th>
                <th>Descripcion</th>
                <th>Fecha y Hora</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="one" items="${history}">
                <tr>
                  <td><c:out value="${one.id}"/></td>
                  <td><c:out value="${one.type}"/></td>
                  <td><c:out value="${one.description}"/></td>
                  <td><c:out value="${one.date}"/></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </body>
</html>
