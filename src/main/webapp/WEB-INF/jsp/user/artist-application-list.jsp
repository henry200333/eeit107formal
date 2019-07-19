<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>


<title>Insert title here</title>
</head>
	<!-- Topbar -->
<jsp:include page="../topbar.jsp"></jsp:include>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


	
			

				<!-- Begin Page Content -->
				<div class="container">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">已申請工作</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>
			
					
				<input hidden="hidden" value="<sec:authentication property="name" />" id="username">
					
					
					<div id="applicationlist" class="row"></div>


				</div>
				<!-- /.container -->

			
<%-- 			<jsp:include page="../admin/footer.jsp"></jsp:include> --%>



	</div>
	<!-- End of Page Wrapper -->

<script>
function showjobs() {

	$.ajax({
				url : "/user/job/finduserapplication/"+$("#username").val(),
				type : "GET",
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					var txt = "";
					$.each(data,function(key, obj) {
						txt += "<form class='col-sm-4 mb-0 mb-sm-0' style='padding: 5px;background:white'><div style='border: solid'><div class='col-sm-12 mb-3 mb-sm-3'><h2 class=' h3 mb-0 text-gray-800'>"
							txt += obj.job.name;
							txt += "</h2></div><div class='col-sm-12 mb-3 mb-sm-3'><label class=' h4 mb-0 text-gray-800'>店家:</label><h2 class=' h4 mb-0 text-gray-800'>";
							txt += obj.job.venderName;
							txt += "</h2></div><div class='col-sm-12 mb-3 mb-sm-3'><div class='row'><div class='col-sm-6 mb-6 mb-sm-3'><label class=' h4 mb-0 text-gray-800'>類別:</label><h2 class=' h4 mb-0 text-gray-800'>";
							txt += obj.job.jobType;
							txt += "</h2></div><div class='col-sm-6 mb-3 mb-sm-3'><label class=' h4 mb-0 text-gray-800'>薪資:</label><h4 class=' h4 mb-0 text-gray-800'>";
							txt += obj.job.reward;

							txt += "</h4></div></div></div><div class='col-sm-9 mb-3 mb-sm-6'><label class=' h4 mb-0 text-gray-800'>詳細內容:</label><textarea class='form-control' name='description'style='resize: none' readonly>";
							txt += obj.job.detal;
							txt += "</textarea></div><div class='col-sm-0 mb-3 mb-sm-6' style='text-align:right;margin-right:5%'><h2 class=' h4 mb-0 text-gray-800'>表演時間:"
							txt += obj.job.jobTime;
							txt += "</h2></div><div style='text-align:center'><input class='btn btn-primary btn-sm' id='";
							txt += obj.job.id;
							txt += "'onclick='' value='取消' readonly></div></div></form>";
						
						
					})
					$("#applicationlist").html(txt);
				}
			})

			
}
  

showjobs();
</script>
</body>
</html>