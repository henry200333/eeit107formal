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
<h2>Activity-List</h2>
<c:if test="${not empty activityList}">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Artist</th>
					<th>Begin time</th>
					<th>End time</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${activityList}">
					<tr>
						<td>${bean.id}</td>
						<td>${bean.name}</td>
						<td>${bean.artist}</td>
						<td>${bean.beginTime}</td>
						<td>${bean.endTime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</c:if>


</body>
</html>