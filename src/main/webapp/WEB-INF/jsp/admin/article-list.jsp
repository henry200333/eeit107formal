<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>header</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div>
		<h2>List of Article</h2>
		<input type="button" value="ADD"
			onclick="javascript:location.href='add'">
		<hr>
		<c:if test="${not empty articleList}">
			<table border="1">
				<thead>
				<tr>
					<caption>Article</caption>
				</tr>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>CONTEXT</th>
						<th>TYPE</th>
						<th>REF_ID</th>
						<th>EDIT</th>
						<th>DELETE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bean" items="${articleList}">
						<tr>
							<td>${bean.id}</td>
							<td>${bean.name}</td>
							<td>${bean.context}</td>
							<td>${bean.type}</td>
							<td>${bean.refId}</td>
							<td><input type="button" value="EDIT"></td>
							<td><input type="button" value="DELETE"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>