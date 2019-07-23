<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>註冊</title>
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/login/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/resources/login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<c:if test="${not empty errorMessage}">
					<div style="color: red; font-weight: bold; margin: 30px 0px;">${errorMessage}</div>
				</c:if>
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178"
					action="/register" method="POST">
					<span class="login100-form-title"> Jayee </span>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="請輸入帳號">
						<input class="input100" type="text" name="username"
							autofocus="autofocus" value="" placeholder="帳號"> <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="請輸入電子信箱">
						<input class="input100" type="email" name="email" value=""
							placeholder="電子信箱"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="請輸入密碼">
						<input class="input100" type="password" name="password" value=""
							placeholder="密碼"> <span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">註冊</button>
					</div>
					<div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9"> 已經擁有帳號了? </span> <a href="/login"
							class="txt3"> 現在登入! </a>
					</div>

				</form>
			</div>
		</div>
	</div>
	<!--===============================================================================================-->
	<script src="/resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="/resources/login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/login/js/main.js"></script>
</body>
</html>