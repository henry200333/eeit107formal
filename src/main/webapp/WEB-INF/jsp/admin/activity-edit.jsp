<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />	
<link rel="stylesheet" href="/resources/admin-bootstrap/css/jquery-ui-timepicker-addon.css">
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column" style="font-family: 'Noto Sans TC', sans-serif;">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="topbar.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">編輯活動</h1>

					</div>

					<!-- Return to Activity -->
					<a href="/admin/activity/list" class="btn btn-info btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-reply"></i>
					</span> <span class="text">活動列表</span>
					</a>

					<hr>

					<form id="form" name="form" class="user" autocomplete="off">
						<div class="form-group row"
							style="font-family: 'Noto Sans TC', sans-serif;">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="id">活動編號:</label> <input type="text"
									class="form-control form-control-user" id="id" name="id"
									placeholder="" value="${activityParam.id}" readonly>
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="name">活動名稱:</label> <input id="name" name="name"
									class="form-control form-control-user" placeholder="NAME"
									value="${activityParam.name}" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="artist">表演者:</label> <input id="artist"
									name="artist" class="form-control form-control-user"
									placeholder="Artist" value="${activityParam.artist}" />
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-9 mb-3 mb-sm-0">
								<label for="description">活動描述:</label>
								<textarea id="description" name="description"
									class="form-control">${activityParam.description}</textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="beginTime">開始時間:</label> <input id="beginTime"
									name="beginTime" type="text"
									class="form-control form-control-user" placeholder="BeginTime"
									value="${activityParam.beginTime}" readonly="readonly" style="background-color:#ffffff" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
							<div class="col-sm-3 mb-3 mb-sm-0">
								<label for="endTime">結束時間:</label> <input id="endTime" type="text"
									name="endTime" class="form-control form-control-user"
									placeholder="EndTime" value="${activityParam.endTime}" readonly="readonly" style="background-color:#ffffff" />
							</div>
							<div class="col-sm-3 mb-3 mb-sm-0"></div>
						</div>
						
						<div class="form-group row">
						<div class="col-sm-3 mb-3 mb-sm-0">
						<label for="perfType">表演類型:</label> 
					<select  name="perfType" id="perfType"  class="form-control">
					<option selected  hidden='true' value="${activityParam.perfType}">${activityParam.perfType}</option>
					<option value='創意藝術'>創意藝術</option>
					<option value='視覺藝術'>視覺藝術</option>
					<option value='表演藝術'>表演藝術</option>
					</select>   
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
						<label for="awesomeNum">追蹤人數:</label> <input id="awesomeNum" type="text"
									name="awesomeNum" class="form-control form-control-user"
									value="${activityParam.awesomeNum}"  />
						
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
						<label for="locationId">場地編號:</label> <input id="locationId" type="text"
									name="locationId" class="form-control form-control-user"
									value="${activityParam.locationId}" readonly />
						</div>
					
						</div>
						
						<div class="form-group row">
						<div class="col-sm-2 mb-3 mb-sm-0">
						<label for="city">縣市:</label>
						<select name="city" id="city"  class="form-control">
						</select>
						</div>
						<div class="col-sm-2 mb-3 mb-sm-0">
						<label for="district">鄉鎮市區:</label>
						<select  name="district" id="district"  class="form-control">
						<option selected  hidden='true' value='${locationDistrict}'>${locationDistrict}</option>
						</select>
						</div>
						<div class="col-sm-2 mb-3 mb-sm-0">
						<label for="locationName">活動地點:</label>
						<select  name="locationName" id="locationName"  class="form-control">
						<option selected  hidden='true' value='${locationLocationName}'>${locationLocationName}</option>
						</select>
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
						<label for="address">地址:</label>
						<input type="text"  name="address" id="address"  class="form-control" readonly>
						</div>
						
						
						</div>
						<input type="text" class="form-control form-control-user" id="useraId" name="useraId"	placeholder="" value="${activityParam.useraId}" hidden='hidden'>
						
						
						
						
						<button id="update" type="button"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text"> 確認編輯</span>
						</button>

						<button id="reset" type="button"
							class="btn btn-danger btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-excel"></i>
							</span> <span class="text"> 恢復未修改資料</span>
						</button>
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

