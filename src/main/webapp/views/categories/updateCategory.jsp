<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.leyvaraunt.entities.Categories"%>
<%@page import="com.leyvaraunt.config.Constants"%>
<%
  String urlCategories = request.getContextPath() + "/categories";
  Categories category = (Categories) request.getAttribute("category");
  String errorMessage = (String) request.getAttribute(Constants.KEYNAME_ERROR_MESSAJE);
%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <jsp:include page="/templates/styles.jsp">
      <jsp:param name="titleJsp" value="Editar" />
    </jsp:include>
  </head>
  <body>
    <div class="root">
      <jsp:include page="/templates/header.jsp"></jsp:include>
      <main class="main_container">
        <div class="container">
          <div class="form">
            <div class="row">
              <h2>Editar Categoria</h2>
            </div>
            <c:if test="<%= errorMessage != null %>">
              <div class="row">
                <p class="msg_error"><%= errorMessage %></p>
              </div>
            </c:if>
            <form action='<%= urlCategories + "?edit=" + category.getId() %>' class="form" method="POST">
              <div class="row">
                <c:if test="${category != null}">
                  <input type="text" name="name" id="name" placeholder="Nombre de categoria" value="${category.name}"/>
                </c:if>
                <c:if test="${category == null}">
                  <input type="text" name="name" id="name" placeholder="Nombre" />
                </c:if>
              </div>
              <div class="row">
                <a
                  class="btn cancel"
                  href="<%= urlCategories %>"
                  >Volver</a
                >
              </div>
              <div class="row">
                <input class="btn send" type="submit" value="Actualizar" />
              </div>
            </form>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
