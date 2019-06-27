<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />	
<link rel="stylesheet" href="/resources/admin-bootstrap/css/jquery-ui-timepicker-addon.css">
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
						<h1 class="h3 mb-0 text-gray-800">Edit This Activity</h1>

					</div>

					<!-- Return to Activity -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Activity</span>
					</a>

					<hr>

					<form id="form" name="form" class="user" autocomplete="off">
						<div class="form-group row"
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="id">ID:</label> <input type="text"
									class="form-control form-control-user" id="id" name="id"
									placeholder="" value="${activityParam.id}" readonly>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="name">Name:</label> <input id="name" name="name"
									class="form-control form-control-user" placeholder="NAME"
									value="${activityParam.name}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="artist">Artist:</label> <input id="artist"
									name="artist" class="form-control form-control-user"
									placeholder="Artist" value="${activityParam.artist}" />
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="description">Description:</label>
								<textarea id="description" name="description"
									class="form-control">${activityParam.description}</textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="beginTime">Begin time:</label> <input id="beginTime"
									name="beginTime" type="text"
									class="form-control form-control-user" placeholder="BeginTime"
									value="${activityParam.beginTime}" readonly="readonly" style="background-color:#ffffff" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="endTime">End time:</label> <input id="endTime" type="text"
									name="endTime" class="form-control form-control-user"
									placeholder="EndTime" value="${activityParam.endTime}" readonly="readonly" style="background-color:#ffffff" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<button id="update" type="button"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text"> Edit This Activity</span>
						</button>

						<button id="reset" type="button"
							class="btn btn-danger btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-excel"></i>
							</span> <span class="text"> Reset Input</span>
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

</body>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>
<script>
	$("#update").click(
			function() {
				$.ajax({
					url : '/admin/activity/update',
					method : 'PUT',
					contentType : 'application/json;charset=UTF-8',
					dataType : 'json',
					data : $("#form").serializeObject(),
					success : function(response) {
						if (response.type == "SUCCESS") {
							alert("資料修改成功！\n您修改了一筆名為："
									+ JSON.stringify(response.data.name));
						} else {
							alert("資料修改失敗！請檢查輸入欄位！");
						}
					},
					error : function(re) {
						alert("資料修改失敗！請檢查輸入欄位！");
					}
				})
			})
			
			
			
			$(function() {
		    $( "#beginTime" ).datetimepicker({
		        showButtonPanel: true,
		        dateFormat:'yy-mm-dd',
		        timeFormat: "HH:mm:ss",
		        onClose: function(selectedDate) {
					$("#endTime").datepicker("option", "minDate", selectedDate)}
		    });
		    $( "#endTime" ).datetimepicker({
		        showButtonPanel: true,
		        dateFormat:'yy-mm-dd',
		        timeFormat: "HH:mm:ss",
		        onClose: function(selectedDate) {
					$("#beginTime").datepicker("option", "maxDate", selectedDate)}
		    });
		  });
</script>
</html>