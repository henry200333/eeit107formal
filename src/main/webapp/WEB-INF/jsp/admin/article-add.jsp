<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<link rel="stylesheet" href="/resources/editormd/css/editormd.css" />
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
						<h1 class="h3 mb-0 text-gray-800">Add New Article</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Article</span>
					</a>

					<hr>

					<form id="form1" name="form1" class="user" autocomplete="off">
						<div class="form-group row">
							<div class="col-sm-10 mb-3 mb-sm-0">
								<label for="name">NAME:</label> <input id="name" name="name"
									class="form-control form-control-user" placeholder="NAME" />
								<small class="form-text text-muted">NAME最少2個字元，最大30個字元</small>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-10 mb-3 mb-sm-0">
								<label for="content">CONTENT(支援Markdown編輯器):</label>
								<div id="test-editor">
								<textarea id="content" name="content" style="display:none;"></textarea>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-4 mb-3 mb-sm-0">
								<label for="articleType">TYPE:</label>
								<div class=" input-group">
									<input type="text" id="articleType" name="articleType" class="form-control form-control-user" value="Other"
									 readonly="readonly" style="background-color: white;pointer-events: none;"/>
									<div class="input-group-append">
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true">請選擇TYPE</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<button type="button" class="dropdown-item"	onclick="(function(){$('#articleType').val('Artist')})()">Artist</button>
											<button type="button" class="dropdown-item"	onclick="(function(){$('#articleType').val('Activity')})()">Activity</button>
											<button type="button" class="dropdown-item" onclick="(function(){$('#articleType').val('Performance')})()">Performance</button>
											<button type="button" class="dropdown-item" onclick="(function(){$('#articleType').val('Vender')})()">Vender</button>
											<button type="button" class="dropdown-item"	onclick="(function(){$('#articleType').val('Other')})()">Other</button>
										</div>
									</div>
								</div>
								<div></div>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="refId">REF_ID:</label> <input id="refId"
									name="refId" class="form-control form-control-user"
									placeholder="REF_ID" />
								<small class="form-text text-muted">REF_ID必須為數字</small>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="count">VIEWS:</label>
								<input id="count" name="count" class="form-control form-control-user"
									placeholder="VIEWS" value="${articleParam.count}" />
								<small class="form-text text-muted">VIEWS必須為數字</small>
							</div>
						</div>
						<button type="button" id="goToInsert"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text"> Insert New Article</span>
						</button>
						<button type="reset" id="resetinsert"
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
			<script>
				$("#goToInsert").click(function() {
					$.ajax({
						url : '/admin/article/add',
						method : 'POST',
						contentType : 'application/json;charset=UTF-8',
						dataType : 'json',
						data : $("#form1").serializeObject(),
						success : function(response) {
							if (response.type == 'SUCCESS'){
								alert("資料新增成功！\n您新增了一筆名為：" + JSON.stringify(response.data.name) + "的文章\n即將跳轉到EDIT頁面！");
								$(location).attr('href', '/admin/article/edit?id=' + response.data.id); //跳轉頁面，要看response先把我註解
							} else {
								alert("資料新增失敗！請檢查輸入欄位！");
							}
						},
						error : function(respH) {
							alert("資料新增失敗！請檢查輸入欄位！");
						}
					})
				})
				$("#name").blur(function(){
					var input = $(this).val();
					if(input.length >= 2 && input.length <= 30){
						$(this).attr("class", "form-control form-control-user is-valid");
					} else {
						$(this).attr("class", "form-control form-control-user is-invalid");
					}
				})
				$("#refId").blur(function(){
					var input = $(this).val();
					if(input.length != 0 && !isNaN(input)){
						$(this).attr("class", "form-control form-control-user is-valid")
					} else {
						$(this).attr("class", "form-control form-control-user is-invalid");
					}
				})
				$("#count").blur(function(){
					var input = $(this).val();
					if(input.length != 0 && !isNaN(input)){
						$(this).attr("class", "form-control form-control-user is-valid")
					} else {
						$(this).attr("class", "form-control form-control-user is-invalid");
					}
				})
			</script>
			<!-- 			load markdown editor.md -->
			<script src="/resources/editormd/editormd.min.js"></script>
			<script src="/resources/editormd/languages/zh-tw.js"></script>
			<script type="text/javascript">
			    $(function() {
			        var editor = editormd("test-editor", {
			            width  : "100%",
			            height : "700",
			            path   : "/resources/editormd/lib/"
			        });
			    });
			</script>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

</body>
</html>