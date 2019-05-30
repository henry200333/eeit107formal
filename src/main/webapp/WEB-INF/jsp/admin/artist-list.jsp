<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	

	 <div class="container">
	<h1>list from Artist</h1>
	<a style="color: black" href="/admin/artist/add">Add</a>
	<table class="table table-hover">
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
					<td>${bean.fanNumber }</td>
					<td>${bean.location }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>