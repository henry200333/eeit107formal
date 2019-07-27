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
.lab {
	font-size: 20px;
	font-weight: bold;
}

.value {
	font-size: 15px;
}

.edit {
	color: red;
	font-size: 25px;
	margin-left: 20px;
	cursor: pointer;
}

.edit:hover {
	
}
</style>
</head>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<sec:authorize access="hasAnyRole('USER', 'ARTIST')">

		<div class="container" style="margin-top: 90px;">
			<h4 style="margin-left: 20px; font-weight: bold">
				<i class="fas fa-user"></i> 帳號設定
			</h4>
			<div class="row">
				<div class='col-4'>
					<label
						style="font-size: 20px; font-weight: bold; margin-top: 20px;">頭像(點擊以更換)</label>
					<form method="post" action="/uploadPhoto"
						enctype="multipart/form-data">
						<div id="previewDiv" class="previewDiv">
							<img id="userPhoto" width="100%" src="${userParam.photo }"
								style='width: 290px; height: 353px' />
						</div>
						<input type="file" name="imageFile" id="imageFile"
							accept="image/gif, image/jpeg, image/png" style='display: none' />
						<input type="text" hidden="hidden" name="username" id="username"
							value="<sec:authentication		property="name" />"> <input
							type="submit" value="Upload" style='display: none'
							id='photoSubmit' />
					</form>
				</div>
				<div class="col-8" style="padding-top: 20px;">
					<span class="lab" style="margin-left: 15px;">個人介紹</span><br> <input
						class="form-control" type="text" value="${userParam.introduction}">
					<%-- 					<span class="value" id="introduction" style="margin-left: 15px;">${userParam.introduction}</span> --%>
					<span id="introduction" onclick="edit(this)" class="edit"><i
						class="fas fa-highlighter"></i></span>
				</div>
			</div>
			<script>
				$("#userPhoto").click(function() {
					$("#imageFile").trigger("click");
				});
				$("#imageFile").change(function() {
					readURL(this);
					$("#photoSubmit").trigger("click");
				});
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$("#PreviewPic").attr('src', e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
			</script>
			<div class="row" style="margin-top: 40px">
				<div class="col-4">
					<span class="lab" style="margin-left: 15px;">顯示名稱</span><br> <input
						class="form-control" type="text" value="${userParam.displayName}">

					<%-- 					<span class="value" id="desplayName" style="margin-left: 15px;">${userParam.displayName}</span> --%>
					<span id="displayName" onclick="edit(this)" class="edit"><i
						class="fas fa-highlighter"></i></span>
				</div>
				<div class="col-4">
					<span class="lab" style="margin-left: 15px;">真實姓名</span><br> <input
						class="form-control" type="text" value="${userParam.memberName}">
					<%-- 					 <span class="value" id="memberName" style="margin-left: 15px;">${userParam.memberName}</span> --%>
					<span id="trueName" onclick="edit(this)" class="edit"><i
						class="fas fa-highlighter"></i></span>
				</div>
				<div class="col-4">
					<span class="lab" style="margin-left: 15px;">性別</span><br> 
					<input type="radio" name="gender" id="genderMale" value="male">男
					<input type="radio" name="gender" id="genderFemale" value="female">女 
					<input type="radio" name="gender" id="genderOther" value="other">其他
					<span id="gender" onclick="edit(this)" class="edit"><i
						class="fas fa-highlighter"></i></span>
				</div>

				<div class="col-12">
					<hr>
				</div>
				<div class="col-4">
					<span class="lab" style="margin-left: 15px;">電子郵件</span><br> <input
						class="form-control" type="text" value="${userParam.mail}">
					<%-- 					 <span class="value" id="mail" style="margin-left: 15px;">${userParam.mail}</span> --%>
					<span id="mail" onclick="edit(this)" class="edit"><i
						class="fas fa-highlighter"></i></span>
				</div>
				<div class="col-4">
					<span class="lab" style="margin-left: 15px;">生日</span><br> <input
						class="form-control" type="text" value="${userParam.birth}">
					<%-- 					 <span class="value" id="birth" style="margin-left: 15px;">${userParam.birth}</span> --%>
					<input type="button" id="editBefore" style="display: none"
						onclick="edit(this)"> <span class="edit"><i
						class="fas fa-highlighter"></i></span>
				</div>
				<div class="col-4">
					<span class="lab" style="margin-left: 15px;">住址</span><br> <input
						class="form-control" type="text" value="${userParam.address}">
					<%-- 					 <span class="value" id="address" style="margin-left: 15px;">${userParam.address}</span> --%>
					<span id="address" onclick="edit(this)" class="edit"><i
						class="fas fa-highlighter"></i></span>
				</div>
			</div>
		</div>
		<script>
		var gender = "${userParam.gender}";
		if (gender == $("#genderMale").val()) {
			$("#genderMale").attr("checked", true);
			$("#gender").before("<input type='text' hidden='hidden' value='male' id='genderValue'>");
		}
		if (gender == $("#genderFemale").val()) {
			$("#genderFemale").attr("checked", true);
			$("#gender").before("<input type='text' hidden='hidden' value='female' id='genderValue'>");
		}
		if (gender == $("#genderOther").val()) {
			$("genderOther").attr("checked", true);
			$("#gender").before("<input type='text' hidden='hidden' value='other' id='genderValue'>");
		}
		$('input[type=radio]').change(function(){
			$("#genderValue").val($(this).val())
		});
			function edit(obj) {
				$.ajax({
					url : "/settings/profiles",
					method : "POST",
					data : {
						"context" : $(obj).prev().val(),
						"type" : obj.id
					},
					success : function(data) {
						if (data) {
							alert("修改成功")
						} else if (!data)
							alert("修改失敗，請重新修改")
					}
				})
			}
		</script>
	</sec:authorize>
	<!-- 	footer開始，包含聊天 -->
	<jsp:include page="../chat.jsp"></jsp:include>
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- 	footer結束 -->
</body>
</html>