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
<title>基本資料</title>
<style>
</style>
</head>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<sec:authorize access="hasAnyRole('USER', 'ARTIST')">

		<div class="container" style="margin-top: 70px;">
			<form>
				<div>
					<label for="displayName">顯示名稱</label> <input id="displayName" required="required" type="text"
						value="${userParam.displayName }">
				</div>

				<div>
					<label>頭像</label>
				</div>

				<div>
					<label for="memberName">真實姓名</label> <input id="memberName" type="text"
						value="${userParam.memberName }">
				</div>

				<div>
					<label>性別</label>
					<label>
                    <input type="radio" name="gender" id="gender" value="male" required="required">男
                	</label>
                	<label>
                    <input type="radio" name="gender" id="gender" value="female">女
                	</label>
                	<label>
                    <input type="radio" name="gender" id="gender" value="other">其他
                	</label>
				</div>

				<div>
					<label for="mail">電子郵件</label> <input id="mail" type="email" value="${userParam.mail }">
				</div>

				<div>
					<label>生日</label>
				</div>

				<div>
					<label for="address">住址</label> <input id="address" type="text" value="${userParam.address }">
				</div>

				<div>
					<label for="introduction">介紹</label> <input id="introduction" type="text"
						value="${userParam.introduction }">
				</div>
			</form>
		</div>
	</sec:authorize>

</body>
</html>