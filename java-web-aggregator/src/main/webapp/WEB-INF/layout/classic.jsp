<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

</head>
<body>
	<tilesx:useAttribute name="current" />

	<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
		<a class="navbar-brand" href="#">JBA</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="${current=="index"?"nav-itemactive":"nav-item"}"><a
					class="nav-link" href="<spring:url value="/"/>">Home <span
						class="sr-only">(current)</span></a></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li class="${current=="users"?"nav-itemactive":"nav-item"}"><a
						class="nav-link" href="<spring:url  value="/users.html"/>">Users</a>
					</li>
				</security:authorize>
				<li class="${current=="register"?"nav-itemactive":"nav-item"}">
					<a class="nav-link" href="<spring:url  value="/register.html"/>">Register</a>
				</li>
				<security:authorize access="!isAuthenticated()">
					<li class="${current=="login"?"nav-itemactive":"nav-item"}"><a
						class="nav-link" href="<spring:url  value="/login.html"/>">Login</a>
					</li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link"
						href="<spring:url  value="/logout"/>">Logout</a></li>
				</security:authorize>
			</ul>

		</div>
	</nav>
	<div class="container">




		<tiles:insertAttribute name="body" />
		<br /> <br />
		<center>
			<tiles:insertAttribute name="footer" />
		</center>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>

</body>
</html>