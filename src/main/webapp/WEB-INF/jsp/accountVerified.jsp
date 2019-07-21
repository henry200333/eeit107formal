<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Congratulations</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<h1>將在5秒後轉導到index</h1>
	<span id="time" style="color: red; font-size: 30px;">5</span>.....
	<h2>seconds</h2>
	<a href="/index">index</a>
	<script>
		window.setInterval(function() {
			var delay = $("#time").html();
			if (delay > 0) {
				delay--;
				$("#time").html(delay);
			} else {
				window.top.location.href = "/index";
			}
		}, 1000);
	</script>
</body>
</html>