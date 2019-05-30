<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<h2></h2>
	
	<c:if test="${not empty activityList}">
		<table class="r2">
			<thead>
				<tr>
					<caption class="c1">Activity</caption>
				</tr>
				<tr>
					<th class='t2'>ID</th>
					<th class='t2'>Name</th>
					<th class='t2'>Artist</th>
					<th class='t2'>Begin time</th>
					<th class='t2'>End time</th>
					<th class='t2'>Edit</th>
					<th class='t2'>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${activityList}">
					<tr>
						<td class='t2'>${bean.id}</td>
						<td class='t2'>${bean.name}</td>
						<td class='t2'>${bean.artist}</td>
						<td class='t2'>${bean.beginTime}</td>
						<td class='t2'>${bean.endTime}</td>
						<td class='t2'><input type="button" value="修改"></td>
						<td class='t2'><input type="button" value="刪除"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
<div style="text-align:center"><input type="button" value="Activity-add"
		onclick="javascript:location.href='add'" /></div>

</body>
</html>