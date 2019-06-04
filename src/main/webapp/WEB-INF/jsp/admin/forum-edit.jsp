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
						<h1 class="h3 mb-0 text-gray-800">Add New Forum</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Forum</span>
					</a>

					<hr>

					<form class="user" id="editForum" name="editForum"
						action="/admin/forum/list" method="POST">
						<div class="form-group row"
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">NAME:</label> <input type="text"
									class="form-control form-control-user" id="name" name="name"
									placeholder="NAME" value="${param.name}">
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="name">ID:</label> <input type="text"
									class="form-control form-control-user" id="id" name="id"
									value="${param.id}" placeholder="系統將自動產生ID" readonly>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0"></div>
						</div>

						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="Board">Board:</label> <select id="Board"
									name="Board">
									<option value="Activity"
										${param.board=='Activity'?'selected':''}>Activity</option>
									<option value="Ariticle"
										${param.board=='Ariticle'?'selected':''}>Article</option>
									<option value="Performance"
										${param.board=='Performance'?'selected':''}>Performance</option>
								</select>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="commentDate">Date:</label> <input type="text"
									class="form-control form-control-user" id="commentDate"
									name="commentDate" placeholder="系統將自動產生Date"
									value="${param.commentDate}" readonly>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="content">CONTENT:</label>
								<textarea class="form-control" id="content" name="content">${param.content}</textarea>
							</div>
						</div>
						<a href="javascript:document.getElementById('editForum').submit();"
							class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Edit This Forum</span></a> <a
							href="javascript:document.getElementById('editForum').reset();"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></a>

					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp"></jsp:include>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

</body>
</html>