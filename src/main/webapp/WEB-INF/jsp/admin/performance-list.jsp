<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Load basic css of Grid -->
<link rel="stylesheet" type="text/css"
	href="/resources/jqgrid/css/ui.jqgrid-bootstrap4.css" />
<!-- Load jquery-ui css -->
<link rel="stylesheet" type="text/css"
	href="/resources/jqgrid/jquery-ui/jquery-ui.theme.min.css" />
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<style>
.likeauto {
	content: url("/resources/admin-bootstrap/img/likeAuto.gif");
	width: 100px;
}

.unlikeauto {
	content: url("/resources/admin-bootstrap/img/unlikeAuto.gif");
	margin-top: 33px;
	width: 100px;
}

.like {
	content: url("/resources/admin-bootstrap/img/like.gif");
	width: 100px;
}

.unlike {
	content: url("/resources/admin-bootstrap/img/unlike.gif");
	width: 100px;
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
					<form id="searchTitle" class="user">
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<div class="input-group">

									<input id="title" name="title" type="text"
										class="form-control border-0 small"
										placeholder="Search Title..." aria-label="Search"
										aria-describedby="basic-addon2">

									<div class="input-group-append">
										<button id="searchBT" class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<a href="add" class="btn btn-primary btn-icon-split"> <span
									class="icon text-white-50"> <i
										class="fas fa-file-medical"></i>
								</span> <span class="text">Add New Performance</span>
								</a>
							</div>
						</div>
					</form>
					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Performance</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
								style="font-family: 'Noto Sans TC', sans-serif;">


								<div id="artistList" class="card-body">
									<table id="dataTable"></table>
									<div id="pager"></div>
								</div>

							</div>
						</div>

						<a href="/user/login"><button type="button"
								class="btn btn-primary btn-user btn-block">請點我到登入頁面</button></a> <br>
						<hr>
						<!-- /.container-fluid -->
						<!-- End of Main Content -->

						<jsp:include page="footer.jsp"></jsp:include>

					</div>
					<!-- End of Content Wrapper -->
				</div>
				<!-- End of Page Wrapper -->
			</div>
		</div>
	</div>
	<!-- 	Add language package for TW-ZH -->
	<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js"
		type="text/javascript"></script>
	<!-- 	Add jquery plugin -->
	<script src="/resources/jqgrid/js/jquery.jqGrid.min.js"
		type="text/javascript"></script>
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

		$("#dataTable").jqGrid({
			url : '/admin/performance/query',
			datatype : 'json',
			mtype : 'GET',
			styleUI : 'Bootstrap4',
			iconSet : 'fontAwesome',
			colModel : [ {
				name : 'id',
				label : 'ID',
				width : 4
			}, {
				name : 'title',
				label : 'Title',
				width : 20,
				sortable : false
			},
			// 				{ name: 'introduction', label:'Introduction', width:25,sortable: false},
			{
				name : 'url',
				label : 'URL',
				width : 25,
				sortable : false
			}, {
				name : 'updateTime',
				label : 'UpdateTime',
				width : 15
			}, {
				name : 'activityId',
				label : 'ActivityId',
				width : 5
			}, {
				name : 'views',
				label : 'Views',
				width : 5
			}, {
				name : 'likes',
				label : 'Likes',
				width : 5
			}, {
				name : 'unlikes',
				label : 'Unlikes',
				width : 5
			}, {
				name : 'edit',
				width : 5,
				formatter : editBT,
				sortable : false
			}, {
				name : 'delete',
				width : 5,
				formatter : deleteBT,
				sortable : false
			} ],
			prmNames : {
				search : null,
				nd : null
			},
			pager : '#pager',
			page : 1,
			autowidth : true,
			shrinkToFit : true,
			height : 'auto',
			rowNum : 2,
			rowList : [ 2, 20, 50 ],
			sortname : 'updateTime',
			sortable : true,
			sortorder : 'asc',
			viewrecords : true,
			altRows : true
		});

		function editBT(cellvalue, options, rowObject) {
			return "<button type='button' id='"
					+ rowObject.id
					+ "'onclick='edit(this)' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button>";
		}

		function deleteBT(cellvalue, options, rowObject) {
			return "<button type='button' id='"
					+ rowObject.id
					+ "'onclick='dele(this)' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i>"
		}

		$("#searchBT").click(function() {
			console.log(JSON.parse($("#searchTitle").serializeObject()));
			$('#dataTable').jqGrid("clearGridData");
			$('#dataTable').jqGrid('setGridParam', {
				postData : JSON.parse($("#searchTitle").serializeObject())
			}).trigger("reloadGrid");
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
			} else {
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
			if (Object.className == "unlikeauto") {
				$("img#" + Object.id).attr("class", "unlike");
				var like = Object.id.substring(2);
				var likeType = 0;
				var id = Object.id.substring(6);
				var likenew = $("img#" + like).attr("class");
				if (likenew == "like") {
					likeType = 1;
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
			} else {
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

		function edit(Object) {
			window.location.href = '/admin/performance/edit/' + Object.id;
		}
		function dele(Object) {
			var r = confirm("確定要刪除這筆ID=" + Object.id + "的資料嗎？");
			if (r == true) {
				$.ajax({
					url : '/admin/performance/' + Object.id,
					method : 'DELETE',
					contentType : 'application/json;charset=UTF-8',
					dataType : 'json',
					success : function(response) {
						if (response.type == 'SUCCESS') {
							alert("資料刪除成功！\n您刪除了一筆ID為：" + Object.id
									+ "的資料！\n即將重新進入LIST頁面！");
							window.location.href = "/admin/performance/list";
						} else {
							alert("資料刪除失敗！請重新搜尋清單確保資料為最新！");
						}
					},
					error : function(respH) {
						alert("資料刪除失敗！請檢查伺服器連線！");
					}
				})
			}
		}
	</script>
</body>
</html>