<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
<form action="/register" method="POST">
<label for="username">Username</label>
<input type="text" name="username" id="username"><br>
<label for="email">Email address</label>
<input type="email" name="email" id="email"><br>
<label for="password">Password</label>
<input type="password" name="password" id="password"><br>
<input type="submit" value="Create an account">
</form>
</body>
</html>