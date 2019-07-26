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
						<h1 class="h3 mb-0 text-gray-800">Edit Forum</h1>

					</div>

					<!-- Return to Article -->
					<a href="/admin/forum/list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">Return to Forum</span>
					</a>

					<hr>

					<form id="forum" class="user"  method="POST">
						<div class="form-group row"
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">NAME:</label> <input type="text"
									class="form-control form-control-user" id="name" name="name"
									placeholder="NAME" value="${forumParam.userName}">
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="name">ID:</label> <input type="text"
									class="form-control form-control-user" id="id" name="id"
									value="${forumParam.id}" placeholder="系統將自動產生ID" readonly>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0"></div>
						</div>

						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="forumBoard">ForumBoard:</label> <select id="forumBoard"
									name="forumBoard">
									<option value="Activity"
										${forumParam.forumBoard=='Activity'?'selected':''}>Activity</option>
									<option value="Article"
										${forumParam.forumBoard=='Article'?'selected':''}>Article</option>
									<option value="Performance"
										${forumParam.forumBoard=='Performance'?'selected':''}>Performance</option>
								</select>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="commentDate">Date:</label> <input type="text"
									class="form-control form-control-user" id="showDate"
									name="commentDate3" placeholder="系統將自動產生Date"
									value="${forumParam.commentDate}" readonly>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="comment">COMMENT:</label>
								<textarea class="form-control" id="comment" name="comment">${forumParam.comment}</textarea>
							</div>
						</div>
						<button 
							type="button" id="editButton" class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Edit This Forum</span></button> 
						<button type="button" id="resetButton"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></button>

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
	
	<script>
	$("#editButton").click(function(){
		console.log("edit button onclick");
		var o = $("#forum").serializeObject();
		$.ajax({
			url:"/admin/forum/update",
			type:"GET",
			contentType:"application/json;charset=UTF-8",
			dataType:"json",
			data:JSON.parse(o),
			success:function(result){
				console.log("ajax return success");
				console.log(result);	
				if(result.type=="SUCCESS"){
					console.log("redirect");
					alert("資料更新成功");
				}else if(result.type=="ERROR"){
					alert("資料更新失敗");
				}else{
					alert("Ajax回應沒有設定結果");
				}
			}	
		})		
	})
	
	$("#resetButton").click(function(){
	})
	
	</script>

</body>
</html>