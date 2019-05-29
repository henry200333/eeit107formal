<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h2>List of Article</h2>
<c:if test="${not empty articleList}">
		<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>CONTEXT</th>
					<th>TYPE</th>
					<th>REF_ID</th>
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
					</tr>
				</c:forEach>
			</tbody>
		</table>
</c:if>


</body>
</html>