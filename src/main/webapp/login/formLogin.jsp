<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : formLogin
    Created on : 21 jun. de 2023, 21:06:41
    Author     : Cristhian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.leyvaraunt.config.Constants"%>
<%
  String error_message = (String) request.getAttribute(Constants.KEYNAME_ERROR_MESSAJE);
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <div class="root">
      <div class="container">
        <div class="box">
          <div class="row">
            <h2>Login Leyvaraunt</h2>
          </div>
          <c:if test="${error_message != null}">
            <div class="row">
              <p class="msg">${error_message}</p>
            </div>
          </c:if>
          <form class="form_box" action="login"method="post">
            <div class="row">
              <input type="text" name="username" id="username" placeholder="Nombre de usuario">
            </div>
            <div class="row">
              <input type="password" name="password" id="password" placeholder="Contraseña">
            </div>
            <div class="row">
              <input type="submit" value="Login">
            </div>
          </form>
        </div>
      </div>
    </div>

  </body>
</html>
