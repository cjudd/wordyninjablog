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

    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="Username">
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-default">Log In</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>

<hr>