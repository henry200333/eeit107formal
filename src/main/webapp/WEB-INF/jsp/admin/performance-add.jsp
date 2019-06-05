<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
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
						<h1 class="h3 mb-0 text-gray-800">Add New Performance</h1>

					</div>

					<!-- Return to Article -->
					<a href="list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to List</span>
					</a>

					<hr>

					<form:form modelAttribute="performance" class="user"
						action="/admin/performance/insert" method="POST">
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<form:input path="name" class="form-control form-control-user"
									placeholder="NAME" value=""	onblur="checkName()" />
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="context">URL:</label>
								 <form:input path="url" class="form-control form-control-user"
									placeholder="URL" value="" />
									
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-7 mb-3 mb-sm-0">
								<label for="type">Related activities:</label>
								<form:input path="activityId" class="form-control form-control-user"
									placeholder="ACTIVITYID" value="" />
								<datalist id = "activityselect">
									<option value="123">									
								</datalist>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<a href="javascript:document.getElementById('performance').submit();" 
								class="btn btn-primary btn-user btn-block"><span
									class="icon text-white-50"> <i
										class="fas fa-file-import"></i>
								</span> <span class="text">OK</span></a>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<a href="javascript:document.getElementById('performance').reset();" 
								class="btn btn-danger btn-user btn-block"><span
									class="icon text-white-50"> <i class="fas fa-file-excel"></i>
								</span> <span class="text"> Reset</span></a>
							</div>
						</div>

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