<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<!-- Load basic css of Grid -->
<link rel="stylesheet" type="text/css" href="/resources/jqgrid/css/ui.jqgrid-bootstrap4.css" />
<!-- Load jquery-ui css -->
<link rel="stylesheet" type="text/css" href="/resources/jqgrid/jquery-ui/jquery-ui.theme.min.css"/>

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
						<h1 class="h3 mb-0 text-gray-800">List of Article</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button + search name&type -->
					<form class="user">
			            <div class="form-group row">
			            	<div class="col-sm-3 mb-3 mb-sm-0">
					            <div class="input-group">
					              <input id="search" name="search" type="text" class="form-control border-0 small" placeholder="Search Article..." aria-label="Search" aria-describedby="basic-addon2">
					              <div class="input-group-append">
					                <button id="searchBT" class="btn btn-primary" type="button">
					                  <i class="fas fa-search fa-sm"></i>
					                </button>
					              </div>
					            </div>
				            </div>
				            <div class="col-sm-3 mb-3 mb-sm-0">
				            	<a href="/admin/article/add" class="btn btn-primary btn-icon-split"> <span
									class="icon text-white-50"> <i class="fas fa-file-medical"></i>
									</span> <span class="text">Add New Article</span>
								</a>
				            </div>
			            </div>
			        </form>
			        
			        <div class="row">
				        <div class="col-9">
							<div class="input-group-append">
								<button id="allBT" type="button" class="btn btn-success">ALL</button>
								<button id="artistBT" type="button" class="btn btn-light">ARTIST</button>
								<button id="activityBT" type="button" class="btn btn-light">ACTIVITY</button>
								<button id="performanceBT" type="button" class="btn btn-light">PERFORMANCE</button>
								<button id="venderBT" type="button" class="btn btn-light">VENDER</button>
								<button id="otherBT" type="button" class="btn btn-light">OTHER</button>
							</div>
						</div>
					</div>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Article</h6>
						</div>
						<div id="articleList" class="card-body" style="font-family: 'Noto Sans TC', sans-serif;">
								<table id="articleGrid"></table>
								<div id="pager"></div>
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
	
	<!-- 	Add language package for TW-ZH -->
	<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js" type="text/javascript"></script>
	<!-- 	Add jquery plugin -->
	<script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	
	<script>
	 $("#articleGrid").jqGrid({
        url: '/admin/article/query',
        datatype: 'json',
        mtype: 'GET',
        styleUI : 'Bootstrap4',
        iconSet : "fontAwesome",
        colModel: [
			{ name: 'id', index: 'id', label: 'ID', width: 30 },
			{ name: 'name', label: '文章標題', width: 80 },
			{ name: 'content', label: '文章內容'},
			{ name: 'articleType', label: '文章類型', width: 30 },
			{ name: 'refId', label: '關聯ID', width: 20 },
			{ name: 'count', label: '人氣', width: 20 },
			{ name: 'announcedUserId', label: '文章發布者ID', width: 35 },
			{ name: 'announce', label: '創建時間', width: 45 },
			{ name: 'edit', label: '編輯', width: 20, sortable : false, formatter: editBT },
			{ name: 'delete', label: '刪除', width: 20, sortable : false, formatter: deleBT }
		],
        prmNames: {search: null, nd: null},
        pager: '#pager',
        page: 1,
        autowidth: false,
        shrinkToFit: true,
        height: 'auto',
        rowNum: 3,
        rowList: [3, 5, 10, 20],
        sortname: 'id',
        sortorder: "asc",
        viewrecords: true,
        loadComplete: function () {
            reSizejqGridWidth();
        }
    });
	 
	 function editBT(cellvalue, options, rowObject) {
			return "<button type='button' id='"
					+ rowObject.id
					+ "'onclick='editId(this)' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button>";
		}
		function deleBT(cellvalue, options, rowObject) {
			return "<button type='button' id='"
					+ rowObject.id
					+ "'onclick='deleId(this)' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i>"
		}
		function editId(Object) {
			$(location).attr('href', '/admin/article/edit?id=' + Object.id);
		}

		function deleId(Object) {
			var msg = "您真的確定要刪除文章ID：" + Object.id + "的文章？"; 
			 if (confirm(msg)==true){
				$.ajax({
					url : '/admin/article/delete',
					type : "DELETE",
					contentType : 'application/json;charset=UTF-8',
					dataType : "json",
					data: '{"id":"' + Object.id + '"}',
					success : function(res) {
						if (res.type == 'SUCCESS'){
							alert("您刪除了一筆文章名稱：\n" + res.data.name + "\n的文章！");
							$(location).attr('href', '/admin/article/list');
						} else {
							alert("文章名稱：\n" + res.data.name + "\n刪除錯誤！\n請重新搜尋最新文章資料！");
						}
					},
					error : function(res) {
						alert("文章名稱：\n" + res.data.name + "\n刪除錯誤！\n請重新搜尋最新文章資料！");
					}
				})
			 }
		}
		// 頂端文章分類搜尋按鈕
		var articleType = "";
		$("#allBT").click(function(){
			$(this).attr("class", "btn btn-success");
			$("#artistBT").attr("class", "btn btn-light");
			$("#activityBT").attr("class", "btn btn-light");
			$("#performanceBT").attr("class", "btn btn-light");
			$("#venderBT").attr("class", "btn btn-light");
			$("#otherBT").attr("class", "btn btn-light");
			articleType = "";
			$('#articleGrid').jqGrid("clearGridData");
			$('#articleGrid').jqGrid('setGridParam',{url: '/admin/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
		});
		$("#artistBT").click(function(){
			$(this).attr("class", "btn btn-success");
			$("#allBT").attr("class", "btn btn-light");
			$("#activityBT").attr("class", "btn btn-light");
			$("#performanceBT").attr("class", "btn btn-light");
			$("#venderBT").attr("class", "btn btn-light");
			$("#otherBT").attr("class", "btn btn-light");
			articleType = "Artist";
			$('#articleGrid').jqGrid("clearGridData");
			$('#articleGrid').jqGrid('setGridParam',{url: '/admin/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
		});
		$("#activityBT").click(function(){
			$(this).attr("class", "btn btn-success");
			$("#artistBT").attr("class", "btn btn-light");
			$("#allBT").attr("class", "btn btn-light");
			$("#performanceBT").attr("class", "btn btn-light");
			$("#venderBT").attr("class", "btn btn-light");
			$("#otherBT").attr("class", "btn btn-light");
			articleType = "Activity";
			$('#articleGrid').jqGrid("clearGridData");
			$('#articleGrid').jqGrid('setGridParam',{url: '/admin/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
		});
		$("#performanceBT").click(function(){
			$(this).attr("class", "btn btn-success");
			$("#artistBT").attr("class", "btn btn-light");
			$("#activityBT").attr("class", "btn btn-light");
			$("#allBT").attr("class", "btn btn-light");
			$("#venderBT").attr("class", "btn btn-light");
			$("#otherBT").attr("class", "btn btn-light");
			articleType = "Performance";
			$('#articleGrid').jqGrid("clearGridData");
			$('#articleGrid').jqGrid('setGridParam',{url: '/admin/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
		});
		$("#venderBT").click(function(){
			$(this).attr("class", "btn btn-success");
			$("#artistBT").attr("class", "btn btn-light");
			$("#activityBT").attr("class", "btn btn-light");
			$("#performanceBT").attr("class", "btn btn-light");
			$("#allBT").attr("class", "btn btn-light");
			$("#otherBT").attr("class", "btn btn-light");
			articleType = "Vender";
			$('#articleGrid').jqGrid("clearGridData");
			$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
		});
		$("#otherBT").click(function(){
			$(this).attr("class", "btn btn-success");
			$("#artistBT").attr("class", "btn btn-light");
			$("#activityBT").attr("class", "btn btn-light");
			$("#performanceBT").attr("class", "btn btn-light");
			$("#venderBT").attr("class", "btn btn-light");
			$("#allBT").attr("class", "btn btn-light");
			articleType = "Other";
			$('#articleGrid').jqGrid("clearGridData");
			$('#articleGrid').jqGrid('setGridParam',{url: '/admin/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
		});
		$("#searchBT").click(function(){
			$('#articleGrid').jqGrid("clearGridData");
			$('#articleGrid').jqGrid('setGridParam',{url: '/admin/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
		});
		// 頂端文章分類搜尋按鈕
		<!--按Enter搜尋 起始-->
		$("#search").bind("keypress", keypressInBox);
		function keypressInBox(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		if (code == 13) { //Enter keycode 
			e.preventDefault();
			$("#searchBT").click();  
			}
		};
		<!--按Enter搜尋 尾-->
		<!-- 響應式網頁測試  158~160行增加loadComplete參數    149行autowidth改false 再加入以下code-->
		const grid_selector = "#articleGrid"; 
		const $grid = jQuery(grid_selector);
		    function reSizejqGridWidth()
		    { 
		        //重新抓jqGrid容器的新width
		        let newWidth = $grid.closest(".ui-jqgrid").parent().width();
		        //是否縮齊column(相當於shrinkToFit)
		        let shrinkToFit = true;
		        $grid.jqGrid("setGridWidth", newWidth, shrinkToFit);
		    };
		    $(window).on("resize", reSizejqGridWidth);
		<!-- 響應式網頁測試 -->
	</script>
</body>
</html>