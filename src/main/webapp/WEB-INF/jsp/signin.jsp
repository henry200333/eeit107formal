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
		<table>
			<tr>
				<td><label for="username"> Username or email address</label></td>
				<td><input type="text" name="username" autofocus="autofocus"
					value=""></td>
			</tr>
			<tr>
				<td><label for="password">Password</label><a href="">Forgot
						password?</a></td>
				<td><input type="password" name="password" value=""><input
					type="checkbox" name="remember-me">Remember me</td>
			</tr>
			<tr>
				<td><input type="reset" value="Clear"></td>
				<td><input type="submit" value="Sign in"></td>
			</tr>
		</table>
	</form>
	<a href="javascript:history.back()">back</a>
</body>
</html>