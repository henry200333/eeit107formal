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
						<h1 class="h3 mb-0 text-gray-800">List of Artist</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Artist</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of Artist</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form id="artist" name="artist" method="post">
									<input type="text" id="id" name="id" style="display: none">
									<table class="table table-bordered table-striped table-hover"
										id="dataTable" width="100%" cellspacing="0">
									</table>
								</form>
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
		$
				.ajax({
					url : "query",
					type : "GET",
					success : function(data) {
						var txt = "<tr><th>Id</th><th>Name</th><th>Fan_Number</th><th>Location</th></tr>";
						$("#dataTable").html(txt);
						query(data);
					}
				});

		function query(data) {
			var txt2 = "";
			$
					.each(
							data,
							function(index, value) {
								txt2 += "<tr>";
								for (i in value) {
									txt2 += "<td>" + value[i] + "</td>";
									var id = value['id'];
								}
								txt2 += "<td><a id="
										+ "'"
										+ id
										+ "'"
										+ "href='' onclick='sendId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></a></td>";
								txt2 += "<td><a id="
										+ "'"
										+ id
										+ "'"
										+ 'href="" onclick="deleId(this);return false" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a></td>';
								txt2 += "</tr>"
							});
			$("#dataTable").append(txt2);
		}

		function sendId(Object) {
			$("#artist").attr("action", '/admin/artist/edit');
			$("#id").val(Object.id);
			$('#artist').submit();
		}
		function deleId(Object) {
			$("#artist").attr("action", '/admin/artist/delete');
			$("#id").val(Object.id);
			$('#artist').submit();
		}
	</script>
</body>
</html>