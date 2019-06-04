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
				<div class="container-fluid" style="font-family: 'Noto Sans TC', sans-serif;">

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

					<form:form modelAttribute="article" class="user"
						action="/admin/article/insert" method="POST">
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="name">ID:</label> <input id="id" name="id"
									class="form-control form-control-user" placeholder="系統將自動產生ID"
									readonly>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">NAME:</label>
								<form:input path="name" class="form-control form-control-user"
									placeholder="NAME" value="${articleParam.name}"
									onblur="checkName()" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<form:errors path="name"></form:errors>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="content">CONTENT:</label>
								<form:textarea path="content" class="form-control"></form:textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="type">TYPE:</label>
								<form:input path="type" class="form-control form-control-user"
									placeholder="TYPE" value="${articleParam.type}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<form:errors path="type"></form:errors>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="refId">REF_ID:</label>
								<form:input path="refId" class="form-control form-control-user"
									placeholder="REF_ID" value="${articleParam.refId}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<form:errors path="refId"></form:errors>
							</div>
						</div>
						<a href="javascript:document.getElementById('article').submit();"
							class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Insert New Article</span></a>
						<a href="javascript:document.getElementById('article').reset();"
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