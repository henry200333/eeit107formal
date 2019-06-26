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
					<form id="form" class="user" method="POST">
						<div class="form-group row"
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="userName">NAME:</label> <input type="text"
									class="form-control form-control-user" id="userName" name="userName"
									placeholder="NAME" value="">
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="id">ID:</label> <input type="text"
									class="form-control form-control-user" id="id" name="id"
									value="" placeholder="系統將自動產生ID" readonly>
							</div>
							<div class="col-sm-6 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="board">Board:</label> <select id="board"
									name="board" class="form-control">
									<option value="Ariticle">Article</option>
									<option value="Activity">Activity</option>
									<option value="Performance">Performance</option>
								</select> <span class="errorMessage" id="eBoard" style="color: red"></span>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="commentDate">Date:</label> <input type="text"
									class="form-control form-control-user" id="showDate"
									name="showDate" placeholder="系統將自動產生Date" value="" readonly>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="comment">COMMENT:</label>
								<textarea class="form-control" id="comment" name="comment"></textarea>
								<span class="errorMessage" id="eComment" style="color: red"></span>
							</div>
						</div>
						<button type="button" id="insertButton"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text"> Insert New Forum</span>
						</button>
						<a href="javascript:document.getElementById('forum').reset();"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></a>
					</form>
					<div id="errorSpace"></div>
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
		$("#insertButton").click(function() {
			console.log($("#form").serializeObject());			
			$.ajax({
				url : "/admin/forum",
				type : "POST",
				contentType : "application/json",
				dataType : "json",
				data : $("#form").serializeObject(),
				success : function(result) {
					console.log("enter success");
					
					if (result.type=="SUCCESS") {
						$("#form").attr("action",'/admin/forum/edit');
						$("#id").val(result.data["id"]);
						$('#form').submit();
					} else if(result.type=="ERROR"){					
						alert("新增失敗，請檢查輸入");
						var messages = result.messages;
						$.each(messages,function(index,value){
							console.log(value);
							console.log(value.title);
							$("#"+value.title).after("<span>"+value.content+"</span>");
						})
					}
				}
			});
		});
		
		$("#name").blur(function(){
			console.log($(this).val());
			if($(this).val()!=null&&$(this).val()!=""){
				console.log("name輸入檢查通過");
				$(this).next("span").remove();
			}
		})
	
		$("#comment").blur(function() {
			console.log($(this).val());
			if ($(this).val() != null && $(this).val() != "") {
				console.log("comment輸入檢查通過");
				$(this).next("span").remove();
			}
		})
	</script>
</body>
</html>