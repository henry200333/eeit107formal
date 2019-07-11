<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<%-- <jsp:include page="sidebar.jsp"></jsp:include> --%>


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
						<h1 class="h3 mb-0 text-gray-800">${venderparam.name}</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

						<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h3 class="m-0 font-weight-bold text-primary">近期職缺</h3>
						</div>
	
				
				
					<table class="table table-bordered table-striped table-hover"
					id="dataTable" width="100%" cellspacing="0">

					<tbody id="tbody"></tbody>
				</table>

					<hr>

				

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

<jsp:include page="footer.jsp"></jsp:include>

<script>
function   aa(){
alert("${venderparam}");
$.ajax({url : "/admin/job/findjobs/?id=${venderparam.id}",
			type : "POST",
			success : function(data) {
				var txt = "";
				$.each(data,function(key, obj) {
// 									alert(obj)
									txt += "<tr>";
									for (i in obj) {
									txt += "<td>" + obj[i] + "</td>";
									};
// 									txt += '<td><button  href="${path}" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button></td>';
// 									txt += '<td><button id='
// 											+ obj["id"]
// 											+ ' class="btn btn-danger btn-sm" onclick="deleteId(this)"><i class="fas fa-trash"></i></button></td>';
									txt += "</tr>";
								})

				$("#tbody").append(txt);

			}
		})
}


aa();
</script>


	
</html>