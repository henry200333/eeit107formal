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
		<div id="content-wrapper" class="d-flex flex-column" style="font-family: 'Noto Sans TC', sans-serif;">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="topbar.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">新增活動</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">活動列表</span>
					</a>

					<hr>

					<form class="user" id="form" action="/admin/activity/insert" method="POST">
						<div class="form-group row">
							<div class="col-sm-5 mb-3 mb-sm-0">
								<label for="name">活動名稱:</label> <input type="text"
									class="form-control form-control-user" id="name" name="name"
									placeholder="" autocomplete="off">
							</div>
							<div class="col-sm-4 mb-3 mb-sm-0">
								<label for="artist">表演者:</label> <input type="text"
									class="form-control form-control-user" id="artist"
									name="artist" placeholder="" autocomplete="off">
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="description">活動描述:</label>
								<textarea class="form-control" id="description"
									name="description" autocomplete="off"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="beginTime">開始時間:</label> <input
									type="text" class="form-control form-control-user" 
									id="beginTime" name="beginTime" placeholder="點我輸入起始日期" autocomplete="off" readonly="readonly" style="background-color:#ffffff">
									
									
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="endTime">結束時間:</label> <input
									 class="form-control form-control-user" type="text"
									id="endTime" name="endTime" placeholder="點我輸入結束日期" autocomplete="off" readonly="readonly" style="background-color:#ffffff">
									
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						
						<div class="form-group row">
						<div class="col-sm-3 mb-3 mb-sm-0">
						<label for="awesomeNum">追蹤人數:</label> <input
									type="text" class="form-control form-control-user" 
									id="awesomeNum" name="awesomeNum" placeholder="點我輸入追蹤數" autocomplete="off">
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
						<label for="badNum">Bad Num:</label> <input
									type="text" class="form-control form-control-user" 
									id="badNum" name="badNum" placeholder="點我輸入倒讚數" autocomplete="off">
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
						<label for="coverImage">Cover Image:</label> <input
									type="text" class="form-control form-control-user" 
									id="coverImage" name="coverImage" autocomplete="off">
						</div>
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
						alert("資料新增成功！" + JSON.stringify(response.data.name)+"即將跳轉Edit頁面");
						window.location.href = "/admin/activity/edit/"+response.data.id;  
					}else{
						alert("有錯誤!");
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
	<script type="text/javascript" src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>

</body>
</html>