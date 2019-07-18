<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<a class="dropdown-item" href="/user/activity/list">關於活動</a>
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
					<a class="dropdown-item" href="/article">關於文章</a>
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
					<a class="dropdown-item" href="/user/job/list">關於廠商</a>
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
<script src="/resources/user-bootstrap/js/all.js"></script>
<script src="//cdn.jsdelivr.net/jquery.color-animation/1/mainfile"></script>

</head>