</body>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>
<script>
	$("#update").click(
			function() {
				$.ajax({
					url : '/admin/activity/update',
					method : 'PUT',
					contentType : 'application/json;charset=UTF-8',
					dataType : 'json',
					data : $("#form").serializeObject(),
					success : function(response) {
						if (response.type == "SUCCESS") {
							alert("資料修改成功！\n您修改了一筆名為："
									+ JSON.stringify(response.data.name));
						} else {
							alert("資料修改失敗！請檢查輸入欄位！");
						}
					},
					error : function(re) {
						alert("資料修改失敗！請檢查輸入欄位！");
					}
				})
			})
			
			
			
			$(function() {
		    $( "#beginTime" ).datetimepicker({
		        showButtonPanel: true,
		        dateFormat:'yy-mm-dd',
		        timeFormat: "HH:mm:ss",
		        onClose: function(selectedDate) {
					$("#endTime").datepicker("option", "minDate", selectedDate)}
		    });
		    $( "#endTime" ).datetimepicker({
		        showButtonPanel: true,
		        dateFormat:'yy-mm-dd',
		        timeFormat: "HH:mm:ss",
		        onClose: function(selectedDate) {
					$("#beginTime").datepicker("option", "maxDate", selectedDate)}
		    });
		  });
	
// 	$.ajax({
// 		url:"/admin/activity/location",
// 		type:"POST",
// 		success: function(data){
// 			var txt="";		
// 			console.log(data);
// 			$.each(data,function(index,value){
// 				txt += 	"<option value='"+value['id']+"'>"+ value['locationName']+"</option>"			
// 				})	
// 			$("select").html(txt);
// 		}
// 	})
	
	 $(document).ready(function(){
		 $.ajax({
				url:"/admin/activity/location/city",
				type:"POST",
				success: function(data){
					var txt="";		
					console.log(data);
					txt += "<option selected disabled hidden='true' value='${locationCity}'>"+"${locationCity}"+"</option>";;
					$.each(data,function(index,value){
						txt += 	"<option value='"+ value +"'>"+ value +"</option>"			
						})	
					$("#city").html(txt);
					
				}
			})
                
                $('#city').change(function(){
                    var CName= $('#city').val();
                    $.ajax({
                        type: "POST",
                        url: '/admin/activity/location/'+ CName,
                        cache: false,
                        error: function(){
                            alert('發生錯誤');
                        },
                        success: function(data){
        					var txt="";		
        					console.log(data);
        					txt += '<option value="" style="display: none">請選擇鄉鎮市區</option>';
        					$.each(data,function(index,value){
        						txt += 	"<option value='"+ value +"'>"+ value +"</option>"			
        						})	
        					$("#district").html(txt);
        					
        				}
                    });
                });
                $('#district').change(function(){
                    var DisN= $('#district').val();
                    $.ajax({
                        type: "POST",
                        url: '/admin/activity/location/district/'+ DisN,
                        cache: false,
                        error: function(){
                            alert('Ajax request 發生錯誤');
                        },
                        success: function(data){
        					var txt="";		
        					console.log(data);
        					txt += '<option value="" style="display: none">請選擇活動地點</option>';
        					$.each(data,function(index,value){
        						txt += 	"<option value='"+ value['locationName'] +"'>"+ value['locationName'] +"</option>"			
        						})	
        					$("#locationName").html(txt);
        					
        				}
                    });
                });
                
                $("#locationName").change(function(){
                    var LN= $("#locationName").val();
                    $.ajax({
                        type: "POST",
                        url: '/admin/activity/location/address/'+ LN,
                        cache: false,
                        error: function(){
                            alert('發生錯誤');
                        },
                        success: function(data){
        					$("#address").val(data[0]['address']);
        					$("#locationId").attr("value",data[0]['locationId']);
        				}
                    });
                });
                
            });
	
	
	
</script>
</html>