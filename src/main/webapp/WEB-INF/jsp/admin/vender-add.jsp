<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="topbar.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Add This Vender</h1>

					</div>

					<!-- Return to Vender -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Vender</span>
					</a>

					<hr>
					<!--  action="/admin/vender/insert" -->
					<form class="user" id="addvender" name="addVender" method="POST">
						<div class="form-group row"
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="name">ID:</label> <input type="text"
									class="form-control form-control-user" id="id" name="id"
									placeholder="" value="${param.id}" readonly>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">NAME:</label> <input type="text"
									class="form-control form-control-user" id="name" name="name"
									placeholder="NAME" value="${param.name}"><span
									style="color: red" id="namecheck" class="check"></span>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="address">ADDRESS:</label> <input type="text"
									class="form-control form-control-user" id="address"
									name="address" placeholder="ADDRESS" value="${param.address}"><span
									style="color: red" id="addresscheck" class="check"></span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="maxPeople">MAXPEOPLE:</label> <input type="text"
									class="form-control form-control-user" id="maxPeople"
									name="maxPeople" placeholder="maxPeople"
									value="${param.maxPeople}"><span style="color: red"
									id="maxPeoplecheck" class="check"></span>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="phone">PHONE:</label> <input type="text"
									class="form-control form-control-user" id="phone" name="phone"
									placeholder="phone" value="${param.phone}"><span
									style="color: red" id="phonecheck" class="check"></span>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<div class="btn btn-primary btn-user btn-block" id="submit">
						<label  >submit</label></div>
						<div class="btn btn-primary btn-user btn-block" id="reset">
						<label  >reset</label></div>
						<!-- 						<a href="javascript:document.getElementById('addvender').submit();" class="btn btn-primary btn-user btn-block"><span -->
						<!-- 							class="icon text-white-50"> <i class="fas fa-file-import"></i> -->
						<!-- 						</span> <span class="text"> Add This Vender</span></a> <a href="javascript:document.getElementById('addVender').reset();" -->
						<!-- 							class="btn btn-danger btn-user btn-block"><span -->
						<!-- 							class="icon text-white-50"> <i class="fas fa-file-excel"></i> -->
						<!-- 						</span> <span class="text"> Reset Input</span></a> -->

					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp"></jsp:include>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

</body>

<script>
	$(document).ready(function() {
		$("#submit").click(function() {
			var dat = $("#addvender").serializeArray();
			var a = [];
			var o = {};
			// 	alert(JSON.stringify(dat));
			$.each(dat, function(i, filed) {
				o[filed.name] = filed.value;
			});
			a.push(o);
			var a2 = JSON.stringify(a);

			$.ajax({
				url : "insert",
				type : "POST",
				dataType : "text",
				data : a2,
				contentType : "application/json",
				success : function(data) {
					data = JSON.parse(data);
					$("span.check").html("");
					$.each(data, function(index, value) {
						$("#" + index + "check").html(value)
					})
					if (data["success"] != null)
						window.location.assign("/admin/vender/list");
				}
			})
			return false;
		})
		$("#name").blur(function(){
			var re=/.+/;
		if(!re.test($("#name").val()))
			$("#namecheck").html("請輸入餐廳名稱");
		else
			$("#namecheck").html("");
		});
		$("#address").blur(function(){
			var re=/.+/;
			if(!re.test($("#address").val()))
			$("#addresscheck").html("請輸入地址");
			else
				$("#addresscheck").html("");
		});
		$("#maxPeople").blur(function(){
			var re=/\d+/;
			if(!re.test($("#maxPeople").val()))
			$("#maxPeoplecheck").html("請輸入容納人數");
			else
				$("#maxPeoplecheck").html("");
		});
		$("#phone").blur(function(){
			var re=/\d+/;
			if(!re.test($("#phone").val()))
			$("#phonecheck").html("請輸入電話");
			else
				$("#phonecheck").html("");
		});
		$("#reset").click(function(){
			alert($("#addvender")[0])
			alert($("#addvender"))
// 			alert("aaa");
			$("#addvender")[0].reset();
	})
		
	});
</script>
</html>