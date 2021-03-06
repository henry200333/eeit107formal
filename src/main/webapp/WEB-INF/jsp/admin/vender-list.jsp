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
				<div class="container-fluid" style="font-family: 'Noto Sans TC', sans-serif;">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">廠商列表</h1>
					<button type="button" id='exportExcel'
						class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
						class="fas fa-download fa-sm text-white-50"></i>下載資料</button>
					</div>

					<!-- Add New Article Button -->
					<form class="user">
			            <div class="form-group row">
			            	<div class="col-sm-3 mb-3 mb-sm-0">
					            <div class="input-group">
					              <input id="search" name="search" type="text" class="form-control border-0 small" placeholder="搜尋廠商..." aria-label="Search" aria-describedby="basic-addon2">
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
									</span> <span class="text">新增廠商</span>
								</a>
				            </div>
			            </div>
			        </form>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">廠商列表</h6>
						</div>
						<div id="venderList" class="card-body" style="font-family: 'Noto Sans TC', sans-serif;">
								<table id="venderGrid" ></table>
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
	<table id="forExcel"></table>
<div id="forExcelpager"  style='display=:none'></div>	
	<!-- End of Page Wrapper -->
	
	<!-- 	Add language package for TW-ZH -->
	<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js" type="text/javascript"></script>
	<!-- 	Add jquery plugin -->
	<script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<!-- EXCEL -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.2.2/jszip.min.js"></script>
	
	<script>
	var totaldata;

	$("#exportExcel").on("click", function(){
		$("#forExcel").jqGrid({
	        url: '/admin/vender/query',
	        datatype: 'json',
	        mtype: 'GET',
	        styleUI : 'Bootstrap4',
	        iconSet : "fontAwesome",
	        colModel: [
				{name:'id',index:'id', width:3},
				{name:'name',index:'name', label : '名稱', width:5},
				{name:'city',index:'city', label : '縣市', width:2},
				{name:'district',index:'district', label : '區域', width:2},
				{name:'address',index:'address', label : '地址', width:5},
				{name:'maxPeople',index:'max_people', label : '最大人數', sortable:false,width:5},
				{name:'phone',index:'phone', label : '電話', sortable:false,width:5}
			],
	        prmNames: {search: null, nd: null},
	        pager: '#forExcelpager',
	        page: 1,
	        autowidth: true,
	        shrinkToFit: true,
	        height: 'auto',
	        sortable:true,
	        rowNum: 5,
	        rowList: [2, 5, 10, 20],
	        sortname: 'id',
	        sortorder: "asc",
	        viewrecords: true,	
	        loadonce:true,
			gridComplete:function(){						
				$("#gbox_forExcel").hide();
				$("#forExcel").jqGrid("exportToExcel",{
					includeLabels : true,
					includeGroupHeader : true,
					includeFooter: true,
					fileName : "jqGridExport.xlsx",
					maxlength : 40 // maxlength for visible string data 
				})
			}
	        
	    });
		
		
	})
	
	 $("#venderGrid").jqGrid({
        url: '/admin/vender/query',
        datatype: 'json',
        mtype: 'GET',
        styleUI : 'Bootstrap4',
        iconSet : "fontAwesome",
        colModel: [
			{name:'id',index:'id', width:3},
			{name:'name',index:'name', label : '名稱', width:5},
			{name:'city',index:'city', label : '縣市', width:2},
			{name:'district',index:'district', label : '區域', width:2},
			{name:'address',index:'address', label : '地址', width:5},
			{name:'maxPeople',index:'max_people', label : '最大人數', sortable:false,width:5},
			{name:'phone',index:'phone', label : '電話', sortable:false,width:5}	,
			{name:'detal',width:3, label : '詳細資料', sortable:false,formatter:detalbt},
			{name:'edit',width:3, label : '編輯', sortable:false,formatter:editbt},
			{name:'delete',width:3, label : '刪除', sortable:false,formatter:deletebt}
		],
        prmNames: {search: null, nd: null},
        pager: '#pager',
        page: 1,
        autowidth: true,
        shrinkToFit: true,
        height: 'auto',
        sortable:true,
        rowNum: 5,
        rowList: [2, 5, 10, 20],
        sortname: 'id',
        sortorder: "asc",
        viewrecords: true,
        
    });
	
		$("#searchBT").click(function(){
			$('#venderGrid').jqGrid("clearGridData") ;
			$('#venderGrid').jqGrid('setGridParam',{url: '/admin/vender/query?name=' + $('#search').val() }).trigger("reloadGrid");
		});
		
		function editbt(cellvalue, options, rowObject){
			return "<button type='button' id='"
			+ rowObject.id
			+ "'onclick='editid(this)' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button>";
		};
		function detalbt(cellvalue, options, rowObject){
			return "<button type='button' id='"
			+ rowObject.id
			+ "'onclick='detalid(this)' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button>";
		};
		function deletebt(cellvalue, options, rowObject){
			return "<button type='button' id='"
			+ rowObject.id
			+ "'onclick='deleteid(this)' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i>";
		};
		function editid(object){
			window.location.href = "/admin/vender/edit?id=" + object.id;
		};
		function detalid(object){
			window.location.href = "/admin/vender/venderself?id=" + object.id;
		};
		function deleteid(object){
			$.ajax({
				url : '/admin/vender/delete?id='+object.id,
				type : "DELETE",
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					alert(data+"號資料刪除成功")
					window.location.assign("/admin/vender/list");
					
				},
				error: function(){
					alert("error");
				}
			})
			
		}


	
	</script>
</body>
</html>