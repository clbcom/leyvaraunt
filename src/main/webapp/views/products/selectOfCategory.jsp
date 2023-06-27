<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<select name="id_category" id="id_category">
  <option disabled selected >Menu</option>
  <c:forEach var="category" items="${categories}">
    <c:if test='${category.id == product.idCategory}' >
      <option selected value="${category.id}"><c:out value="${category.name}" /></option>
    </c:if>
    <c:if test='${category.id != product.idCategory}' >
      <option value="${category.id}"><c:out value="${category.name}" /></option>
    </c:if>
  </c:forEach>
</select>