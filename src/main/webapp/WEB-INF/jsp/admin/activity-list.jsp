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
						<h1 class="h3 mb-0 text-gray-800">List of Activity</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Activity Button -->
					<form class="user" id="searchForm">
			            <div class="form-group row">
				            <div class="col-sm-3 mb-3 mb-sm-0">
				            	<a href="add" class="btn btn-primary btn-icon-split"> <span
									class="icon text-white-50"> <i class="fas fa-file-medical"></i>
									</span> <span class="text">Add New Activity</span>
								</a>
				            </div>
				            <div class="col-sm-3 mb-3 mb-sm-0">
					            <div class="input-group">
					              <input id="userInput" name="userInput" type="text" class="form-control border-0 small" 
					              placeholder="搜尋活動或表演者..." aria-label="Search" aria-describedby="basic-addon2">
					              <div class="input-group-append">
					                <button id="searchBT" class="btn btn-primary" type="button">
					                  <i class="fas fa-search fa-sm"></i>
					                </button>
					              </div>
					            </div>
				            </div>
			            </div>
			        </form>
					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Activity</h6>
						</div>
						<div class="card-body">
<!-- 			ajax版 塞資料處				<div class="table-responsive"></div> -->

						<table id="activityGrid"
								class="table table-bordered table-striped table-hover"></table>
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
	
		<!-- ajax版 抓資料 -->
