<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <jsp:param name="titleJsp" value="Nuevo" />
    </jsp:include>
  </head>
  <body>
    <div class="root">
      <jsp:include page="/templates/header.jsp"></jsp:include>
      <main class="main_container">
        <div class="container">
          <div class="form">
            <div class="row">
              <h2>Agregar Producto</h2>
            </div>
            <c:if test="<%= errorMessage != null %>">
              <div class="row">
                <p class="error_msg"><%= errorMessage %></p>
              </div>
            </c:if>
            <form action="<%= urlProducts %>?new" class="form" method="POST">
              <c:if test="${product != null}">
                <div class="row">
                  <input
                    type="text"
                    name="name"
                    id="name"
                    placeholder="Nombre"
                    value="${product.name}"
                  />
                </div>
                <div class="row">
                  <textarea
                    name="description"
                    id="description"
                    placeholder="Descripcion"
                  >${product.description}</textarea>
                </div>
                <div class="row">
                  <input
                    type="number"
                    name="price"
                    id="price"
                    step="any"
                    placeholder="Precio"
                    value="${product.price}"
                  />
                </div>
                <div class="row">
                  <jsp:include page="/views/products/selectOfCategory.jsp"></jsp:include>
                </div>
              </c:if>
              <c:if test="${product == null}">
                <div class="row">
                  <input
                    type="text"
                    name="name"
                    id="name"
                    placeholder="Nombre"
                  />
                </div>
                <div class="row">
                  <textarea
                    name="description"
                    id="description"
                    placeholder="Descripcion"
                  ></textarea>
                </div>
                <div class="row">
                  <input
                    type="number"
                    name="price"
                    id="price"
                    step="any"
                    placeholder="Precio"
                  />
                </div>
                <div class="row">
                  <jsp:include page="/views/products/selectOfCategory.jsp"></jsp:include>
                </div>
              </c:if>
              <div class="row">
                <a class="btn cancel" href="<%= urlProducts %>">Volver</a>
              </div>
              <div class="row">
                <input class="btn send" type="submit" value="Agregar" />
              </div>
            </form>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
