<%-- Document : header Created on : 21 jun. de 2023, 21:30:16 Author : Cristhian
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header_container">
  <nav class="nav_container">
    <ul class="nav">
      <li class="link_container">
        <a href="<%= request.getContextPath() %>" class="nav_link">Leyvaraunt</a>
      </li>
      <li class="link_container">
        <a href="categories" class="nav_link">Categorias</a>
      </li>
      <li class="link_container">
        <a href="products" class="nav_link">productos</a>
      </li>
      <li class="link_container">
        <a href="managers" class="nav_link">Encargados</a>
      </li>
      <li class="link_container">
        <a href="bookings" class="nav_link">Reservas</a>
      </li>
      </li>
      <li class="link_container">
        <a href="login?logout=1" class="nav_link">Cerrar sesion</a>
      </li>
    </ul>
  </nav>
</header>
