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
						<h1 class="h3 mb-0 text-gray-800">List of Activity</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Activity Button -->
					<form class="user">
			            <div class="form-group row">
				            <div class="col-sm-3 mb-3 mb-sm-0">
				            	<a href="add" class="btn btn-primary btn-icon-split"> <span
									class="icon text-white-50"> <i class="fas fa-file-medical"></i>
									</span> <span class="text">Add New Activity</span>
								</a>
				            </div>
				            <div class="col-sm-3 mb-3 mb-sm-0">
					            <div class="input-group">
					              <input id="search" name="search" type="text" class="form-control border-0 small" placeholder="搜尋活動..." aria-label="Search" aria-describedby="basic-addon2">
					              <div class="input-group-append">
					                <button id="searchBT" class="btn btn-primary" type="button">
					                  <i class="fas fa-search fa-sm"></i>
					                </button>
					              </div>
					            </div>
				            </div>
			            </div>
			        </form>
					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Activity</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"></div>
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
			url : "/admin/activity/query",
			type : "GET",
			success : function(data) {
				var txt = "";
				txt += "<table class='table table-bordered table-striped table-hover'	id='dataTable' width='100%' cellspacing='0'><thead><tr><th>ID</th><th>Name</th><th>Artist</th><th>Description</th><th>Begin time</th><th>End time</th><th>AwesomeNum</th><th>BadNum</th><th>CoverImage</th><th>Edit</th><th>Delete</th></tr></thead><tbody>";
				$.each(data,function(index, value) {
						txt += "<tr>";
						for (i in value) {
							txt += "<td>" + value[i] + "</td>";
							id = Object.values(value)[0];
						}
						txt += "<td><a id=" + "'" + id + "'" + "href='' onclick='editId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></a></td>";
						txt += "<td><a id=" + "'" + id + "'" + 'href="" onclick="deleId(this);return false" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a></td>';
						txt += "</tr>";
				})
						txt += "</tbody></table>";
						$("div.table-responsive").append(txt);
						tableRefresh();
					}
				})

		function editId(obj) {
			$(location).attr('href', '/admin/activity/edit?id=' + obj.id);
		}
		function deleId(obj) {
			var r = confirm("確定要刪除這筆ID=" + obj.id + "的資料嗎？");
			if (r == true) {
				$.ajax({
					url : '/admin/activity/delete',
					method : 'DELETE',
					contentType : 'application/json;charset=UTF-8',
					dataType : 'json',
					data : '{"id":"' + obj.id + '"}',
					success : function(response) {
						if (response.type == 'SUCCESS') {
							alert("資料刪除成功！\n您刪除了一筆ID為：" + response.data.id
									+ "的資料！\n即將重新進入LIST頁面！");
							$(location).attr('href', '/admin/activity/list');
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
		
		$("#searchBT").click(function(){
			$.ajax({
				url : "/admin/activity/query?search=" + $("#search").val(),
				type : "GET",
				success : function(data) {
					var txt = "";
					txt += "<table class='table table-bordered table-striped table-hover'	id='dataTable' width='100%' cellspacing='0'><thead><tr><th>ID</th><th>Name</th><th>Artist</th><th>Description</th><th>Begin time</th><th>End time</th><th>AwesomeNum</th><th>BadNum</th><th>CoverImage</th><th>Edit</th><th>Delete</th></tr></thead><tbody>";
					$
							.each(
									data,
									function(index, value) {
										txt += "<tr>";
										for (i in value) {
											txt += "<td>" + value[i]
													+ "</td>";
											id = Object.values(value)[0];
										}
										txt += "<td><a id="
												+ "'"
												+ id
												+ "'"
												+ "href='' onclick='editId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></a></td>";
										txt += "<td><a id="
												+ "'"
												+ id
												+ "'"
												+ 'href="" onclick="deleId(this);return false" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a></td>';
										txt += "</tr>";
									})
					txt += "</tbody></table>";
					$("div.table-responsive").append(txt);
					tableRefresh();
				}
			})
		})
	</script>

</body>
</html>