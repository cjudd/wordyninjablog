<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h1 class="page-header">
  New Post
</h1>

<form:form method="POST" commandName="post">
  <div class="form-group <c:if test="${requestScope['org.springframework.validation.BindingResult.post'].hasFieldErrors('title')}">has-error</c:if>">
    <form:label path="title" cssClass="control-label" >Title:</form:label>
    <form:input path="title" cssClass="form-control" />
    <form:errors path="title" cssClass="control-label" />
  </div>
  <div class="form-group" <c:if test="${requestScope['org.springframework.validation.BindingResult.post'].hasFieldErrors('content')}">has-error</c:if>>
    <form:label path="content">Content:</form:label>
    <form:textarea path="content" cssClass="form-control" rows="5" cols="30" />
    <form:errors path="content" cssClass="control-label" />
  </div>
  <input type="submit" value="Submit" class="btn btn-default" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form:form>

<hr>