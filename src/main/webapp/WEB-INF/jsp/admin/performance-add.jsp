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
						<h1 class="h3 mb-0 text-gray-800">Add New Performance</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to List</span>
					</a>

					<hr>

					<form id="form">
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="context">FILE NAME:</label><input type="text"
									name="name" id="name" class="form-control form-control-user"
									placeholder="File NAME" value="${performance.name}" onblur="" />
								<span style="color: red">${error.name}</span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="context">URL:</label> <input type="text" name="url"
									id="url" class="form-control form-control-user"
									placeholder="URL" value="${performance.url}" /> <span
									style="color: red">${error.url}</span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="type">Related activities:</label>
								<input type="text" name="activityId" id="activityId"
									class="form-control form-control-user" placeholder="ACTIVITYID"
									value="${performance.activityId}" />
								<span style="color: red">${error.aid}</span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<a	id="submit"
									href=""
									class="btn btn-primary btn-user btn-block"><span
									class="icon text-white-50"> <i
										class="fas fa-file-import"></i>
								</span> <span class="text">OK</span></a>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<a
									href="javascript:document.getElementById('performance').reset();"
									class="btn btn-danger btn-user btn-block"><span
									class="icon text-white-50"> <i class="fas fa-file-excel"></i>
								</span> <span class="text"> Reset</span></a>
							</div>
						</div>

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

$("#submit").click(function(){
	var input = $("#form").serializeArray();
	alert(JSON.stringify(input));
	var a = [];
	var o = {};
	$.each(input, function(i,filed) {
		
		o[filed.name] = filed.value;
		
	});
	a.push(o);
	var a2 = JSON.stringify(a);	
	alert(a2);
	$.ajax({
		url:"/admin/performance/insert",
		type:"POST",
		contentType:"application/json",
		dataType:"json",
		data:a2,
		success: function(){
			
		}	
	});
});


</script>
</body>
</html>