<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h1 class="h3 mb-0 text-gray-800">List of Artist</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>
					<form id="searchForm" class="user">
			            <div class="form-group row">
			            	<div class="col-sm-3 mb-3 mb-sm-0">
					            <div class="input-group">
					        
					              <input id="searchBar" name="searchBar" type="text" class="form-control border-0 small" placeholder="Search Artist..." aria-label="Search" aria-describedby="basic-addon2">
					         
					              <div class="input-group-append">
					                <button id="searchBT" class="btn btn-primary" type="button">
					                  <i class="fas fa-search fa-sm"></i>
					                </button>
					              </div>
					            </div>
				            </div>
				            <div class="col-sm-3 mb-3 mb-sm-0">
								<a href="add" class="btn btn-primary btn-icon-split">
								<span class="icon text-white-50"> <i class="fas fa-file-medical"></i></span>
								<span class="text">Add New Artist</span>
								</a>
							</div>
			            </div>
			        </form>
					<hr>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of Artist</h6>
						</div>
						<div id="artistList" class="card-body" style="font-family: 'Noto Sans TC', sans-serif;">
								<table id="artistGrid" ></table>
								<div id="pager"></div>
						</div>
					</div>
					<form method="post" action="/admin/artist/uploadImage" enctype="multipart/form-data">
					<input type="file" name="imageFile" id="imageFile" accept="image/gif, image/jpeg, image/png" />
					<div id="previewDiv" class="previewDiv"></div>
					<input value="<sec:authentication
						property='name' />" type="hidden" name="username">
					<input type="submit" value="Upload" />
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
	
	<!-- 	Add language package for TW-ZH -->
	<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js" type="text/javascript"></script>
	<!-- 	Add jquery plugin -->
	<script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	
	<script>
		$("#artistGrid").jqGrid({
			url: '/admin/artist/query',
			datatype:'json',
			mtype:'GET',
			styleUI:'Bootstrap4',
			iconSet:'fontAwesome',
			colModel:[
				{ name: 'id', label:'Id', width:5},
				{ name: 'photo', label:'Photo', width:5, sortable: false, hidden:true},
				{ name: 'name', label:'Name', width:30},
				{ name: 'fanNumber', label:'FanNumber', width:30},
				{ name: 'location', label:'Location', width: 30},
				{ name:'edit', width:15, formatter:editBT, sortable: false},
				{ name:'delete',width:15,formatter:deleteBT, sortable: false}
			],
			prmNames: {search:null, nd:null},
			pager:'#pager',
			page:1,
			autowidth:true,
			shrinkToFit:true,
			height:'auto',
			rowNum:5,
			rowList: [5,20,50],
			sortname:'id',
			sortable:true,
			sortorder:'asc',
			viewrecords:true,
		});
		
		$("#searchBT").click(function(){
			console.log(JSON.parse($("#searchForm").serializeObject()));
			$('#artistGrid').jqGrid("clearGridData") ;
			$('#artistGrid').jqGrid('setGridParam',{postData:JSON.parse($("#searchForm").serializeObject())}).trigger("reloadGrid");
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
	
		function edit(Object) {
			$(location).attr('href', '/admin/artist/edit?id=' + Object.id);
		}
		function dele(Object) {
			var r = confirm("是否刪除" + Object.id + "號Artist");
			if (r == true) {
				$.ajax({
						url : "delete",
						type : "DELETE",
						contentType : 'application/json;charset=UTF-8',
						dataType : 'json',
						data : '{"id":"' + Object.id + '"}',
						success : function(response) {
								if (response.type == 'SUCCESS') {
									alert("已刪除了一筆ID為：" + response.data.id
											+ "的Artist！");
									$(location).attr('href',
											'/admin/artist/list');
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
		$("#imageFile").change(function(){
			$("#previewDiv").html("<img id='PreviewPic' src='#' />");
			readURL(this);
			});
		
		function readURL(input){
			  if(input.files && input.files[0]){
			    var reader = new FileReader();
			    reader.onload = function (e) {
			       $("#PreviewPic").attr('src', e.target.result);
			    }
			    reader.readAsDataURL(input.files[0]);
			  }
			}
	</script>
</body>
</html>