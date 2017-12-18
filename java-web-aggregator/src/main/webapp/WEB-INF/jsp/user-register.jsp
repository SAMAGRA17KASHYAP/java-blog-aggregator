<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form:form  commandName="user">
  <div class="form-group">
    <label for="name">Email address</label>
    <form:input path="email" cssClass="form-control"/>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="Name">Name</label>
    <form:input  path="name" cssClass="form-control" />
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <form:input  path="password" cssClass="form-control" />
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form:form>
