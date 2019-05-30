<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list from Artist</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>list from Artist</h1>
		<a style="color:black" href="/admin/artist/add">Add</a>
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>fannumber</th>
				<th>location</th>
				<th>edit</th>
				<th>delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bean" items="${models}">
				<tr>
					<td>${bean.id }</td>
					<td>${bean.name }</td>
					<td>${bean.fanNumber }</td>
					<td>${bean.location }</td>
					<td><a style="color:black" href="/admin/artist/edit">Edit</a></td>
					<td><input type="button" value="delete"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>