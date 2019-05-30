<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.allpage {
	width: 1200px;
	margin: auto;
}
</style>
<title>header</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="allpage">
		<h2>Add to Article</h2>
		<input type="button" value="back to list"
			onclick="javascript:location.href='list'">
		<hr>
		<form>
			<table>
				<tr>
					<td>Name</td>
					<td><input type="text" value="" name="name"></td>
					<td></td>
				</tr>
				<tr>
					<td>CONTEXT</td>
					<td><input type="text" value="" name="context"></td>
					<td></td>
				</tr>
				<tr>
					<td>TYPE</td>
					<td><input type="text" value="" name="type"></td>
					<td></td>
				</tr>
				<tr>
					<td>REF_ID</td>
					<td><input type="text" value="" name="refId"></td>
					<td></td>
				</tr>
			</table>
			<input type="button" value="submit"> <input type="button"
				value="reset">
		</form>
	</div>
</body>
</html>