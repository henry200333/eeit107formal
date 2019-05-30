<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vender</title>
<link
	href="https://fonts.googleapis.com/css?family=Overpass+Mono&display=swap"
	rel="stylesheet">
<style>
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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2></h2>
	<c:if test="${not empty models}">

		<table class="r2">
			<thead>
				<tr>
					<caption class="c1">Vender</caption>
				</tr>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>address</th>
					<th>maxPeople</th>
					<th>phone</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${models}">
					<tr>
						<td class="t2">${bean.id}</td>
						<td class="t2">${bean.name}</td>
						<td class="t2">${bean.address}</td>
						<td class="t2">${bean.maxPeople}</td>
						<td class="t2">${bean.phone}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</c:if>

</body>
</html>