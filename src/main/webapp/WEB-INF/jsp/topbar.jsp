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
			<a class="navbar-brand" href="#">Jayee</a>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="#"
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
				<img src="img/article.jpg" width="45px">
				<span style="color: white; margin-right: 40px; margin-left: 20px"><sec:authentication
						property="name" /></span>
				<a href="/logout"><button class="btn btn-danger my-2 my-sm-0"
						type="submit">登出</button></a>

			</sec:authorize>
			<sec:authorize access="hasRole('ADMIN')">
    	<a href="/admin/artist/list">back end</a>
			</sec:authorize>

		</div>
	</nav>
	<nav class="navbar navbar-expand-md navbar-light bg-light"
		style="margin-top: 70px;">
		<div class="mx-auto order-0">
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar1"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-home"></i> 首頁
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="homebar">
					<a class="dropdown-item" href="#" id="topbar">關於街藝</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar2"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-street-view"></i> 藝人
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="artistbar">
					<a class="dropdown-item" href="#">關於藝人</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar3"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-glass-cheers"></i> 活動
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="activitybar">
					<a class="dropdown-item" href="#">關於活動</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar4"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fab fa-youtube"></i> 表演
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="performancebar">
					<a class="dropdown-item" href="#">關於表演</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar5"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="far fa-newspaper"></i> 文章
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="articlebar">
					<a class="dropdown-item" href="#">關於文章</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar6"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-hands-helping"></i> 廠商
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="venderbar">
					<a class="dropdown-item" href="#">關於廠商</a>
				</div>
			</div>

		</div>
	</nav>
</header>