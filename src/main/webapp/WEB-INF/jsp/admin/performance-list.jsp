<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<style>
.likeauto {
	content: url("/resources/admin-bootstrap/img/likeAuto.gif");
	width:100px;
}

.unlikeauto {
	content: url("/resources/admin-bootstrap/img/unlikeAuto.gif");
	margin-top:33px;
	width:100px;
}

.like	{
	content: url("/resources/admin-bootstrap/img/like.gif");
	width:100px;
}

.unlike	{
	content: url("/resources/admin-bootstrap/img/unlike.gif");
	width:100px;
}
</style>
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
						<h1 class="h3 mb-0 text-gray-800">List of Performance</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Performance</span>

					</a> <br> <br> Search for: <input type="text" id="search"
						oninput="searchp()" />
					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Performance</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
								style="font-family: 'Noto Sans TC', sans-serif;">


								<table class="table table-bordered table-striped table-hover"
									id="dataTable" width="100%" cellspacing="0">


								</table>
								<script
									src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
								<script>
									$.ajax({
										url : "/admin/performance/query",
										type : "GET",
										success : function(data) {
											showNames(data);
										}
									})
								</script>

							</div>
							<form id="send" method="post">
								<input type="hidden" id="sendid" name="id" />
							</form>

						</div>
					</div>

					<a href="/user/login"><button type="button"
							class="btn btn-primary btn-user btn-block">請點我到登入頁面</button></a> <br>
					<button type="button" id="vdeo"
						class="btn btn-primary btn-user btn-block">點我預覽影片排版</button>
					<hr>
					<div id="wrapper"></div>
					<hr>
					<!-- /.container-fluid -->
					<div id='like'>



					</div>
					<!-- End of Main Content -->

					<jsp:include page="footer.jsp"></jsp:include>

				</div>
				<!-- End of Content Wrapper -->

			</div>
			<!-- End of Page Wrapper -->
		</div>
	</div>
	<script>
		function searchp() {
			var search = $("#search").val();
			$.ajax({
				url : "/admin/performance/search",
				type : "GET",
				data : {
					"search" : search
				},
				success : function(data) {
					$("#dataTable").html("");
					$("div#dataTable_length").remove();
					$("div#dataTable_filter").remove();
					$("div#dataTable_info").remove();
					$("div#dataTable_paginate").remove();
					showNames(data);

					$("td.datap").html(
							function() {
								return $(this).html().replace(
										search,
										"<font color=\"red\">" + search
												+ "</font>");
							});
				}
			})
		}

		function showNames(data) {
			var txt1 = "<thead>";
			var txt2 = "<tbody>";
			var keys = Object.keys(data[0]);
			for (i in keys) {
				if (i == 2) {
					console.log(keys[i]);
					continue;
				}
				txt1 += "<th>" + keys[i] + "</th>";

			}

			$
					.each(
							data,
							function(index, value) {

								txt2 += "<tr>"
								for (i in value) {

									if (i == "introduction") {
										console.log(value[i]);
										continue;
									}

									txt2 += "<td class='datap'>" + value[i]
											+ "</td>";
									var id = value['id'];
								}
								txt2 += "<td><button type='button' id='"
										+ id
										+ "' href='' onclick='sendId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button></td>";
								txt2 += "<td><button type='button' id='"
										+ id
										+ "' href='' onclick='deleId(this);return false' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i></button></td>";
								txt2 += "</tr>";

							})
			txt1 += "<th>UPDATE</th><th>DELETE</th>";
			txt1 += "</thead>";
			txt2 += "</tbody>";
			$("#dataTable").append(txt1);
			$("#dataTable").append(txt2);
			tableRefresh();
		}

		function sendId(Object) {
			console.log("id=" + Object.id);
			$("#send").attr("action", "/admin/performance/edit");
			$("#sendid").val(Object.id);
			$('#send').submit();
		}
		function deleId(Object) {
			$("#send").attr("action", "/admin/performance/delete");
			$("#sendid").val(Object.id);
			$('#send').submit();
		}


		$.ajax({
			url : "/admin/performance/query",
			type : "GET",
			success : function(data) {
				console.log(data);
				//https://www.youtube.com/embed/Lhel0tzHE08
				//https://www.youtube.com/watch?v=Lhel0tzHE08
				$.each(data,function(index,value){
					var txt="影片: "+value['id']+"<img class='likeauto' id='like"+value['id']+"' onclick='like(this)'><span id='like"+value['id']+"'>"+value['likes']+"</span><img class='unlikeauto' id='unlike"+ value['id']+"' onclick='unlike(this)'><span id='unlike"+value['id']+"'>"+value['unlikes']+"</span><br><br>";
					$("#like").append(txt);
					console.log(txt);
					});
				}
		});
		
	
		function like(Object) {
			if (Object.className == "likeauto") {
				$("img#" + Object.id).attr("class", "like");
				var unlike = $("img#un" + Object.id).attr("class");
				var unlikeType = 0;
				var id = Object.id.substring(4);
				console.log("喜歡/不喜歡ID為" + id + "的資料");
				if (unlike == "unlike") {
					unlikeType = 1;
					$("img#un" + Object.id).attr("class", "unlikeauto");
				}

				$.ajax({
					url : "/admin/performance/like",
					type : "POST",
					data : {
						"id" : id,
						"unlikeType" : unlikeType
					},
					success : function(data) {
						var likes = data.likes;
						var unlikes = data.unlikes;
						$("span#like" + data.id).html(likes);
						$("span#unlike" + data.id).html(unlikes);
					}

				});
			}else{
				var id = Object.id.substring(4);
				$.ajax({
					url : "/admin/performance/like",
					type : "POST",
					data : {
						"id" : id,
						"unlikeType" : 2,
					},
					success : function(data) {
						var likes = data.likes;
						var unlikes = data.unlikes;
						$("span#like" + data.id).html(likes);
						$("span#unlike" + data.id).html(unlikes);
						$("img#" + Object.id).attr("class", "likeauto");
					}

				});
			}
		}

		function unlike(Object) {
			if(Object.className == "unlikeauto"){
				$("img#" + Object.id).attr("class", "unlike");
				var like = Object.id.substring(2);
				var likeType = 0 ;
				var id = Object.id.substring(6);
				var likenew = $("img#" + like).attr("class");
				if (likenew == "like") {
					likeType=1;
					$("img#" + like).attr("class", "likeauto");
				}
				
				$.ajax({
					url : "/admin/performance/unlike",
					type : "POST",
					data : {
						"id" : id,
						"likeType" : likeType
					},
					success : function(data) {
						var likes = data.likes;
						var unlikes = data.unlikes;
						$("span#like" + data.id).html(likes);
						$("span#unlike" + data.id).html(unlikes);
					}

				});
			}else{				
				var id = Object.id.substring(6);
				$.ajax({
					url : "/admin/performance/unlike",
					type : "POST",
					data : {
						"id" : id,
						"likeType" : 2,
					},
					success : function(data) {
						var likes = data.likes;
						var unlikes = data.unlikes;
						$("span#like" + data.id).html(likes);
						$("span#unlike" + data.id).html(unlikes);
						$("img#" + Object.id).attr("class", "unlikeauto");
					}

				});
				
			}
			
		}
	</script>

</body>
</html>