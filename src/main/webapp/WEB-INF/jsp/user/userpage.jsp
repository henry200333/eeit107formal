<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Pacifico|Rock+Salt&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/user-bootstrap/css/all.css">
<link rel="stylesheet" href="/resources/user-bootstrap/css/index.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script src="/resources/user-bootstrap/js/slick.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/resources/user-bootstrap/js/all.js"></script>
<meta charset="UTF-8">
<title>${userParam.account }</title>
<style>
.title{
	font-weight:bold;
}

.youtube{
color:red;
}

.heart{
color:#ffaad5;
}

.news{
	color:#977c00;
}

.game{
	color:#2894ff;
}
.male{
	font-size:20px;
	color:#46a3ff;
}
.female{
	font-size:20px;
	color:#ff95ca;
}
.other{
	font-size:20px;
	color:	#01b468;
}
</style>
</head>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
		<div class="container" style="margin-top: 90px;">
		<h4 style="margin-left:20px;font-weight:bold"><i class="fas fa-user"></i>   個人頁面</h4>
		<sec:authorize access="hasAnyRole('USER', 'ARTIST')">
		<h5 id="addFriendBT"></h5>
		<input id="noticeId" type="text" hidden="hidden" value="">
		<script>
		function addFriend(){
			$("#addFriendBT").html("<button onclick='disFriend()'>已送出好友請求</button>");
			var reciever = "${userParam.displayName }";
			$.ajax({
				url:"/add/friend",
				type:"POST",
				data:{"reciever":reciever},
				success:function(data){
					alert("已送出好友請求")
					$("#noticeId").val(data)
				}
			})
		}
		function disFriend(){
			$("#addFriendBT").html("<button onclick='addFriend()'>加為好友</button>");
			var noticeId = $("#noticeId").val();
			$.ajax({
				url:"/dis/friend",
				type:"POST",
				data:{"noticeId":noticeId},
				success:function(data){
					alert("已取消好友請求")
					$("#noticeId").val("")
				}
			})
		}
		</script>
		</sec:authorize>
		<div class="row" style="margin-top:20px;">
			<div class="col-3">
				<img  src="${userParam.photo }" width="100%">
			</div>
			<div class="col-9" style="padding-top:10px;">
				<h5 ><i class="fas fa-user-tag"></i>   基本資料</h5>
				<p class="title">姓名:</p>
				<span>${userParam.displayName }</span>
				<c:set var="gender" value="${userParam.gender}"></c:set>
				<c:if  test="${gender == 'male'}">
					<span class="male"><i class="fas fa-mars"></i></span>
				</c:if>
				<c:if  test="${gender == 'female'}">
					<span class="female"><i class="fas fa-venus"></i></span>
				</c:if>
				<c:if  test="${gender == 'other'}">
					<span class="other"><i class="fas fa-transgender-alt"></i></span>
				</c:if>
				<br>
				<hr>
				<p class="title">追蹤人數:</p>
				<p>${userParam.followers }</p>
				<c:forEach var="p" items="${userParam.plikes }">
				<a href="">${p.title}</a><br>
			</c:forEach>
				<p>${userParam.plikes }</p>
				<hr>
				<p class="title">關於我:</p>
				<p>${userParam.introduction }</p>
			</div>
		</div>
		<div class="row" style="margin-top:20px;">
		
		<div class="col-12">
			<h5><i class="fab fa-youtube youtube"></i>   我的表演    <span title="新增影片" style="cursor: pointer;" id="padd" ></span></h5>
			<c:forEach var="performance" items="${userParam.performanceSet}">
				<a href="/performanceview/${performance.id}">${performance.title}</a><br>
			</c:forEach><hr></div>
		<div class="col-12" style="margin-top:20px;">
			<h5><i class="fas fa-heart heart"></i>   我的最愛</h5>
			<c:forEach var="plikes" items="${plike}">
				<a href="/performanceview/${plikes.id}">${plikes.title}</a><br>
			</c:forEach><hr></div>
		<div class="col-12" style="margin-top:20px;">
			<h5><i class="far fa-newspaper news"></i>    我的文章    <span title="新增文章" style="cursor: pointer;" onclick="(function(){window.location.href='/article/add?type=Artist&refid=${articleParam[0].announcedUserId}'})()" id="atadd"></span></h5>
			<c:forEach var="article" items="${articleParam}">
				<a href="javascript:window.open('/article/${article.id}');">${article.name}</a><br>
			</c:forEach><hr></div>
			<div class="col-12" style="margin-top:20px;">
			<h5><i class="fas fa-gamepad game" ></i>    我的活動    <span title="新增活動" style="cursor: pointer;"  id="acadd"></span></h5>
			<c:forEach var="activity" items="${userParam.activitySet}">
				<a href="javascript:window.open('/activity/view/${activity.id}');">${activity.name}－${activity.description}</a><br>
			</c:forEach><hr></div>
		</div>
		<script>
		$("#padd").click(function(){
			window.location.href="/user/performance/select";
		})
		$("#acadd").click(function(){
			window.location.href="/activity/add";
		})
		
		if(location.href.substring(17)=="<sec:authentication property='name' />"){
			$("#padd").html("<i class='far fa-plus-square'></i>")
			$("#atadd").html("<i class='far fa-plus-square'></i>")
			$("#acadd").html("<i class='far fa-plus-square'></i>")
		}
		if(location.href.substring(17)!="<sec:authentication property='name' />"){
			$("#addFriendBT").html("<button onclick='addFriend()'>加為好友</button>")
		}
		</script>
		</div>
</body>
</html>