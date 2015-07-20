<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="page-header">
  Log In
</h1>

<c:if test="${not empty error}">
  <div class="error">${error}</div>
</c:if>
<c:if test="${not empty msg}">
  <div class="msg">${msg}</div>
</c:if>

<form action="/login" method="post">
  <div><label> User Name : <input type="text" name="username"/> </label></div>
  <div><label> Password: <input type="password" name="password"/> </label></div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <div><input type="submit" value="Log In"/></div>
</form>

<hr>