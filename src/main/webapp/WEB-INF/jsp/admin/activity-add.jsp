<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />	
<link rel="stylesheet" href="/resources/css/jquery-ui-timepicker-addon.css">
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
						<h1 class="h3 mb-0 text-gray-800">Add New Activity</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Activity</span>
					</a>

					<hr>

					<form class="user" id="form" action="/admin/activity/insert" method="POST">
						<div class="form-group row">
							<div class="col-sm-5 mb-3 mb-sm-0">
								<label for="name">Name:</label> <input type="text"
									class="form-control form-control-user" id="name" name="name"
									placeholder="NAME">
							</div>
							<div class="col-sm-4 mb-3 mb-sm-0">
								<label for="artist">Artist:</label> <input type="text"
									class="form-control form-control-user" id="artist"
									name="artist" placeholder="Artist">
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="description">Description:</label>
								<textarea class="form-control" id="description"
									name="description"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="beginTime">Begin Time:</label> <input
									type="text" class="form-control form-control-user" 
									id="beginTime" name="beginTime" placeholder="點我輸入起始日期" autocomplete="off" readonly="readonly" style="background-color:#ffffff">
									
									
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="endTime">End Time:</label> <input
									 class="form-control form-control-user" type="text"
									id="endTime" name="endTime" placeholder="點我輸入結束日期" autocomplete="off" readonly="readonly" style="background-color:#ffffff">
									
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<button type="button" id="insert" class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Insert New Activity</span></button> <button type="reset"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></button>

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
		$("#insert").click(function() {
			$.ajax({
				url : "/admin/activity/insert",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				dataType : "json",
				data : $("#form").serializeObject(),
				success : function(response) {
					if(response.type == 'SUCCESS'){
						alert("資料新增成功！" + JSON.stringify(response.data.name)+"即將跳轉Edit頁面...才怪");
						$(location).attr('href', '/admin/activity/edit?id=' + response.data.id);  //新增完成後無法轉Edit頁面,待修
					}else{
						alert("哈! 有錯誤  笨蛋!");
					}
					
				},
				error: function (re) {
					alert("資料新增失敗！");
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

	
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui-timepicker-addon.js"></script>

</body>
</html>