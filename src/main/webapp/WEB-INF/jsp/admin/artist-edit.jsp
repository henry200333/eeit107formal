<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
						<h1 class="h3 mb-0 text-gray-800">Edit New Artist</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Artist</span>
					</a>

					<hr>

					<form:form modelAttribute="artist" class="user"
						action="/admin/artist/update" method="POST">
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="id">Id:</label>
								<form:input path="id" class="form-control form-control-user"
									readonly value="${artistParam.id}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<form:errors path="name"></form:errors>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">Name:</label>
								<form:input path="name" class="form-control form-control-user"
									placeholder="ex:Peter" value="${artistParam.name}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<form:errors path="name"></form:errors>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="fanNumber">Fan_Number:</label>
								<form:input path="fanNumber"
									class="form-control form-control-user" placeholder="ex:30678"
									value="${artistParam.fanNumber}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<form:errors path="fanNumber"></form:errors>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">Location:</label>
								<form:input path="location"
									class="form-control form-control-user" placeholder="ex:Taipei"
									value="${artistParam.location}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<form:errors path="location"></form:errors>
							</div>
						</div>
						<a href="javascript:document.getElementById('artist').submit();"
							class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Edit This Artist</span></a>
						<a href="javascript:document.getElementById('artist').reset();"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></a>

					</form:form>
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