<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
</head>
<body>
	<c:if test="{not empty error}">
		<div class="padding20">${error}</div>
	</c:if>
	<c:if test="{not empty logout}">
		<div class="padding20">${logout}</div>
	</c:if>
	<form action="/login" method="POST">
		<label for="username"> Username or email address</label><br> <input
			type="text" name="username" autofocus="autofocus" value="admin"><br> <label
			for="password">Password</label> <a href="">Forgot password?</a> <br>
		<input type="password" name="password" value="admin"><input type="checkbox">Remember
		me <br> <input type="submit" value="Sign in">
	</form>
	<a href="javascript:history.back()">back</a>
</body>
</html>