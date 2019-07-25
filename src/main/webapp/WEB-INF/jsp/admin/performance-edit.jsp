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
				<div class="container-fluid"
					style="font-family: 'Noto Sans TC', sans-serif;">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Edit This Performance</h1>

					</div>

					<!-- Return to Performance -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Performance</span>
					</a>

					<hr>
					<form id="form" class="user"
						action="/admin/performance/update" method="POST">
						<input type="hidden" id="id" name="id" value="${performance.id}" />
						<div class="form-group row">
							<div class="col-sm-4 mb-3 mb-sm-0">
							<label for="context">表演標題:</label>
								<input type="text" id="title" name="title" class="form-control form-control-user"
									 value="${performance.title}"  />
							</div>
							<div class="col-sm-7 mb-3 mb-sm-0">
							<label for="context">表演簡介:</label>
								<input type="text" id="introduction" name="introduction" class="form-control form-control-user"
									 value="${performance.introduction}"  />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-5 mb-3 mb-sm-0">
								<label for="context">表演連結:</label>
								<input type="text" id="url"  name="url" class="form-control form-control-user"
									 value="${performance.url}" />
								
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="type">關聯活動:</label> <select
									name="activityId" id="activityId"
									class="form-control " ></select>

							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-1 mb-3 mb-sm-0">
								<label for="context">觀看數:</label>
								<input type="text" id="views"  name="views" class="form-control form-control-user"
									 value="${performance.views}" />
								
						</div>
						<div class="col-sm-1 mb-3 mb-sm-0">
								<label for="context">喜歡數:</label>
								<input type="text" id="likes"  name="likes" class="form-control form-control-user"
									 value="${performance.likes}" />
								
						</div>
						<div class="col-sm-1 mb-3 mb-sm-0">
								<label for="context">不喜歡數:</label>
								<input type="text" id="dislikes"  name="dislikes" class="form-control form-control-user"
									 value="${performance.dislikes}" />
								
						</div>
						<div class="col-sm-1 mb-3 mb-sm-0">
								<label for="context">發布人ID:</label>
								<input type="text" id="userpId"  name="userpId" class="form-control form-control-user"
									 value="${performance.userpId}" />
								
						</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<button type="button" id="update"
									class="btn btn-primary btn-user btn-block"><span
									class="icon text-white-50"> <i
										class="fas fa-file-import"></i>
								</span> <span class="text">OK</span></button>
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
$.ajax({
	url:"/admin/performance/aid",
	type:"POST",
	success: function(data){
		var txt="";		
		$.each(data,function(index,value){
			txt += 	"<option value='"+value['id']+"'>"+ value['name']+"</option>"			
			})	
		$("select").html(txt);
	}
})

$("#update").click(
				function() {
					console.log($("#form").serializeObject());
					$.ajax({
						url : "/admin/performance/update",
						type : "PUT",
						contentType : "application/json",
						dataType : "json",
						data : $("#form").serializeObject(),
						success : function(result) {
							console.log(result)
							if (result.type == "SUCCESS") {
								alert("更新成功");
							} else if (result.type == "ERROR") {
								alert("更新失敗，請檢查輸入");
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