<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.leyvaraunt.entities.Manager"%>
<%
  Manager manager = (Manager) request.getAttribute("manager");
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
          <div class="form">
            <c:if test="${manager == null}">
              <jsp:include page="/views/managers/newManagerForm.jsp"></jsp:include>
            </c:if>
            <c:if test="${manager != null}">
              <jsp:include page="/views/managers/updateManagerForm.jsp"></jsp:include>
            </c:if>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
