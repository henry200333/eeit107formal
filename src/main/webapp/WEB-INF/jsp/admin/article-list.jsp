<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.allpage{
	width: 1200px;
	margin: auto;
}
.c1 {
	font-size: 30px;
	border-radius: 15px;
	color: white;
	background-color: #FF8888;
	font-weight: bold;
}
.t2 {
	font-size: 20px;
	border: 1px solid black;
	padding: 10px;
}
.r2 {
	text-align: center;
	line-height: 50px;
	margin: auto;
	margin-top: 50px;
	font-family: 'Overpass Mono', monospace;
}
th {
	background-color: #FFCCCC;
	font-weight: bold;
}
</style>
<title>header</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="allpage">
		<h2>List of Article</h2>
		<input type="button" value="add"
			onclick="javascript:location.href='add'">
		<hr>
		<c:if test="${not empty articleList}">
			<table border="1" class="r2">
				<thead>
				<tr>
					<caption class="c1">Performance</caption>
				</tr>
					<tr>
						<th class="t2">ID</th>
						<th class="t2">Name</th>
						<th class="t2">CONTEXT</th>
						<th class="t2">TYPE</th>
						<th class="t2">REF_ID</th>
						<th class="t2">EDIT</th>
						<th class="t2">DELETE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bean" items="${articleList}">
						<tr>
							<td class="t2">${bean.id}</td>
							<td class="t2">${bean.name}</td>
							<td class="t2">${bean.context}</td>
							<td class="t2">${bean.type}</td>
							<td class="t2">${bean.refId}</td>
							<td class="t2"><input type="button" value="EDIT"></td>
							<td class="t2"><input type="button" value="DELETE"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>