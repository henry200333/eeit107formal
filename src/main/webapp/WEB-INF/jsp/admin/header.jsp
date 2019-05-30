<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
<style>
.t1 {
	width: 200px;
	font-size: 20px;
	background-color: #5599FF;
}

.t1:hover {
	background-color: #003C9D;
}

.r1 {
	text-align: center;
	line-height: 50px;
	margin: auto;
}

a {
	color: white;
	text-decoration: none;
	font-family: 'Varela Round', sans-serif;
}
</style>
</head>
<body>
	<div>
		<table class="r1">
			<tr>
				<td class="t1"><a href="/admin/artist/list">Artist</a></td>
				<td class="t1"><a href="/admin/article/list">Article</a></td>
				<td class="t1"><a href="/admin/performance/list">Performance</a></td>
				<td class="t1"><a href="/admin/activity/list">Activity</a></td>
				<td class="t1"><a href="/admin/vender/list">Vender</a></td>
				<td class="t1"><a href="/admin/forum/list">Forum</a></td>
			</tr>
		</table>
	</div>
</body>
</html>