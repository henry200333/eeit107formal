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
						<h1 class="h3 mb-0 text-gray-800">使用者列表</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> 下載檔案</a>
					</div>

					<!-- Add New Article Button -->
					<form class="user">
			            <div class="form-group row">
			            	<div class="col-sm-3 mb-3 mb-sm-0">
					            <div class="input-group">
					              <input id="search" name="search" type="text" class="form-control border-0 small" placeholder="搜尋帳號..." aria-label="Search" aria-describedby="basic-addon2">
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
									</span> <span class="text">新增使用者</span>
								</a>
				            </div>
			            </div>
			        </form>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">使用者列表</h6>
						</div>
						<div id="securityUserList" class="card-body" style="text-align: center">
								<table id="securityUserGrid"></table>
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
	 $("#securityUserGrid").jqGrid({
        url: '/admin/securityUser/query',
        datatype: 'json',
        mtype: 'GET',
        styleUI : 'Bootstrap4',
        iconSet : "fontAwesome",
        colModel: [
			{ name: 'userId', index: 'userId', label: '使用者ID', width: 12, align:'center'},
			{ name: 'displayName', index: 'displayName', label: '使用者名稱', width: 15, align:'center'},
			{ name: 'displayName', index: 'displayName', label: '使用者名稱', width: 15, align:'center'},
			{ name: 'account', label: '帳號',editable:false, width: 20, align:'center'},
			{ name: 'password', label: '密碼', width: 8, align:'center', editable:false, sortable:false, formatter:Colpassword},
			{ name: 'enabled', label: '啟用', width: 8, editable:true, edittype:'checkbox', editoptions: {value:"1:0"}, align:'center', formatter: enableCheck},
			{ name: 'ADMIN', label: '管理者權限', width: 15, editable:true, edittype:'checkbox', editoptions: {value:"1:0"}, align:'center', formatter: AuthCheck},
			{ name: 'USER', label: '使用者權限', width: 15, editable:false, edittype: 'checkbox', editoptions: {value: "1:0"}, align:'center', formatter: AuthCheck},
			{ name: 'ARTIST', label: '藝人權限', width: 15, editable:true, edittype: 'checkbox', editoptions: {value: "1:0"}, align:'center', formatter: AuthCheck},
			{ name: 'VENDER', label: '廠商權限', width: 15, editable:true, edittype: 'checkbox', editoptions: {value: "1:0"}, align:'center', formatter: AuthCheck},
			{ name: 'registerDate', index: 'registerDate', label: '註冊時間', width: 20, align:'center'},
			{ name:'EDIT',index:'EDIT',label:'修改權限', width:10, align:'center', sortable:false, formatter:editBT},
			{ name:'SAVE',index:'SAVE',label:'保存', width:8, align:'center',sortable:false, formatter:saveBT},
			{ name:'DETAIL',index:'DETAIL',label:'詳細資料', width:10, align:'center',sortable:false, formatter:detailBT}
		],
        prmNames: {search: null, nd: null},
        pager: '#pager',
        page: 1,
        autowidth: false,
        shrinkToFit: true,
        height: 'auto',
        rowNum: 10,
        rowList: [10, 20, 50],
        sortname: 'userId',
        sortorder: "asc",
        viewrecords: true,
        loadComplete: function () {
            reSizejqGridWidth();
        },
        ajaxRowOptions:{cache:false}
      <!--增加修改、存檔button-->  
//         gridComplete: function(){
//     		var ids = jQuery("#securityUserGrid").jqGrid('getDataIDs');
//     		for(var i=0;i < ids.length;i++){
//     			var cl = ids[i];
//     			ee = "<button  type='button' class='btn btn-primary btn-sm' onclick=\"jQuery('#securityUserGrid').editRow('"+cl+"');\"  ><i class='far fa-edit'></i></button>"; 
//     			se = "<button  type='button' class='btn btn-success btn-sm' onclick=\"jQuery('#securityUserGrid').saveRow('"+cl+"');\"  ><i class='far fa-save'></i></button>"; 
//     			jQuery("#securityUserGrid").jqGrid('setRowData',ids[i],{EDIT:ee,SAVE:se});
//     		}	
//     	}
    });
	 <!--增加修改、存檔button--> 
	 <!--權限驗證-->
	 function AuthCheck(cellvalue, options, rowObject) {
		 var txt = "";
		 var oCN = options.colModel.name;
		 var rowId = options.rowId;
		 for(i=0;i<rowObject.authorities.length;i++){
			 var authority = rowObject.authorities[i].authority;
			 txt += authority; 
			 }
		 		if(txt.indexOf(oCN) > -1){
		 			return "<input type='checkbox' name='"+rowId+"' disabled='disabled' checked>"
		 		}else{
		 			return "<input type='checkbox' name='"+rowId+"' disabled='disabled' unchecked>"
		 		}
		 }
	 <!--權限驗證-->
	 
	 <!--帳號是否停權驗證-->
	 function enableCheck(cellvalue, options, rowObject) {
		 var rowId = options.rowId;
		 if(cellvalue==true){
		 			return "<input type='checkbox' name='"+rowId+"' disabled='disabled' checked>"
		 		}else{
		 			return "<input type='checkbox' name='"+rowId+"' disabled='disabled' unchecked>"
		 		}
		 }
	 <!--帳號是否停權驗證-->
	 
	 <!--button test-->
	 function editBT (cellvalue, options, rowObject) {
		 return "<button type='button' id='"
			+ options.rowId
			+ "'onclick='editId(this)' class='btn btn-warning btn-sm'><i class='fas fa-edit'></i></button>";  //返回的html即為欄位中的樣式
		};
	 function saveBT (cellvalue, options, rowObject) {
		 return "<button type='button' id='"
			+ options.rowId
			+ "'onclick='saveId(this)' class='btn btn-success btn-sm'><i class='fas fa-save'></i></button>";
		};
	 function detailBT (cellvalue, options, rowObject) {
		 return "<button type='button' id='"
			+ options.rowId
			+ "'onclick='' class='btn btn-primary btn-sm'><i class='far fa-file-alt'></i></button>";
		};
	 
		function editId(Object) {
			$("input:checkbox").prop("disabled", true);
			var inputname = "input[name|='" + Object.id + "']";
			$(inputname).prop("disabled", false);
	
// 			$("#securityUserGrid").jqGrid('editRow',Object.id);
		}
		function saveId(Object) {
// 			var userId = jQuery("#securityUserGrid").jqGrid('getCell',Object.id,'userId');
// 			var account = jQuery("#securityUserGrid").jqGrid('getCell',Object.id,'account');
// 			jQuery("#securityUserGrid").jqGrid('saveRow',Object.id,{url:'/admin/securityUser/editRow',"extraparam":{"userId":userId,"account":account}});
					var list = document.getElementsByName(Object.id);
					var ENABLE = list[0].checked;
					var ADMIN = list[1].checked;
					var USER = list[2].checked;
					var ARTIST = list[3].checked;
					var VENDER = list[4].checked;
					if (list[0].disabled == false){
					$.ajax({
						url : '/admin/securityUser/editRow',
						method : 'GET',
						contentType : 'application/json;charset=UTF-8',
						dataType : 'json',
						data : {
							userId: Object.id,
							enabled: ENABLE,
							ADMIN: ADMIN,
							USER: USER,
							ARTIST: ARTIST,
							VENDER: VENDER
						},
						success : function(response) {
							if (response.type == 'SUCCESS'){
								var inputname = "input[name|='" + Object.id + "']";
								$(inputname).prop('disabled',true);
								alert("資料修改成功！");
							} else {
								alert("資料修改失敗！請檢查該用戶是否存在！");
							}
						},
						error : function(respH) {
							alert("資料修改失敗！該用戶不存在！");
						}
					})
					}
		}
		<!--button test-->
	 
	 <!--密碼欄位-->
	 function Colpassword(cellvalue, options, rowObject) {
		 	return "<button type='button' class='btn btn-danger btn-sm'><i class='far fa-edit'></i></button>"
		 }
	 <!--密碼欄位-->	

		$("#searchBT").click(function(){
			$('#securityUserGrid').jqGrid("clearGridData") ;
			$('#securityUserGrid').jqGrid('setGridParam',{url: '/admin/securityUser/query?name=' + $('#search').val() }).trigger("reloadGrid");
		});

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
		const grid_selector = "#securityUserGrid"; 
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