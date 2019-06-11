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

					<form id="article" name="article" class="user"
						action="/admin/article/insert" method="POST">
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="name">ID:</label> <input id="id" name="id"
									class="form-control form-control-user" placeholder="系統將自動產生ID"
									readonly>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">NAME:</label> <input id="name" name="name"
									class="form-control form-control-user" placeholder="NAME" />
								<div></div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="content">CONTENT:</label>
								<textarea id="content" name="content" class="form-control"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="type">TYPE:</label>
								<div class=" input-group">
									<input type="text" id="type" name="type" class="form-control" />
									<div class="input-group-append">
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true">選擇TYPE</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="javascript:return false;"
												onclick="selectArtist()">Artist</a> <a class="dropdown-item"
												href="javascript:return false;" onclick="selectActivity()">Activity</a>
											<a class="dropdown-item" href="javascript:return false;"
												onclick="selectPerformance()">Performance</a> <a
												class="dropdown-item" href="javascript:return false;"
												onclick="selectVender()">Article</a> <a
												class="dropdown-item" href="javascript:return false;"
												onclick="selectOther()">Other</a>
										</div>
									</div>
								</div>
								<div></div>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="refId">REF_ID:</label> <input id="refId"
									name="refId" class="form-control form-control-user"
									placeholder="REF_ID" />
								<div></div>
							</div>

						</div>
						<a href="#" id="gotoinsert"
							class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Insert New Article</span></a> <a
							href="javascript:document.getElementById('article').reset();"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></a>

					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp"></jsp:include>
			<script>
				function selectArtist() {
					$("#type").val("Artist");
				}
				function selectActivity() {
					$("#type").val("Activity");
				}
				function selectPerformance() {
					$("#type").val("Performance");
				}
				function selectVender() {
					$("#type").val("Vender");
				}
				function selectOther() {
					$("#type").val("Other");
				}
			</script>
			<script>
				$("#gotoinsert").click(function() {
					console.info($('#article').serializeArray())
					$.ajax({
						method : 'post',
						url : '/admin/article/insert',
						dataType : 'json',
						data : $('#article').serializeArray(),
						success : function(data) {
						}
					})
				})
			</script>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

</body>
</html>