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
					<form id="user">
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">Name:</label> <input name="name" 
									class="form-control form-control-user" placeholder="ex:Peter"
									value="${artistParam.name}" />
							</div>

						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="fanNumber">Fan_Number:</label> <input name="fanNumber"
									class="form-control form-control-user" placeholder="ex:30678"
									value="${artistParam.fanNumber}" />
							</div>

						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">Location:</label> <input name="location"
									class="form-control form-control-user" placeholder="ex:Taipei"
									value="${artistParam.location}" />
							</div>
						</div>
						<input id="bt" type="button" value="send">
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
		$("#bt").click(function() {
			var input = $("#user").serializeArray();
// 			alert(JSON.stringify(input));
			var a = [];
			var o = {};
			$.each(input, function(i, filed) {
				o[filed.name] = filed.value;
			});
			a.push(o);
			var a2 = JSON.stringify(a);
// 			alert(a2);
			$.ajax({
				type : "POST",
				url : "/admin/artist/insert",
				contentType : "application/json",
				dataType : "text",
				data : a2,
				success : function() {
					alert("success");
					window.location.assign("/admin/artist/list");
				},
			});
		});
	</script>
</body>
</html>