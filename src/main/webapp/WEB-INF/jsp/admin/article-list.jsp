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
						<h1 class="h3 mb-0 text-gray-800">List of Article</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Article</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Article</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
								style="font-family: 'Noto Sans TC', sans-serif;">
								<table class="table table-bordered table-striped table-hover"
									id="dataTable" width="100%" cellspacing="0">

								</table>
							</div>
						</div>
					</div>

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
					url : "/admin/article/query",
					type : "GET",
					success : function(data) {
						var table = "";
						$("#dataTable").append("<thead><tr><th>ID</th><th>NAME</th><th>CONTENT</th><th>TYPE</th><th>REF_ID</th><th>EDIT</th><th>DELE</th></tr></thead>");
						table += "<tbody>";
						$.each(data, function(key, value) {
							table += "<tr>";
							for (i in value) {
								table += "<td>" + value[i] + "</td>";
								id = Object.values(value)[0];
							}
							table += "<td><button id='" + id + "' type='button' onclick='editId(this);' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button></td>";
							table += "<td><button id='" + id + "' type='button' onclick='deleId(this);' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i></button></td>";
							table += "</tr>";
						})
						table += "</tbody>";
						$("#dataTable").append(table);
						
						$("body").append($("<script />", {
							  src: "/resources/vendor/datatables/jquery.dataTables.min.js"
							}))
						$("body").append($("<script />", {
							  src: "/resources/vendor/datatables/dataTables.bootstrap4.min.js"
							}))
						$("body").append($("<script />", {
							  src: "/resources/js/demo/datatables-demo.js"
							}))
					}
				})
	function editId(obj){
		$(location).attr('href', '/admin/article/edit?id=' + obj.id);
	}
	function deleId(obj){
		var r = confirm("確定要刪除這筆ID=" + obj.id + "的文章嗎？");
		if (r == true) {
			$.ajax({
				url : '/admin/article/delete',
				method : 'DELETE',
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				data : '{"id":"' + obj.id + '"}',
				success : function(response) {
					if (response.type == 'SUCCESS'){
						alert("資料刪除成功！\n您刪除了一筆ID為：" + response.data.id + "的文章！\n即將重新進入LIST頁面！");
						$(location).attr('href', '/admin/article/list');
					} else {
						alert("資料刪除失敗！請重新搜尋清單確保資料為最新！");
					}
				},
				error : function(respH) {
					alert("資料刪除失敗！請檢查伺服器連線！");
				}
			})
		}
	}
	</script>
</body>
</html>