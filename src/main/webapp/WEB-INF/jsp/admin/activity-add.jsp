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
									id="beginTime" name="beginTime" placeholder="BeginTime">
									
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="endTime">End Time:</label> <input
									type="text" class="form-control form-control-user"
									id="endTime" name="endTime" placeholder="EndTime">
									
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<a id="submit" href="" class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Insert New Activity</span></a> <a href="javascript:document.getElementById('activity').reset();"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></a>

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
		$("#submit").click(function() {
			var input = $("#form").serializeArray();
			alert("JSON.stringify(input)..."+JSON.stringify(input));
			var o = {};
			$.each(input, function(index, field) {
				o[field.name] = field.value;
			});				
			var activity = JSON.stringify(o);
			alert("JSON.stringify(o)..."+activity);
			
			alert(activity.name);
			
			$.ajax({
				url : "/admin/activity/insert",
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				dataType : "json",
				data : activity,
				success : function(data) {
					alert("資料新增成功！" + JSON.stringify(data));
					$(location).attr('href', '/admin/activity/list');  
				},
				error: function (data) {
					alert("資料新增失敗！");
                }
			})
			return false;
		});
	</script>


</body>
</html>