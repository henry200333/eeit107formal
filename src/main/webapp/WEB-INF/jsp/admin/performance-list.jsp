<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Performance</title>
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
.up{
	color:#99BBFF;
	background-color:white;
	border:1px solid white;
	font-size:25px;
}

.de{
	color:#FF8888;
	background-color:white;
	border:1px solid white;
	font-size:25px;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2></h2>
	<c:if test="${not empty performances}">

		<table class="r2">
			<thead>
				<tr>
					<caption class="c1">Performance</caption>
				</tr>
				<tr>
					<th class="t2">ID</th>
					<th class="t2">Name</th>
					<th class="t2">YOUTUBE_URL</th>
					<th class="t2">UPDATE_TIME</th>
					<th class="t2">ACTIVITY_ID</th>
					<th class="t2">UPDATE</th><th class="t2">DELETE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${performances}">
					<tr>
						<td class="t2">${bean.id}</td>
						<td class="t2">${bean.name}</td>
						<td class="t2">${bean.url}</td>
						<td class="t2">${bean.updateTime}</td>
						<td class="t2">${bean.activityId}</td>
						<td class="t2"><button   class="up"  type="button" onclick="javascript:location.href='update?id=${bean.id}&name=${bean.name }&url=${bean.url }&updateTime=${bean.updateTime }&activityId=${bean.activityId }'" >update</button></td>
						<td class="t2"><button class="de" >delete</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</c:if>
</body>
</html>