<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="page-header">
  Users
</h1>

<table class="table">
  <tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Username</th>
  </tr>
<c:forEach var="user" items="${users}">

  <tr>
    <td>${user.firstName}</td>
    <td>${user.lastName}</td>
    <td>${user.username}</td>
  </tr>

</c:forEach>

</table>