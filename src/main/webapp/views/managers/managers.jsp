<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.leyvaraunt.entities.Manager"%>
<%
  ArrayList<Manager> managers = (ArrayList<Manager>) request.getAttribute("managers");
%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <jsp:include page="/templates/styles.jsp">
      <jsp:param name="titleJsp" value="Encargados" />
    </jsp:include>
  </head>
  <body>
    <div class="root">
      <jsp:include page="/templates/header.jsp"></jsp:include>
        <main class="main_container">
          <div class="container">
            <div class="row">
              <a href="<%= request.getContextPath() %>/managers?new">Agregar Nuevo Encargado</a>
            </div>
            <table>
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Apellidos</th>
                  <th>Nombre de usuario</th>
                  <th colspan="2"></th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="manager" items="${managers}">
                <tr>
                  <td>${manager.name}</td>
                  <td>${manager.lastname}</td>
                  <td>${manager.username}</td>
                  <td><a href="managers?edit=${manager.id}">Editar</a></td>
                  <td>
                    <a href="managers?delete=${manager.id}">Eliminar</a>
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