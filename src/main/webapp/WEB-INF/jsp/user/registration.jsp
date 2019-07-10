<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registration</title>
</head>
<body>
	<h1>registration</h1>
	<form action="/register" method="POST"
		enctype="application/x-www-form-urlencoded">
		<div>
			<label for="account">account</label> <input type="text" id="account" />
		</div>
		<div>
			<label for="password">password</label> <input type="password" id="password" />
		</div>
		<button id="button" name="button" type="button">submit</button>
	</form>

	<a href="/login">login</a>
</body>
</html>