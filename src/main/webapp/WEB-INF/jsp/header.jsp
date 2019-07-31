<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header>
	<nav class="navbar navbar-expand-md navbar-light bg-light"
		style="padding-top: 70px;">
		<div class="mx-auto order-0">
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar1"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-home"></i> 首頁
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="homebar">
					<a class="dropdown-item" href="/index" id="topbar">街藝</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar2"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					onclick="javascript:location.href='/artist'">
					<i class="fas fa-street-view"></i> 藝人
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar3"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-glass-cheers"></i> 活動
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="activitybar">
					<a class="dropdown-item" href="/activity/list">搜尋活動頁面</a>
					<a class="dropdown-item" href="/map/page">探索附近活動</a>
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
					<a class="dropdown-item" href="/performances">表演列表</a>
					<sec:authorize access="isAuthenticated()">
						<a class="dropdown-item" href="/user/performance/select">新增表演</a>
					</sec:authorize>
				</div>


			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar5"
					onclick="javascript:location.href='/article'"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="far fa-newspaper"></i> 文章
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="articlebar">
					<a class="dropdown-item" href="/article">文章列表</a>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn bar" id="topbar6"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-hands-helping"></i> 職缺
				</button>
				<button type="button" class="btn bar2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></button>
				<div class="dropdown-menu" id="venderbar">
					<a class="dropdown-item" href="/job/list">工作列表</a>
					<sec:authorize access="hasRole('VENDER')" >
						<a class="dropdown-item" id=venderselfpage href="">廠商頁面</a>
					</sec:authorize>
				</div>
	
			</div>

		</div>
	</nav>

</header>
<head>
<meta charset="UTF-8">
<title>JAYEE</title>
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
<!-- <script src="/resources/user-bootstrap/js/all.js"></script> -->
<script src="//cdn.jsdelivr.net/jquery.color-animation/1/mainfile"></script>

</head>