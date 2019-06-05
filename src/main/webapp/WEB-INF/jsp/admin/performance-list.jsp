<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
<jsp:include page="nav.jsp"></jsp:include>	
	<c:if test="${not empty performances}">
		<table>
			<thead>
				<tr>
					<caption>Performance</caption>
				</tr>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>YOUTUBE_URL</th>
					<th>UPDATE_TIME</th>
					<th>ACTIVITY_ID</th>
					<th>UPDATE</th><th class="t2">DELETE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${performances}">
					<tr>
						<td>${bean.id}</td>
						<td>${bean.name}</td>
						<td>${bean.url}</td>
						<td>${bean.updateTime}</td>
						<td>${bean.activityId}</td>
						<td><button   class="up"  type="button" onclick="javascript:location.href='update?id=${bean.id}&name=${bean.name }&url=${bean.url }&updateTime=${bean.updateTime }&activityId=${bean.activityId }'" >update</button></td>
						<td><button class="de" >delete</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>