// 		$.ajax({
// 			url : "/admin/activity/query",
// 			type : "GET",
// 			success : function(data) {
// 				var txt = "";
// 				txt += "<table class='table table-bordered table-striped table-hover'	id='dataTable' width='100%' cellspacing='0'><thead><tr><th>ID</th><th>Name</th><th>Artist</th><th>Description</th><th>Begin time</th><th>End time</th><th>AwesomeNum</th><th>BadNum</th><th>CoverImage</th><th>Edit</th><th>Delete</th></tr></thead><tbody>";
// 				$.each(data,function(index, value) {
// 						txt += "<tr>";
// 						for (i in value) {
// 							txt += "<td>" + value[i] + "</td>";
// 							id = Object.values(value)[0];
// 						}
// 						txt += "<td><a id=" + "'" + id + "'" + "href='' onclick='editId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></a></td>";
// 						txt += "<td><a id=" + "'" + id + "'" + 'href="" onclick="deleId(this);return false" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a></td>';
// 						txt += "</tr>";
// 				})
// 						txt += "</tbody></table>";
// 						$("div.table-responsive").append(txt);
// 						tableRefresh();
// 					}
// 				});
		<!-- ajax版 抓資料 -->
		
		
		<!-- jqGrid版 抓資料 -->
		
		 $("#activityGrid").jqGrid({
		        url: '/admin/activity/query',
		        datatype: 'json',
		        mtype: 'GET',
		        styleUI : 'Bootstrap4',
		    	colModel :[ //從這邊開始要設定的就是跟欄位本身有關係的設定了.....
		    		{name:'id', index:'id',label:'編號', sortable: false,width: 5}, //設定第一個欄位為id，並且index設成id為到時候ajax回server side連結時使用的parameter。並且設定為不可做排序。
		    		{name:'name', index:'name',label:'活動名稱', width: 10},
		    		{name:'artist', index:'artist',label:'表演者', width: 10},	
		    		{name:'description', index:'description',label:'活動描述', width: 25},
		    		{name:'beginTime', index:'beginTime',label:'開始時間', width: 15},
		    		{name:'endTime', index:'endTime',label:'結束時間', width: 15},
		    		{name:'awesomeNum', index:'awesomeNum',label:'點讚數', width: 10,align:'right'},
		    		{name:'badNum', index:'badNum',label:'倒讚數', width: 10,align:'right'}, //設定第二個欄位為name，並且設定寬度為120px。寬度沒設定的話，預設為150(值會再經jqGrid再運算過)<a href="http://www.trirand.com/jqgridwiki/doku.php?id=wiki:colmodel_options" target="_blank"> colModel屬性說明</a>
		    		{name:'edit', width:10,label:'編輯', formatter:editBT},
		    		{name:'delete', width:10,label:'刪除', formatter:deleteBT}
		    		],
		        prmNames: {search: null, nd: null},
		        pager: '#pager',
		        page: 1,
		        autowidth: true,
		        shrinkToFit: true,
		        height: 'auto',
		        rowNum: 3,
		        rowList: [3, 5, 7, 9],
		        sortname: 'id',
		        sortorder: "asc",
		        viewrecords: true, 
		        iconSet:'fontAwesome',
		        
		    });
			
		 function editBT (cellvalue, options, rowObject) {
			 return "<button type='button' id='"
				+ rowObject.id
				+ "'onclick='editId(this)' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button>";  //返回的html即為欄位中的樣式
			};
		 function deleteBT (cellvalue, options, rowObject) {
			 return "<button type='button' id='"
				+ rowObject.id
				+ "'onclick='deleId(this)' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i>"
			};
		
			//cellvalue - 当前cell的值  
			//options - 该cell的options设置，包括{rowId, colModel,pos,gid}  
			//rowObject - 当前cell所在row的值，如{ id=1, name="name1", price=123.1, ...}  	
		


		function editId(Object) {
			window.location.href = '/admin/activity/edit/' + Object.id;
		}
		function deleId(Object) {
			var r = confirm("確定要刪除這筆ID=" + Object.id + "的資料嗎？");
			if (r == true) {
				$.ajax({
					url : '/admin/activity/'+ Object.id,
					method : 'DELETE',
					contentType : 'application/json;charset=UTF-8',
					dataType : 'json',
					success : function(response) {
						if (response.type == 'SUCCESS') {
							alert("資料刪除成功！\n您刪除了一筆ID為：" + Object.id
									+ "的資料！\n即將重新進入LIST頁面！");
							window.location.href = "/admin/activity/list";
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
		
		
		$("#searchBT").click(function(){
			console.log(JSON.parse($("#searchForm").serializeObject()));
			$('#activityGrid').jqGrid("clearGridData") ;
			$('#activityGrid').jqGrid('setGridParam',{postData:JSON.parse($("#searchForm").serializeObject())}).trigger("reloadGrid");
		});
		
		
		<!--按Enter搜尋 起始-->
		$("#userInput").bind("keypress", keypressInBox);
		function keypressInBox(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		if (code == 13) { //Enter keycode 
		e.preventDefault();
		$("#searchBT").click();  
		}
		};
		<!--按Enter搜尋 尾-->
		
		
		
		
		
	
		
		
		
// 		$("#searchBT").click(function(){
// 			$.ajax({
// 				url : "/admin/activity/query?search=" + $("#search").val(),
// 				type : "GET",
// 				success : function(data) {
// 					var txt = "";
// 					txt += "<table class='table table-bordered table-striped table-hover'	id='dataTable' width='100%' cellspacing='0'><thead><tr><th>ID</th><th>Name</th><th>Artist</th><th>Description</th><th>Begin time</th><th>End time</th><th>AwesomeNum</th><th>BadNum</th><th>CoverImage</th><th>Edit</th><th>Delete</th></tr></thead><tbody>";
// 					$.each(data,function(index, value) {
// 						txt += "<tr>";
// 							for (i in value) {
// 								txt += "<td>" + value[i] + "</td>";
// 											id = Object.values(value)[0];
// 										}
// 										txt += "<td><a id="
// 												+ "'"
// 												+ id
// 												+ "'"
// 												+ "href='' onclick='editId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></a></td>";
// 										txt += "<td><a id="
// 												+ "'"
// 												+ id
// 												+ "'"
// 												+ 'href="" onclick="deleId(this);return false" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a></td>';
// 										txt += "</tr>";
// 									})
// 					txt += "</tbody></table>";
// 					$("div.table-responsive").append(txt);
// 					tableRefresh();
// 				}
// 			})
// 		})


	</script>

</body>
</html>