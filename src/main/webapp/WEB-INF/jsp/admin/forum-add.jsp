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

					<form id="form" class="user" action="/admin/forum/insert"
						method="POST">
						<div class="form-group row"
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<label for="name">NAME:</label> <input type="text"
									class="form-control form-control-user" id="name" name="name"
									placeholder="NAME" value="${forumParam.name}">
								${errorMsg.name}
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
								<label for="Board">Board:</label> <select id="board"
									name="board">
									<option value="${forumParam.board}">${forumParam.board==null?'請選擇':forumParam.board}</option>
									<option value="Ariticle">Article</option>
									<option value="Activity">Activity</option>
									<option value="Performance">Performance</option>
								</select> ${errorMsg.board}
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="commentDate">Date:</label> <input type="text"
									class="form-control form-control-user" id="showDate"
									name="showDate" placeholder="系統將自動產生Date"
									value="${forum.commentDate}" readonly>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="content">CONTENT:</label>
								<textarea class="form-control" id="content" name="content">${forumParam.content}</textarea>
								${errorMsg.content}
							</div>
						</div>
						<a id="insertButton" class="btn btn-primary btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-import"></i>
						</span> <span class="text"> Insert New Forum</span></a> <a
							href="javascript:document.getElementById('forum').reset();"
							class="btn btn-danger btn-user btn-block"><span
							class="icon text-white-50"> <i class="fas fa-file-excel"></i>
						</span> <span class="text"> Reset Input</span></a>

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
		$("#insertButton").click(function() {
			var input = $("#form").serializeArray();
			alert(JSON.stringify(input));
			var a = [];
			var o = {};
			$.each(input, function(i, filed) {
				o[filed.name] = filed.value;
			});
			a.push(o);
			var a2 = JSON.stringify(a);
			alert(a2);
			$.ajax({
				url : "/admin/forum/insert",
				type : "POST",
				contentType : "application/json",
				dataType : "text",
				data : a2,
				success : function() {
					alert(123);
					window.location.assign("/admin/forum/list");
				}

			});
		});
	</script>


</body>
</html>