<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.leyvaraunt.config.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String errorMessage = (String) request.getAttribute(Constants.KEYNAME_ERROR_MESSAJE);%>
<div class="row">
  <h2>Agregar encargado</h2>
</div>  
  <c:if test="${errorMessage != null}">
    <div class="row">
      <p><%= errorMessage%></p>
    </div>
  </c:if>
  <form action="managers?new" class="form" method="POST">
    <div class="row">
      <input type="text" name="name" id="name" placeholder="Nombre" />
    </div>
    <div class="row">
      <input
        type="text"
        name="lastname"
        id="lastname"
        placeholder="Apellidos"
      />
    </div>
    <div class="row">
      <input
        type="text"
        name="username"
        id="username"
        placeholder="Nombre de usuario"
      />
    </div>
    <div class="row">
      <input
        type="password"
        name="password"
        id="password"
        placeholder="Contraseña"
      />
    </div>
    <div class="row">
      <a class="btn cancel" href="<%= request.getContextPath()%>/managers">Volver</a>
    </div>
    <div class="row">
      <input class="btn send" type="submit" value="Agregar" />
    </div>
  </form>