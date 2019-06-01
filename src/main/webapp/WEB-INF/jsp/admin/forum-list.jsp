<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<h2>List of Forum</h2>
	<c:url var="addPage" value="/admin/forum/add" />
	<input type="button" value="add" onclick="changePage('${addPage}')">

	<c:url var="editPage" value="/admin/forum/edit" />
	<input type="button" value="edit" onclick="changePage('${editPage}')">


	<c:if test="${not empty models}">
		<table  border="1" >
			<thead>
				<tr>
					<caption >Forum</caption>
				</tr>
				<tr>
					<th >ID</th>
					<th >board</th>
					<th >name</th>
					<th >context</th>
					<th>commentDate</th>
					<th >EDIT</th>
					<th >DELETE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${models}">
					<tr>
						<td >${bean.id}</td>
						<td >${bean.board}</td>
						<td >${bean.name}</td>
						<td >${bean.context}</td>
						<td >${bean.commentDate}</td>
						<td ><input type="button" value="EDIT"></td>
						<td ><input type="button" value="DELETE"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>