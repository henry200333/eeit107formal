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
						</div></div>
					<div id="joblist" ></div>






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
function   showjobs(){
// alert("${venderparam}");  	 	
$.ajax({url : "/admin/vender/findjobs/?id=${venderparam.id}",
			type : "POST",
			success : function(data) {
				var txt = "";
				$.each(data,function(key, obj) {
									txt +="<div style='border:solid;margin:10px'><div class='form-group row' style=";
									txt +='"font-family: ';
									txt +="'Noto Sans TC'";
									txt +=', sans-serif;"';
									txt +="><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h1 mb-0 text-gray-800'>";
									txt +=obj.name;
									txt +="</h2></div><div class='col-sm-6 mb-3 mb-sm-0'><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h3 mb-0 text-gray-800'>類別:";
									
									txt += obj.jobType;
									txt +="</h2></div><div class='col-sm-6 mb-3 mb-sm-6'><h4 class=' h3 mb-0 text-gray-800'>薪資:";
									txt +=obj.reward;

									txt +="</h4></div></div><div class='col-sm-9 mb-3 mb-sm-6'><label class=' h4 mb-0 text-gray-800'>詳細內容:</label><textarea class='form-control' name='description' style='resize:none'>";
									txt +=obj.detal;
									txt +="</textarea></div><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h2 mb-0 text-gray-800'>表演時間:";
									txt +=obj.jobTime;
									txt +="</h2></div></div></div>";
										
										
										
										
								})

				$("#joblist").append(txt);

			}
		})
}


showjobs();
</script>


	
</html>