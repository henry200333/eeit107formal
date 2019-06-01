<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>artist add</title>
</head>
<body>
	<h1>artist add</h1>
	<a style="color: black" href="/admin/artist/list">List</a>
		<form action="" method="POST">
		<table>
			<tr>
				<td>id :</td>
				<td><input type="text" name="id" value="${param.id }"></td>
				<td></td>
			</tr>
			<tr>
				<td>name :</td>
				<td><input type="text" name="name" value="${param.name }"></td>
				<td></td>
			</tr>
			<tr>
				<td>fan_number :</td>
				<td><input type="text" name="fannumber" value="${param.fannumber }"></td>
				<td></td>
			</tr>
			<tr>
				<td>location :</td>
				<td><input type="text" name="location" value="${param.location }"></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" name="prodaction" value="Insert">
			</tr>
		</table>
	</form>
</body>
</html>