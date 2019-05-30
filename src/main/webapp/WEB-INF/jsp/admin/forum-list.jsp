<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<table>
<thead>
						<tr>
							<th>ID</th>
							<th>board</th>
							<th>name</th>
							<th>context</th>
							<th>commentDate</th>
						</tr>
					</thead>
					<tbody>
<c:forEach var="bean" items="${models}">
	<tr>
<td>${bean.id}</td>
<td>${bean.board}</td>
<td>${bean.name}</td>
<td>${bean.context}</td>
<td>${bean.commentDate}</td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>