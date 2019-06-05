<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<body>
<jsp:include page="nav.jsp"></jsp:include>	
	<c:if test="${not empty performances}">
		<table>
			<thead>
				<tr>
					<caption>Performance</caption>
				</tr>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>YOUTUBE_URL</th>
					<th>UPDATE_TIME</th>
					<th>ACTIVITY_ID</th>
					<th>UPDATE</th><th class="t2">DELETE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${performances}">
					<tr>
						<td>${bean.id}</td>
						<td>${bean.name}</td>
						<td>${bean.url}</td>
						<td>${bean.updateTime}</td>
						<td>${bean.activityId}</td>
						<td><button   class="up"  type="button" onclick="javascript:location.href='update?id=${bean.id}&name=${bean.name }&url=${bean.url }&updateTime=${bean.updateTime }&activityId=${bean.activityId }'" >update</button></td>
						<td><button class="de" >delete</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

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
						<h1 class="h3 mb-0 text-gray-800">List of Performance</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split" style="background-color: #66009D;border: 1px solid #66009D;"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Performance</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Performance</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<c:if test="${not empty performances}">
								<form id="performance" name="performance" action="" method="post">
									<table  class="table table-bordered table-striped table-hover"
										id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>YOUTUBE_URL</th>
												<th>UPDATE_TIME</th>
												<th>ACTIVITY_ID</th>
												<th>UPDATE</th>
												<th class="t2">DELETE</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="bean" items="${performances}">
												<tr>
													<td>${bean.id}</td>
													<td>${bean.name}</td>
													<td>${bean.url}</td>
													<td>${bean.updateTime}</td>
													<td>${bean.activityId}</td>
													<td><input type="text" id="id" name="id"
															style="display: none"><a id="${bean.id}" href="javascript:document.getElementById('performance').submit();"
															onclick="sendId(this)" class="btn btn-primary btn-sm"><i
																class="fas fa-edit"></i></a></td>
													<td><a href="" class="btn btn-danger btn-sm"><i
															class="fas fa-trash"></i></a></td>
												</tr>
											</c:forEach>
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
		function sendId(Object) {
			article.action = '/admin/performance/edit';
			document.getElementById("id").value = Object.id;
		}
		function deleId(Object) {
			article.action = '/admin/performance/delete';
			document.getElementById("id").value = Object.id;
		}
	</script>
</body>
</html>