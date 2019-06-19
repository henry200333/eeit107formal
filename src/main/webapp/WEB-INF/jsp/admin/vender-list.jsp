<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
						<h1 class="h3 mb-0 text-gray-800">List of Vender</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New vender</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of Vender</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
								style="font-family: 'Noto Sans TC', sans-serif;">
								<c:if test="${not empty venders}">

									<table class="table table-bordered table-striped table-hover"
										id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>id</th>
												<th>name</th>
												<th>address</th>
												<th>maxPeople</th>
												<th>phone</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="bean" items="${venders}">
												<c:url value="/admin/vender/edit" var="path">
													<c:param name="id" value="${bean.id}"></c:param>
													<c:param name="name" value="${bean.name}"></c:param>
													<c:param name="address" value="${bean.address}"></c:param>
													<c:param name="maxPeople" value="${bean.maxPeople}"></c:param>
													<c:param name="phone" value="${bean.phone}"></c:param>

												</c:url>
												<tr>
													<td class="t2">${bean.id}</td>
													<td class="t2">${bean.name}</td>
													<td class="t2">${bean.address}</td>
													<td class="t2">${bean.maxPeople}</td>
													<td class="t2">${bean.phone}</td>
													<td><a href="${path}" class="btn btn-primary btn-sm"><i
															class="fas fa-edit"></i></a></td>
													<td><a id="${bean.id}" href=""
														class="btn btn-danger btn-sm" onclick="deleteId(this)"><i
															class="fas fa-trash"></i></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<form id="vender" method="post">
										<input type="text" id="id" name="id" style="display: none">
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
		function deleteId(Object) {

			// 			document.getElementById("id").value = Object.id;
			var a2 = Object.id;
			a2 = '[{"id"=' + a2 + "}]";
			$.ajax({
				url : '/admin/vender/delete',
				type : "DELETE",
				dataType : "text",
				data : a2,
				success : function(data) {
					alert("success");
				}
			})

		}

		$
				.ajax({
					url : '/admin/vender/query',
					type : "POST",
					success : function(data) {
						var txt = "";
						$
								.each(
										data,
										function(key, obj) {
											txt += "<tr>";
											for (i in obj) {

												txt += "<td>" + obj[i]
														+ "</td>";
											}

											txt += '<td><a  href="${path}" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a></td>';
											txt += '<td><a id='+obj[1]+'href="" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a></td>';
											txt += "</tr>";
										})
						$("#tbody").append(txt);
					}
				})
	</script>