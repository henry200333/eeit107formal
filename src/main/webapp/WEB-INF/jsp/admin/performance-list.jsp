<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h2>performancelist<h2>
<c:if test="${not empty performances}">

		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>YOUTUBE_URL</th>
					<th>UPDATE_TIME</th>
					<th>ACTIVITY_ID</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean"  items="${performances}">
					<tr>
						<td>${bean.id}</td>
						<td>${bean.name}</td>
						<td>${bean.url}</td>
						<td>${bean.updateTime}</td>
						<td>${bean.activityId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</c:if>

</body>
</html>