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
			<label>firstName</label> <input type="text" id="firstName" />
		</div>
		<div>
			<label>lastName</label> <input type="text" id="lastName" />
		</div>
		<div>
			<label>email</label> <input type="email" id="email" />
		</div>
		<div>
			<label>account</label> <input type="text" id="account" />
		</div>
		<div>
			<label>password</label> <input type="password" id="password" />
		</div>
		<button type="submit">submit</button>
	</form>

	<a href="/login">login</a>
</body>
</html>