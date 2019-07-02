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
						<h1 class="h3 mb-0 text-gray-800">List of Forum</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>
					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Forum</span>
					</a>
<!-- 					<form id="searchData"> -->
<!-- 						<select id="board" name="board"> -->
<!-- 							<option value="Performance">Performance</option> -->
<!-- 							<option value="Activity">Activity</option> -->
<!-- 							<option value="Ariticle">Ariticle</option> -->
<!-- 						</select> -->
<!-- 						<button type="button" id="searchButton">Search</button> -->
<!-- 					</form> -->

<!-- 					<form id="searchData"> -->
<!-- 						<input type="text" name="searchWord"/> -->
<!-- 						<button type="button" id="searchButton">Search</button> -->
<!-- 					</form> -->
					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of Forum</h6>
						</div>
						<!-- Grid -->
						<div id="forumList" class="card-body">
							<table id="forumGrid"
								class="table table-bordered table-striped table-hover"></table>
							<div id="pager"></div>
						</div>

						<div class="card-body">
							<form id="forum" method="post">
								<input type="text" id="id" name="id" style="display: none">
							</form>
						</div>
					</div>
					<div><button type='button' id='testBT'>Click</button></div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp"></jsp:include>

		</div>
		<!-- End of Content Wrapper -->
		
		<!-- 	Add language package for TW-ZH -->
	<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js" type="text/javascript"></script>
	<!-- 	Add jquery plugin -->
	<script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>

	</div>
	<!-- End of Page Wrapper -->
	<script>
// 	$.ajax({
// 		url : "query",
// 		type : "GET",
// 		dataType : "json",
// 		success : function(data) {
// 			console.log("enter success");
// 			showNames(data);
// 		}
// 	})

 $("#forumGrid").jqGrid({
        url: '/admin/forum/query',
        datatype: 'json',
        mtype: 'GET',
        styleUI : 'Bootstrap4',
    	colModel :[ //從這邊開始要設定的就是跟欄位本身有關係的設定了.....
    		{name:'id', index:'id', sortable: false,width: 5}, //設定第一個欄位為id，並且index設成id為到時候ajax回server side連結時使用的parameter。並且設定為不可做排序。
    		{name:'board', index:'board', width: 20},
    		{name:'refId', index:'refId', width: 10},	
    		{name:'refCommentId', index:'refCommentId', width: 15},
    		{name:'userName', index:'userName', width: 15},
    		{name:'comment', index:'comment', width: 50},
    		{name:'commentDate', index:'commentDate', width: 25},
    		{name:'likeCount', index:'likeCount', width: 15}, //設定第二個欄位為name，並且設定寬度為120px。寬度沒設定的話，預設為150(值會再經jqGrid再運算過)<a href="http://www.trirand.com/jqgridwiki/doku.php?id=wiki:colmodel_options" target="_blank"> colModel屬性說明</a>
    		{name:'dislikeCount', index:'dislikeCount', width: 15,align:'right'} //設定url欄位，這邊是故意設定靠右對齊
    		],
        prmNames: {search: null, nd: null},
        pager: '#pager',
        page: 1,
        autowidth: true,
        shrinkToFit: true,
        height: 'auto',
        rowNum: 2,
        rowList: [5, 10, 20, 50],
        sortname: 'id',
        sortorder: "asc",
        viewrecords: true,
    });

		function showNames(data) {
			console.log("enter showdata1");
			var txt = "";
			var id = "";
			var columnName;
			if(!data[0]){
				return
			}else{
			columnName= Object.keys(data[0]);
			txt += "<thead><tr>";
			for(var i in columnName){
				txt += "<th>" + columnName[i] + "</th>"
			}
			txt += "<th>EDIT</th><th>DELETE</th></tr></thead>"
			}
			$.each(data,function(index, value) {
								txt += "<tbody id='tbody'><tr>";
								for (i in value) {
									txt += "<td>" + value[i] + "</td>";
									id = Object.values(value)[0];
								}
								txt += "<td><button type='button' id="
										+ "'"
										+ id
										+ "'"
										+ " onclick='sendId(this)' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button></td>";
								txt += "<td><button type='button' id="
										+ "'"
										+ id
										+ "'"
										+ " onclick='deleId(this)' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i></button></td>";
								txt += "</tr>";
							})
							txt += "</tbody>"
							console.log(txt);
			$("#dataTable").html(txt);
			tableRefresh();
		}

		function sendId(Object) {
			$("#forum").attr("action", '/admin/forum/edit');
			$("#id").val(Object.id);
			$('#forum').submit();
		}
		function deleId(Object) {
// 			$("#forum").attr("action", '/admin/forum'+Object.id);
// 			$("#id").val();
// 			$('#forum').submit();
			$.ajax({
				url:'/admin/forum/'+Object.id,
				type:"DELETE",
				dataType : "text",
				success:function(data){
					console.log(data);
					window.location.href = "/admin/forum/list";
					console.log("delete success");
				},
				error: function(data){
					console.log(data);
					console.log("error")
					window.location.href = "/admin/forum/list";
				}
			})
			
		}
	
		$("#searchButton").click(function() {
			$.ajax({				
				url : "/admin/forum/search",
				type : "POST",
				dataType : "json",
				data : JSON.parse($("#searchData").serializeObject()),
				success : function(data) {
					$("div#dataTable_length").remove();
					$("div#dataTable_filter").remove();
					$("div#dataTable_info").remove();
					$("div#dataTable_paginate").remove();
					showNames(data);
				},
				error : function() {
					console.log("error");
				}
			})
		})
		
		$("#testBT").click(function(){
			$.ajax({
				url:"/admin/forum/fitComment",
				type:"POST",
				contentType : "application/json",
				dataType : "json",
				data:JSON.stringify({board:"Ariticle",refId:1}),
				success:function(data){
					showNames(data);
				}
			
			})
		})
		
		
	</script>

</body>
</html>