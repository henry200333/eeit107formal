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

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Activity</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Activity</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<c:if test="${not empty activityList}">
									<form id="activity" name="activity" action="" method="post">
									<table class="table table-bordered table-striped table-hover"
										id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>Artist</th>
												<th>Description</th>
												<th>Begin time</th>
												<th>End time</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody id='tbody'>
											
										</tbody>
									</table>
									</form>
								</c:if>
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
			url:"query",
			type:"POST",
			success:function(data){
				var txt = "";
				$.each(data,function(index,value){
					txt += "<tr>";
					for(i in value){
						txt += "<td>"+ value[i]+ "</td>";
					}
					txt +="<td><a  href='' class='btn btn-primary btn-sm'><i	class='fas fa-edit' id='edit'></i></a></td><td><a id='delete' href='' class='btn btn-danger btn-sm'	onclick='delete'><i class='fas fa-trash'></i></a></td></tr>";	
				})
				$("#tbody").html(txt);
			}
		})

		
	</script>
</body>
</html>