<%-- Document : header Created on : 21 jun. de 2023, 21:30:16 Author : Cristhian
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header_container">
  <nav class="nav_container">
    <ul class="nav">
      <li class="link_container">
        <a href="<%= request.getContextPath() %>" class="nav_link">Leyvaraunt</a>
      </li>
      <li class="link_container">
        <a href="<%= request.getContextPath() %>/products" class="nav_link">Productos</a>
      </li>
      <li class="link_container">
        <a href="<%= request.getContextPath() %>/categories" class="nav_link">Categorias</a>
      </li>
      <li class="link_container">
        <a href="<%= request.getContextPath() %>/managers" class="nav_link">Encargados</a>
      </li>
      <li class="link_container">
        <a href="<%= request.getContextPath() %>/bookings" class="nav_link">Reservas</a>
      </li>
      <li class="link_container">
        <a href="<%= request.getContextPath() %>/history" class="nav_link">Historial de cambios</a>
      </li>
      </li>
      <li class="link_container">
        <a href="login?logout=1" class="nav_link">Cerrar sesion</a>
      </li>
    </ul>
  </nav>
</header>
