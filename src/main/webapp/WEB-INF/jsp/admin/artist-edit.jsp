<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
						<h1 class="h3 mb-0 text-gray-800">Edit New Artist</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Artist</span>
					</a>

					<hr>

					<form id="editform" name="editform" class="user">
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="id">ID:</label> <input type="text" name="id" id="id"
									class="form-control form-control-user"
									value="${artistParam.id}" readonly />
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">Name:</label> <input type="text" name="name"
									id="name" class="form-control form-control-user"
									value="${artistParam.name}" autofocus="autofocus" /> <span
									style="color: red" id="namecheck" class="check"></span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="fanNumber">Fan_Number:</label> <input type="text"
									name="fanNumber" id="fanNumber"
									class="form-control form-control-user"
									value="${artistParam.fanNumber}" /> <span style="color: red"
									id="numcheck" class="check"></span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="location">Location:</label> <input type="text"
									name="location" id="location"
									class="form-control form-control-user"
									value="${artistParam.location}" /> <span style="color: red"
									id="locationcheck" class="check"></span>
							</div>
						</div>
						<button id="bt" type="button"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text">Edit This Artist</span>
						</button>
						<button type="reset" id="resetbt"
							class="btn btn-danger btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-excel"></i>
							</span> <span class="text">Reset</span>
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
			var nameflag = false;
			var numflag = false;
			var locationflag = false;
			$('#name').blur(function() {
				if (rule.test($('#name').val())) {
					$('#namecheck').text('');
					nameflag = true;
					if (nameflag && numflag && locationflag)
						$('#bt').prop('disabled', false);
				} else {
					$('#namecheck').text('請輸入姓名');
					nameflag = false;
					$('#bt').prop('disabled', true);
				}
			});
			var ruleNum = /^\d+$/;
			$('#fanNumber').blur(function() {
				if (ruleNum.test($('#fanNumber').val())) {
					$('#numcheck').text('');
					numflag = true;
					if (nameflag && numflag && locationflag)
						$('#bt').prop('disabled', false);
				} else {
					$('#numcheck').text('請輸入粉絲人數');
					numflag = false;
					$('#bt').prop('disabled', true);
				}
			});
			$('#location').blur(function() {
				if (rule.test($('#location').val())) {
					$('#locationcheck').text('');
					locationflag = true;
					if (nameflag && numflag && locationflag)
						$('#bt').prop('disabled', false);
				} else {
					$('#locationcheck').text('請輸入地點');
					locationflag = false;
					$('#bt').prop('disabled', true);
				}
			});
		});
		$("#bt").click(function() {
			$.ajax({
				url : 'update',
				method : 'PUT',
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				data : $("#editform").serializeObject(),
				success : function(response) {
					if (response.type == 'SUCCESS') {
						alert("成功修改" + JSON.stringify(response.data.name));
						$(location).attr('href', '/admin/artist/list');
					} else {
						alert("修改失敗");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
					alert("修改失敗，請檢查欄位");
				}
			})
		});
		$("#resetbt").click(function() {
			$('#bt').removeAttr('disabled');
			$('#namecheck').text('');
			$('#numcheck').text('');
			$('#locationcheck').text('');
		})
	</script>
</body>
</html>