<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
						<h1 class="h3 mb-0 text-gray-800">List of Forum</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Forum</span>
					</a>
					<form id="searchData">
					<select id="board" name="board">
						<option value="Performance">Performance</option>
						<option value="Activity">Activity</option>
						<option value="Ariticle">Ariticle</option>
					</select>
					<button type="button" id="searchButton">S</button>
					</form>
					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of Forum</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered table-striped table-hover"
									id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>board</th>
											<th>name</th>
											<th>comment</th>
											<th>commentDate</th>
											<th>EDIT</th>
											<th>DELETE</th>
										</tr>
									</thead>
									<tbody id="tbody">
									</tbody>
								</table>
							</div>
							<form id="forum" method="post">
									<input type="text" id="id" name="id" style="display: none">
							</form>
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
	<fmt:setTimeZone value="GMT-8" />
	<script>
		$(function() {
			$.ajax({
				url : "query",
				type : "GET",
				dataType:"json",
				success : function(data) {
					console.log("enter success");
					showNames(data);
					console.log(data);
				}
			})
		})

		function showNames(data) {
			console.log("enter showdata1");
			var txt = "";
			var id="";
			$.each(data, function(index, value) {
				txt += "<tr>";
				for (i in value) {
					txt += "<td>" + value[i] + "</td>";
					id=Object.values(value)[0];
				}
				txt += "<td><button type='button' id=" +"'"+ id  +"'" + "onclick='sendId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button></td>";
				txt += "<td><button type='button' id="+"'"+ id + "'" + 'onclick="deleId(this);return false" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button></td>';
				txt+= "</tr>";
			})
			$("#tbody").html(txt);
		}
		
		function sendId(Object) {
			$("#forum").attr("action",'/admin/forum/edit');
			$("#id").val(Object.id);
			$('#forum').submit();
		}
		function deleId(Object) {
			$("#forum").attr("action",'/admin/forum/delete');
			$("#id").val(Object.id);
			$('#forum').submit();
		}
		
		$("#searchButton").click(function(){
			$.ajax({
				url:"/admin/forum/search",
				type : "POST",
				contentType : "application/json",
				dataType : "json",
				data : $("#searchData").serializeObject() ,
				success : function(data) {
					console.log("55688");
					showNames(data);
					console.log(data);
				},
				error:function(){
					console.log("error");
				}
			})
		})
			
	</script>

</body>
</html>