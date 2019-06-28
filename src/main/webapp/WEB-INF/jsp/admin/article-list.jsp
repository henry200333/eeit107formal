<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<!-- Load basic css of Grid -->
<link rel="stylesheet" type="text/css" href="/resources/jqgrid/css/ui.jqgrid.css" />
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

					<!-- Add New Article Button -->
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
				            	<a href="add" class="btn btn-primary btn-icon-split"> <span
									class="icon text-white-50"> <i class="fas fa-file-medical"></i>
									</span> <span class="text">Add New Article</span>
								</a>
				            </div>
			            </div>
			        </form>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Article</h6>
						</div>
						<div id="articleList" class="card-body">
								<table id="articleGrid" class="table table-bordered table-striped table-hover"></table>
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
        colModel: [
			{ name: 'id', label: 'ID', align: 'center', width: 30 },
			{ name: 'name', label: 'Article_Title', width: 80 },
			{ name: 'content', label: 'Content'},
			{ name: 'articleType', label: 'Article_Type', align: 'center', width: 40 },
			{ name: 'refId', label: 'REF_ID', align: 'center', width: 30 },
			{ name: 'count', label: 'Views', align: 'center', width: 30 }
		],
        prmNames: {search: null, nd: null},
        pager: '#pager',
        page: 1,
        autowidth: true,
        shrinkToFit: true,
        height: 'auto',
        rowNum: 10,
        rowList: [5, 10, 20, 50],
        sortname: 'id',
        sortorder: "asc",
        viewrecords: true,
        loadComplete: function() {
            var grid = $("#articleGrid"),
                ids = grid.getDataIDs();
             $(".ui-jqgrid-labels").css ("height", 30);
             $(".ui-jqgrid-sortable").css ("height", 30);
             $(".ui-jqgrid").css ("font-size", 20);
            for (var i = 0; i < ids.length; i++) {
                grid.setRowData(ids[i], false, { height : 30 });
            }
        }
    });
	
		$("#searchBT").click(function(){
			$('#articleGrid').jqGrid("clearGridData") ;
			$('#articleGrid').jqGrid('setGridParam',{url: '/admin/article/query?name=' + $('#search').val() }).trigger("reloadGrid");
		});
// 	function editId(obj){
// 		$(location).attr('href', '/admin/article/edit?id=' + obj.id);
// 	}
// 	function deleId(obj){
// 		var r = confirm("確定要刪除這筆ID=" + obj.id + "的文章嗎？");
// 		if (r == true) {
// 			$.ajax({
// 				url : '/admin/article/delete',
// 				type : 'DELETE',
// 				contentType : 'application/json;charset=UTF-8',
// 				dataType : 'json',
// 				data : '{"id":"' + obj.id + '"}',
// 				success : function(response) {
// 					if (response.type == 'SUCCESS'){
// 						alert("資料刪除成功！\n您刪除了一筆ID為：" + response.data.id + "的文章！\n即將重新進入LIST頁面！");
// 						$(location).attr('href', '/admin/article/list');
// 					} else {
// 						alert("資料刪除失敗！請重新搜尋清單確保資料為最新！");
// 					}
// 				},
// 				error : function(respH) {
// 					alert("資料刪除失敗！請檢查伺服器連線！");
// 				}
// 			})
// 		}
// 	}

	
	</script>
</body>
</html>