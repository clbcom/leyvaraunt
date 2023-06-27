<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.leyvaraunt.entities.Manager"%>
<%@page import="com.leyvaraunt.config.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  Manager manager = (Manager) request.getAttribute("manager");
  String errorMessage = (String) request.getAttribute(Constants.KEYNAME_ERROR_MESSAJE);
%>
<div class="row">
  <h2>Encargado <%= manager.getUsername()%></h2>
</div>
  <c:if test="${errorMessage != null}">
    <div class="row">
      <p><%= errorMessage%></p>
    </div>
  </c:if>
  <form action="managers?edit=<%= manager.getId()%>" class="form" method="POST">
    <div class="row">
      <input
        type="text"
        name="name"
        id="name"
        placeholder="Nombre"
        value="${manager.name}"
      />
    </div>
    <div class="row">
      <input
        type="text"
        name="lastname"
        id="lastname"
        placeholder="Apellidos"
        value="${manager.lastname}"
      />
    </div>
    <div class="row">
      <input
        type="text"
        name="username"
        id="username"
        placeholder="Nombre de usuario"
        value="${manager.username}"
      />
    </div>
    <div class="row">
      <input type="password" name="password" id="password"
      placeholder="Contraseña"" />
    </div>
    <div class="row">
      <a class="btn cancel" href="<%= request.getContextPath()%>/managers">Volver</a>
    </div>
    <div class="row">
      <input class="btn send" type="submit" value="Actualizar" />
    </div>
  </form>