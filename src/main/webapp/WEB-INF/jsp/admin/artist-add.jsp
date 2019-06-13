%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 被淘汰 -->
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
				<div class="container-fluid"
					style="font-family: 'Noto Sans TC', sans-serif;">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Add New Artist</h1>
					</div>
					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Artist</span>
					</a>
					<hr>
					<form id="input">
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">Name:</label> <input name="name" id="name"
									class="form-control form-control-user" placeholder="ex:Peter"
									autofocus="autofocus" /> <span style="color: red"
									id="namecheck" class="check"></span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="fanNumber">Fan_Number:</label> <input
									name="fanNumber" id="fanNumber"
									class="form-control form-control-user" placeholder="ex:30678" />
								<span style="color: red" id="numcheck" class="check"></span>
							</div>

						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="location">Location:</label> <input name="location"
									id="location" class="form-control form-control-user"
									placeholder="ex:Taipei" /> <span style="color: red"
									id="locationcheck" class="check"></span>
							</div>
						</div>
						<input id="bt" type="button" value="send">
						<input id="reset" type="reset" value="reset">
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
	<script>
		$(document).ready(function() {
			var rule = /^.+$/;
			$('#name').blur(function() {
				if (rule.test($('#name').val())) {
					$('#namecheck').text('');
					$('#bt').removeAttr('disabled');
				} else {
					$('#namecheck').text('請輸入姓名');
					$('#bt').attr('disabled', 'disabled');
				}
			})
			var ruleNum = /^\d+$/;
			$('#fanNumber').blur(function() {
				if (ruleNum.test($('#fanNumber').val())) {
					$('#numcheck').text('');
					$('#bt').removeAttr('disabled');
				} else {
					$('#numcheck').text('請輸入粉絲人數');
					$('#bt').attr('disabled', 'disabled');
				}
			})

			$('#location').blur(function() {
				if (rule.test($('#location').val())) {
					$('#locationcheck').text('');
					$('#bt').removeAttr('disabled');
				} else {
					$('#locationcheck').text('請輸入地點');
					$('#bt').attr('disabled', 'disabled');
				}
			})
		});
		$("#reset").click(function(){
			$('#namecheck').text('');
			$('#numcheck').text('');
			$('#locationcheck').text('');
			$('#bt').removeAttr('disabled');
		});
		$("#bt").click(function() {
			var input = $("#input").serializeArray();
			var o = {};
			$.each(input, function(i, filed) {
				o[filed.name] = filed.value;
			});
			$.ajax({
				type : "POST",
				url : "/admin/artist/insert",
				contentType : "application/json;charset=UTF-8",
				dataType : "text",
				data : JSON.stringify(o),
				success : function(data) {
					data = JSON.parse(data);
					$("span.check").html("");
					$.each(data, function(index, value) {
						$("#" + index + "check").html(value);
					});
					if (data["success"] != null)
						window.location.assign("/admin/artist/list");
				},
			});
		});
	</script>
</body>
</html>