<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Performance-add</title>

</head>
<body>
	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String url = request.getParameter("url");
	String updateTime = request.getParameter("updateTime");
	String activityId = request.getParameter("activityId");
	%>
	<form>
	id:<input type="text" value="<%=id %>" ><p/>
	name:<input type="text" value="<%=url %>" ><p/>
	url:<input type="text" value="<%=name %>" ><p/>
	updateTime:<input type="text" value="<%=updateTime %>" ><p/>
	activityId:<input type="text" value="<%=activityId %>" /><p/>
	<input	type="submit" value="確定修改" >
	</form>

</body>
</html>