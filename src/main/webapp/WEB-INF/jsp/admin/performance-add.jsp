<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<style>
.check {
	color: red;
}
</style>
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

					<form id="form" class="user">
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="context">FILE TITLE:</label><input type="text"
									name="title" id="title" class="form-control form-control-user"
									placeholder="File Title"  />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="context">FILE INTRODUCTION:</label><input type="text"
									name="introduction" id="introduction" class="form-control form-control-user"
									placeholder="File Introduction"  />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="context">URL:</label> <input type="text" name="url"
									id="url" class="form-control form-control-user"
									placeholder="URL" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="type">Related activities:</label> <select
									name="activityId" id="activityId"
									class="form-control " ></select>

							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<button type="button" id="insert"
									class="btn btn-primary btn-user btn-block">
									<span class="icon text-white-50"> <i
										class="fas fa-file-import"></i>
									</span> <span class="text"> OK</span>
								</button>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<a href="javascript:document.getElementById('forum').reset();"
									class="btn btn-danger btn-user btn-block"><span
									class="icon text-white-50"> <i class="fas fa-file-excel"></i>
								</span> <span class="text"> Reset Input</span></a>
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
	$.ajax({
		url:"/admin/performance/aid",
		type:"POST",
		success: function(data){
			var txt="";		
			console.log(data);
			$.each(data,function(index,value){
				txt += 	"<option value='"+value['id']+"'>"+ value['title']+"</option>"			
				})	
			$("select").html(txt);
			
		}
	})
		$("#insert").click(
				function() {
					console.log($("#form").serializeObject());
					$.ajax({
						url : "/admin/performance/insert",
						type : "POST",
						contentType : "application/json",
						dataType : "json",
						data : $("#form").serializeObject(),
						success : function(result) {
							if (result.type == "SUCCESS") {
								console.log("success");
								$("#form").attr("action",
										"/admin/performance/edit");
								$("#id").val(result.data["id"]);
								$("#form").submit();
							} else if (result.type == "ERROR") {
								alert("新增失敗，請檢查輸入");
								var messages = result.messages;
								$("span.check").remove();
								$.each(messages, function(index, value) {
									console.log(value);
									$("#" + value.title)
											.after(
													"<span class='check'>"
															+ value.content
															+ "</span>");
								})
							}

						}
					});
				});
	

</script>

</body>
</html>