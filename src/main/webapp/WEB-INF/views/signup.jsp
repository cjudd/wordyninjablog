<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h1 class="page-header">
  Sign Up
</h1>

<form:form method="POST" modelAttribute="user">
  <div class="form-group <c:if test="${requestScope['org.springframework.validation.BindingResult.user'].hasFieldErrors('username')}">has-error</c:if>">
    <form:label path="username" cssClass="control-label" >Username:</form:label>
    <form:input path="username" cssClass="form-control" />
    <form:errors path="username" cssClass="control-label" />
  </div>
  <div class="form-group <c:if test="${requestScope['org.springframework.validation.BindingResult.user'].hasFieldErrors('password')}">has-error</c:if>">
    <form:label path="password">Password:</form:label>
    <form:input path="password" type="password" cssClass="form-control" />
    <form:errors path="password" cssClass="control-label" />
  </div>
  <div class="form-group" <c:if test="${requestScope['org.springframework.validation.BindingResult.user'].hasFieldErrors('firstName')}">has-error</c:if>>
    <form:label path="firstName">First Name:</form:label>
    <form:input path="firstName" cssClass="form-control" />
    <form:errors path="firstName" cssClass="control-label" />
  </div>
  <div class="form-group <c:if test="${requestScope['org.springframework.validation.BindingResult.user'].hasFieldErrors('lastName')}">has-error</c:if>">
    <form:label path="lastName">Last Name:</form:label>
    <form:input path="lastName" cssClass="form-control" />
    <form:errors path="lastName" cssClass="control-label"/>
  </div>
  <input type="submit" value="submit" class="btn btn-default" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form:form>

<hr>