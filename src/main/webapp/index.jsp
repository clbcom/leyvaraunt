<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <div class="box_container">
            <div class="welcome">
              <h2 class="welcome_title">Bienvenido a la web de Leyvaraunt</h2>
            <c:forEach var="info" items="${information}">
                <p class="welcome_msg">${info.description}</p>
                <h2>Ubicacion</h2>
                <p class="welcome_msg">${info.location}</p>
                <h2>Horarios</h2>
                <p class="welcome_msg">${info.schedule}</p>
              </c:forEach>
            </div>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
