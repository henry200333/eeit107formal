
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vender list</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>vender list</h1>
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>fannumber</th>
				<th>location</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bean" items="${models}">
				<tr>
					<td>${bean.id }</td>
					<td>${bean.name }</td>
					<td>${bean.address }</td>
					<td>${bean.maxPeople }</td>
					<td>${bean.phone }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>