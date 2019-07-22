<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<style>
.select {
	margin-top: 20px;
	border: 3px solid red;
	font-size: 30px;
	background-color: red;
	color: white;
	font-weight: bold;
	line-height: 60px;
	padding: 0 15px;
	border-radius: 50px;
}

.act1 {
	font-size: 80px;
	background-color: #00aeae;
	color: white;
	padding: 5px 32px 14px;
	border-radius: 50%;
}

.activity {
	text-align: center;
	background-color: #007979;
	padding: 20px 0;
	border-radius: 40px;
	margin: 0 10px;
}

.activity:hover{
cursor: pointer;
transition-property: opacity;
	transition-duration: 0.5s;
	opacity: 0.7;
}

.title {
	font-size: 20px;
	color: white;
	font-weight: bold;
	border-bottom:2px solid white;
	-webkit-user-select: none;
}

.user {
	color: white;
	-webkit-user-select: none;
}

.time {
	color: white;
	font-size: 13px;
	-webkit-user-select: none;
}
</style>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<input type="hidden" value="<sec:authentication property='name' />"
		id="thisuser">
	<div class="container">
		<span class="select"><i class="fas fa-mouse-pointer"></i> 選擇活動</span><br>


		<div class="row" style="margin-top: 50px;" id="activitys">
			
		
		</div>


		<script>
			var username = $("#thisuser").val();
			$.ajax({
				url : "/user/performance/activity",
				type : "POST",
				data : {
					"username" : username
				},
				success : function(data) {
					console.log(data);
					$.each(data, function(index, value) {
						var txt="<div class='col-3' style='margin-top:20px;'>";
						txt+="<div class='activity'>"
						txt+="<span class='act1'><i class='fas fa-chess-knight'></i></span><br>";
						txt+="<br> <span class='title'>"+value['name']+"</span><br> <span	class='user'>"+value['artist']+"</span><br> <span class='time'>"+value['beginTime']+"<br>↓<br>"+value['endTime']+"</span>";
						txt+="</div></div>";
						$("#activitys").append(txt);
					})
				}
			})
		</script>
		<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>