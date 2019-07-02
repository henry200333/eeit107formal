<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<!-- Load basic css of Grid -->
<link rel="stylesheet" type="text/css" href="/resources/jqgrid/css/ui.jqgrid-bootstrap4.css" />
<!-- Load jquery-ui css -->
<link rel="stylesheet" type="text/css" href="/resources/jqgrid/jquery-ui/jquery-ui.theme.min.css"/>




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
						<h1 class="h3 mb-0 text-gray-800">List of Vender</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New vender</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of Vender</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
								style="font-family: 'Noto Sans TC', sans-serif;"></div>
						</div>
					

				</div>
				<!-- /.container-fluid -->
				<table class="table table-bordered table-striped table-hover"
					id="dataTable" width="100%" cellspacing="0">

					<thead>
						<tr>
							<th>id</th>
							<th>name</th>
							<th>address</th>
							<th>maxPeople</th>
							<th>phone</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
			
				<form id="vender" method="post">
					<input type="text" id="id" name="id" style="display: none">
				</form>
					<a href="maptest" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">maptest</span></a>
			</div>
			<!-- End of Main Content -->
		</div>
			<jsp:include page="footer.jsp"></jsp:include>

		</div>
		<!-- End of Content Wrapper -->

	</div>
</body>
<!-- End of Page Wrapper -->


	<!-- 	Add language package for TW-ZH -->
	<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js" type="text/javascript"></script>
	<!-- 	Add jquery plugin -->
	<script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script>
	function deleteId(Object) {
		document.getElementById("id").value = Object.id;

		// 			var a2 = $("vender").serializeObject();
		alert($("#vender").serializeObject());

		$.ajax({
			url : '/admin/vender/delete',
			type : "DELETE",
			dataType : "json",
			contentType : "application/json",
			data : $("#vender").serializeObject(),
			success : function(data) {
				alert(data.id+"號資料刪除成功")
				window.location.assign("/admin/vender/list");
				
			}
		})

	}

	$.ajax({url : "/admin/vender/query?name=&type=&page=1&rows=20",
				type : "POST",
				success : function(data) {
					var txt = "";
					$.each(data,function(key, obj) {
										txt += "<tr>";
										for (i in obj) {
										txt += "<td>" + obj[i] + "</td>";
										}

										txt += '<td><button  href="${path}" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button></td>';
										txt += '<td><button id='
												+ obj["id"]
												+ ' class="btn btn-danger btn-sm" onclick="deleteId(this)"><i class="fas fa-trash"></i></button></td>';
										txt += "</tr>";
									})

					$("#tbody").append(txt);

				}
			})
</script>
</html>