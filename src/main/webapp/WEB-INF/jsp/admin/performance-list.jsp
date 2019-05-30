<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
<jsp:include page="nav.jsp"></jsp:include>
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