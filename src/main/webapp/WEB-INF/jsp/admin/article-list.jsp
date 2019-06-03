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
								<c:if test="${not empty articleList}">
									<form id="article" name="article" action="" method="post">
										<table class="table table-bordered table-striped table-hover"
											id="dataTable" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>ID</th>
													<th>NAME</th>
													<th>CONTENT</th>
													<th>TYPE</th>
													<th>REF_ID</th>
													<th></th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="bean" items="${articleList}">
													<tr>
														<td>${bean.id}</td>
														<td>${bean.name}</td>
														<td>${bean.content}</td>
														<td>${bean.type}</td>
														<td>${bean.refId}</td>
														<td><input type="text" id="id" name="id"
															style="display: none"> <a id="${bean.id}"
															href="javascript:document.getElementById('article').submit();"
															onclick="sendId(this)" class="btn btn-primary btn-sm"><i
																class="fas fa-edit"></i></a></td>
														<td><a id="" href="" class="btn btn-danger btn-sm"><i
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
			article.action = '/admin/article/edit';
			document.getElementById("id").value = Object.id;
			document.article.submit();
		}
	</script>
</body>
</html>