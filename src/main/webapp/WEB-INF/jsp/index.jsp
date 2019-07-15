<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<label>welcome to JAYEE</label>
	<br>
	<sec:authorize access="!isAuthenticated()">
		<a href="/login">Sign in</a>
		<a href="/register">Sign up</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
					Hi,
					<sec:authentication property="name" />
		<a href="/logout">Sign out</a>
	</sec:authorize>
	<sec:authorize access="hasRole('ADMIN')">
    	<a href="/admin/artist/list">back end</a>
	</sec:authorize>
</body>
</html>