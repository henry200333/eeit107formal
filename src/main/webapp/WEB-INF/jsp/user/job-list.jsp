<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>

	<!-- Topbar -->
				<jsp:include page="../topbar.jsp"></jsp:include>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

			

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">List of Jobs</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>
					<hr>
					<form style='border: solid; margin: 10px' id='job1'>
						<div class='form-group row'
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class='col-sm-6 mb-3 mb-sm-6'>
								<h2 class=' h1 mb-0 text-gray-800'>obj.name</h2>
							</div>
							<div class='col-sm-3 mb-3 mb-sm-0'>
								<div class='col-sm-12 mb-3 mb-sm-3'>
									<h2 class=' h3 mb-0 text-gray-800'>類別:obj.jobType</h2>
								</div>
								<div class='col-sm-12 mb-3 mb-sm-3'>
									<h4 class=' h3 mb-0 text-gray-800'>薪資:obj.reward</h4>
								</div>
							</div>
							<div class='col-sm-3 mb-3 mb-sm-0'>
								<input class='btn btn-primary btn-sm' id='1'
									onclick='join(this)' value='我想參加' readonly>
							</div>
							<div class='col-sm-9 mb-3 mb-sm-6'>
								<label class=' h4 mb-0 text-gray-800'>詳細內容:</label>
								<textarea class='form-control' name='description'
									style='resize: none'>obj.detal</textarea>
							</div>
							<div class='col-sm-6 mb-3 mb-sm-6'>
								<h2 class=' h2 mb-0 text-gray-800'>表演時間:obj.jobTime</h2>
							</div>
						</div>
					</form>
					
				<input hidden="hidden" value="<sec:authentication property="name" />" id="username">
					
					
					<div id="joblist"></div>


				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

<%-- 			<jsp:include page="../admin/footer.jsp"></jsp:include> --%>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


	<script>

	
		function join(object) {
	
			
			$.ajax({
				url : "/user/job/addapplication?jobid="+object.id+"&username="+$("#username").val(),
				type : "GET",
				success : function(data){
					alert(data.mes)
				}
			});
		};
		
	
		function showjobs() {
			// alert("${venderparam}");  	 	
				
			$.ajax({
						url : "/user/job/query?page=2",
						type : "GET",
						success : function(data) {
							var txt = "";
							$.each(data.rows,function(key, obj) {
												txt += "<form style='border:solid;margin:10px;padding:10px' ><div class='form-group row' style=";
										txt +='"font-family: ';
										txt +="'Noto Sans TC'";
										txt +=', sans-serif;"';
										txt +="><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h1 mb-0 text-gray-800'>";
												txt += obj.name;
												txt += "</h2></div><div class='col-sm-3 mb-3 mb-sm-0'><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h3 mb-0 text-gray-800'>類別:";

												txt += obj.jobType;
												txt += "</h2></div><div class='col-sm-12 mb-3 mb-sm-3'><h4 class=' h3 mb-0 text-gray-800'>薪資:";
												txt += obj.reward;

												txt += "</h4></div></div><div class='col-sm-3 mb-3 mb-sm-0'><input class='btn btn-primary btn-sm' id='";
												txt += obj.id
												txt += "'onclick='join(this)' value='我想參加' readonly></div><div class='col-sm-9 mb-3 mb-sm-6'><label class=' h4 mb-0 text-gray-800'>詳細內容:</label><textarea class='form-control' name='description' style='resize: none'>"
												txt += obj.detal;
												txt += "</textarea></div><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h2 mb-0 text-gray-800'>表演時間:";
												txt += obj.jobTime;
												txt += "</h2></div></div></form>";

												
											/*				<form style='border: solid; margin: 10px'><div class='form-group row'style=
												"font-family: 
													'Noto Sans TC'
													, sans-serif;"
													><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h1 mb-0 text-gray-800'>
													obj.name
													</h2></div><div class='col-sm-3 mb-3 mb-sm-0'><div class='col-sm-12 mb-3 mb-sm-3'><h2 class=' h3 mb-0 text-gray-800'>類別:
														obj.jobType
														</h2></div><div class='col-sm-12 mb-3 mb-sm-3'><h4 class=' h3 mb-0 text-gray-800'>薪資:
															obj.reward
															</h4></div></div><div class='col-sm-3 mb-3 mb-sm-0'><input class='btn btn-primary btn-sm' id='
															obj.id
															'onclick='join(this)' value='我想參加' readonly></div><div class='col-sm-9 mb-3 mb-sm-6'><label class=' h4 mb-0 text-gray-800'>詳細內容:</label><textarea class='form-control' name='description' style='resize: none'>
															obj.detal
															</textarea></div><div class='col-sm-6 mb-3 mb-sm-6'><h2 class=' h2 mb-0 text-gray-800'>表演時間:
															obj.jobTime
															</h2></div></div></form>  */ 	
												
												
												
												
											})

							$("#joblist").append(txt);

						}
					})
		}

		showjobs();
	</script>
</body>
</html>