<%@page import="org.springframework.web.servlet.ModelAndView"%>
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
					<form id="inputform">
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">Name:</label> <input type="text" name="name"
									id="name" class="form-control form-control-user"
									placeholder="ex:Peter" autofocus="autofocus" /> <span
									style="color: red" id="namecheck" class="check"></span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="fanNumber">Fan_Number:</label> <input type="text"
									name="fanNumber" id="fanNumber"
									class="form-control form-control-user" placeholder="ex:30678" />
								<span style="color: red" id="numcheck" class="check"></span>
							</div>

						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="location">Location:</label> <input type="text"
									name="location" id="location"
									class="form-control form-control-user" placeholder="ex:Taipei" />
								<span style="color: red" id="locationcheck" class="check"></span>
							</div>
						</div>
						<button id="bt" type="button"
							class="btn btn-primary btn-user btn-block"  disabled="disabled"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Send</span></button> 
						<button type="reset" id="resetbt" class="btn btn-danger btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-excel"></i>
							</span> <span class="text"> Reset</span>
						</button>
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
		$("#bt").click(function() {
			$.ajax({
				url : "insert",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				dataType : "json",
				data : $("#inputform").serializeObject(),
				success : function(response) {
					if (response.type == 'SUCCESS') {
						alert("新增成功" + JSON.stringify(response.data.name));
						$(location).attr('href',
						'/admin/artist/list');
					} else {
						alert("新增失敗");
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
					alert("新增失敗，請檢查欄位");
				}
			});
		});
		$("#resetbt").click(function(){
			$('#bt').attr('disabled', 'disabled');
			$('#namecheck').text('');
			$('#numcheck').text('');
			$('#locationcheck').text('');
		})
	</script>
</body>
</html>