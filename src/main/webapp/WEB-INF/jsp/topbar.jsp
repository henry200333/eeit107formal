<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="headernav">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand" href="/index">Jayee</a>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="/index"
					style="float: right">街藝</a></li>
			</ul>
			<!-- 				未登入狀態 -->
			<sec:authorize access="!isAuthenticated()">
				<a href="/login"><button class="btn btn-primary my-2 my-sm-0"
						type="submit" style="margin-right: 15px;">登入</button></a>
				<a href="register"><button class="btn btn-success my-2 my-sm-0"
						type="submit">註冊</button></a>
			</sec:authorize>
			<!-- 			登入狀態 -->
			<sec:authorize access="isAuthenticated()">
				<button type="button" class="btn btn-dark"
					style="margin-right: 20px;">
					通知 <span class="badge badge-warning">9</span> <span class="sr-only">unread
						messages</span>
				</button>
				<img src="/resources/user-bootstrap/img/index/<sec:authentication		property="name" />.png" width="45px">
				<span style="color: white; margin-right: 40px; margin-left: 20px"><sec:authentication
						property="name" /></span>
				<a href="/logout"><button class="btn btn-danger my-2 my-sm-0"
						type="submit">登出</button></a>

			</sec:authorize>
			<sec:authorize access="hasRole('ADMIN')">
    	<a href="/admin/artist/list" class="btn btn-warning">後台</a>
			</sec:authorize>
			<sec:authorize access="hasRole('ARTIST')">
			<input id="account" hidden="hidden" name="account" value="<sec:authentication property="name" />">
			<button class="btn btn-info"id="bt" type="button" onclick='userpage()'>個人頁面</button>\
			<script>
			function userpage() {
				var a = $("#username").val()
				window.location.href = '/' + a;
			}

			</script>
			</sec:authorize>
		</div>
	</nav>
	
</header>