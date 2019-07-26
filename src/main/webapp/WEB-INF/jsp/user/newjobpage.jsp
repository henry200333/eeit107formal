<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="/resources/admin-bootstrap/css/jquery-ui-timepicker-addon.css">
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../topbar.jsp"></jsp:include>


	<div class="container">
		<!-- /.container-fluid -->


		<!-- 廠商名 -->
		<div class="d-sm-flex align-items-center justify-content-between mb-6">
			<div class='col-sm-12 mb-3 mb-sm-6' style="text-align: center">
				<h1 class="text">${vender.name}</h1>
			</div>
		</div>
		<div class='col-sm-12 mb-0 mb-sm-0'>
			<img class='col-sm-12 mb-0 mb-sm-0' src="${vender.img}">
		</div>

		<form class="user" id="addjob" name="addjob" method="POST">
		<input hidden="hidden" name="venderId"
		value="${vender.id}" id="venderId">
			<div class="form-group row"
				style="font-family: 'Noto Sans TC', sans-serif;">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label for="name">工作標題:</label> <input type="text"
						class="form-control form-control-user" id="name" name="name"
						placeholder="誠徵XXX" value="${param.name}">
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label for="name">店家名稱:</label> <input type="text"
						class="form-control form-control-user" id="venderName"
						name="venderName" placeholder="NAME" value="${vender.name}"
						readonly>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-3 mb-3 mb-sm-0">
					<label for="reward">薪資:</label> <input type="text"
						class="form-control form-control-user" id="reward" name="reward"
						placeholder="薪資" value="${param.reward}">
				</div>
				<div class="col-sm-1 mb-3 mb-sm-0"></div>
				<div class="col-sm-3 mb-3 mb-sm-0">
					<label for="jobTime">表演時間:</label> <input type="text"
						class="form-control form-control-user" id="jobTime" name="jobTime"
						placeholder="表演時間" value="${param.jobTime}">
				</div>
						<div class="col-sm-1 mb-3 mb-sm-0"></div>
				<div class="col-sm-3 mb-3 mb-sm-0">
					<label for="jobType">表演類型:</label>
					<!-- 					<input type="text" -->
					<!-- 						class="form-control form-control-user" id="maxPeople" -->
					<!-- 						name="maxPeople" placeholder="maxPeople" -->
					<%-- 						value="${param.maxPeople}"> --%>
					<select name=jobType id="jobType">

						<option value="表演藝術">表演藝術</option>
						<option value="聽覺藝術">聽覺藝術</option>
						<option value="創意工藝">創意工藝</option>
					</select>
				</div>


			</div>
			<div class="form-group row">
				<div class="col-sm-9 mb-3 mb-sm-0">
					<label for="detal">詳細內容:</label>
				<textarea class='form-control' name='detal'style='resize: none' id='detal'  >${param.jobTime}</textarea>
				</div>
			</div>
			<div class="btn btn-primary btn-user btn-block" id="submit">
				<label>submit</label>
			</div>
			<div class="btn btn-primary btn-user btn-block" id="reset">
				<label>reset</label>
			</div>

		</form>




	</div>







	<input hidden="hidden" name="userName"
		value="<sec:authentication property="name" />" id="username">

</body>
<jsp:include page="../footer.jsp"></jsp:include>


<script>
	$(document).ready(function() {
		$("#submit").click(function() {
			// 		console.log($("#addvender").serializeObject());
			// 		alert($("#addvender").serializeObject())
			console.log($("#addjob").serializeObject());
			$.ajax({
				url : "/job/addjob",
				type : "POST",
				dataType : "json",
				data :JSON.parse($("#addjob").serializeObject()),
// 				contentType : "application/json",
				success : function(data) {
					if (data["success"] != null)
						window.location.assign("/job/vender/"+${vender.id});
				}
			})
		})

		$("#reset").click(function() {
			alert($("#addjob")[0])
			alert($("#addjob"))
			//			alert("aaa");
			$("#addjob")[0].reset();
		})

		$("#jobTime").datetimepicker({

			// 		        showButtonPanel: false,
			language : 'zh-CN',
			dateFormat : 'yy-mm-dd',
			timeFormat : "HH:mm:ss",
			MinDate : new Date(),
		});

	});
</script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript"
	src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>

</html>