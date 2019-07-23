<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../topbar.jsp"></jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />	
<link rel="stylesheet" href="/resources/admin-bootstrap/css/jquery-ui-timepicker-addon.css">

<body>
<input type="hidden" value="${activityParam.id}" id="thisp">
	<input type="hidden" value="<sec:authentication property='name' />" id="thisuser">
	<sec:authorize access="isAuthenticated()">
	<input type='hidden' value="<sec:authentication property='principal.account'/>" id='userAccount'>
	<input type='hidden' value="<sec:authentication property='principal.displayName'/>" id='userDisplayName'>
	<input type='hidden' value="<sec:authentication property='principal.photo'/>" id='userPhoto'>
	</sec:authorize>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light static-top mb-5 shadow">
  <div class="container">
    <a class="navbar-brand" href="#" id='title'>活動詳情</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <button class="nav-link">新增活動
                <span class="sr-only">(current)</span>
              </button>
        </li>
        <li class="nav-item">
          <button class="nav-link">返回查詢頁面</button>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">
<form id="form" name="form" class="user" autocomplete="off">
  <div class="card border-0 shadow my-5">
    <div class="card-body p-5">
    <div id='dataDiv'>
    
    
    <div class='row'>
    <div >
   <img src='/resources/user-bootstrap/img/activity/activity${activityParam.id}.jpg' style='height:280px;border-radius:20px;width:500px'>
   </div>
   <div style='padding-left:10px'>
   <img src='/resources/user-bootstrap/img/activity/activity1.jpg' style='height:280px;border-radius:20px;'>
   </div>
  	</div>
  
   <div style='padding-top:20px' id="塞資料處">
   <div class='row'>
   
   <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>表演者名: </span>
   <div class='col-8'>
   <input type="text" class="form-control form-control-user" id="artist" name="artist"	placeholder="" value="${activityParam.artist}" readonly>
   </div>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i id='mappingIcon' class="fas fa-map-marker-alt"></i>活動詳細地址: </span>
   <div class='col-11' id='addressInfo'>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${locationCity}${locationDistrict}${locationAddress}</span>
   </div>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>活動名稱: </span>
   <div class='col-8'>
   <input type="text" class="form-control form-control-user" id="name" name="name"	placeholder="" value="${activityParam.name}">
   </div>
   </div>
   
     <div class="col-6">
   <span style="font-size: 20px;  font-weight: bold;"><i class="fas fa-map-marked-alt"></i>選擇活動地點:</span><br>
  
  
  
  <div class="form-group row">
						<div class="col-sm-3 mb-3 mb-sm-0">
						<select name="city" id="city"  class="form-control" >
						</select>
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
						<select  name="district" id="district"  class="form-control">
						<option selected  hidden='true' value='${locationDistrict}'>${locationDistrict}</option>
						</select>
						</div>
						<div class="col-sm-5 mb-3 mb-sm-0">
						<select  name="locationName" id="locationName"  class="form-control">
						<option selected  hidden='true' value='${locationLocationName}'>${locationLocationName}</option>
						</select>
						</div>
	</div>
   </div>
   
   <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>表演類型:</span>
   <div class='col-8'>
	<select  name="perfType" id="perfType"  class="form-control">
					<option selected  hidden='true' value="${activityParam.perfType}">${activityParam.perfType}</option>
					<option value='創意藝術'>創意藝術</option>
					<option value='視覺藝術'>視覺藝術</option>
					<option value='表演藝術'>表演藝術</option>
					</select>   
   
   </div><br>
   <span>
   <input type="text" class="form-control form-control-user" id="useraId" name="useraId"	placeholder="" value="${activityParam.useraId}" hidden='hidden'>
   <input type="text" class="form-control form-control-user" id="id" name="id"	placeholder="" value="${activityParam.id}"  hidden='hidden'>
   <input type="text" class="form-control form-control-user" id="awesomeNum" name="awesomeNum"	placeholder="" value="${activityParam.awesomeNum}"  hidden='hidden'>
   <input type="text" class="form-control form-control-user" id="locationId" name="locationId"	placeholder="" value="${activityParam.locationId}"  hidden='hidden'>
<%--    <input type="text" class="form-control form-control-user" id="locationId.city" name="locationId.city"	placeholder="" value="${activityParam.locationId.city}"  hidden='hidden'> --%>
<%--    <input type="text" class="form-control form-control-user" id="locationId.district" name="locationId.district"	placeholder="" value="${activityParam.locationId.district}"  hidden='hidden'> --%>
<%--    <input type="text" class="form-control form-control-user" id="locationId.address" name="locationId.address"	placeholder="" value="${activityParam.locationId.address}"  hidden='hidden'> --%>
   </span>
   
   </div>
   
   
    <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-calendar-alt"></i>活動期間:</span>
   <div class='input-group mb-3 col-8'>
   <div class='input-group-prepend'>
   <span class='input-group-text' style="font-weight: bold;padding-left:15px">起</span>
   </div>
   <input id="beginTime" name="beginTime" type="text"	class="form-control form-control-user" placeholder="BeginTime"	value="${activityParam.beginTime}" readonly="readonly" style="background-color:#ffffff;" />
   </div>
      
  <div class='input-group mb-3 col-8'>
   <div class='input-group-prepend'>
   <span class='input-group-text' style="font-weight: bold;padding-left:15px">至</span>
   </div>
   <input id="endTime" name="endTime" type="text"	class="form-control form-control-user" placeholder="EndTime"	value="${activityParam.endTime}" readonly="readonly" style="background-color:#ffffff;" />
   </div>
  
  
   </div>
  
  <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>活動描述: </span>
   <div class='col-8'>
   <textarea class="form-control form-control-user" id="description" name="description"	placeholder="" >${activityParam.description}</textarea>
   </div>
   </div>
  
  
 
   <div class="col-5" id='article'>
   
   </div>
 
   
   </div>  
   </div>
   
</div>




    </div>
  </div>
  		<button id="update" type="button"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text"> Edit This Activity</span>
						</button>

						<button id="reset" type="button"
							class="btn btn-danger btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-excel"></i>
							</span> <span class="text"> Reset Input</span>
						</button>
  </form>
</div>







		<jsp:include page="../chat.jsp"></jsp:include>	
		<!-- Footer -->

		<footer class="page-footer font-small blue" style="margin-top: 30px;">

			<div style="background-color: black; text-align: center">
				<div class="container">
					<div class="row">
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">訂閱街藝</span>
							<br> <br> <input type="email" size="26"
								placeholder="Email@" style="line-height: 30px;">
							<button type="button" class="btn btn-danger">訂閱</button>
						</div>
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">最新消息</span>
							<div class="row"
								style="border-bottom: 1px solid white; padding: 20px 0px;">
								<div class="col-4" style="text-align: right">
									<img src="/resources/user-bootstrap/img/index/artist2.gif"
										width="80%" style="border-radius: 15px;"> <br>
								</div>
								<div class="col-8" style="text-align: left">
									<a href="" class="btn btn-primary" style="font-size: 10px;">藝人</a>
									<br> <br> <span style="color: white">藝人標題</span> <br>
								</div>
							</div>
							<div class="row"
								style="border-bottom: 1px solid white; padding: 20px 0px;">
								<div class="col-4" style="text-align: right">
									<img src="/resources/user-bootstrap/img/index/artist3.jpg"
										width="80%" style="border-radius: 15px;"> <br>
								</div>
								<div class="col-8" style="text-align: left">
									<a href="" class="btn btn-danger" style="font-size: 10px;">文章</a>
									<br> <br> <span style="color: white">文章標題</span> <br>
								</div>
							</div>
							<div class="row" style="padding: 20px 0px;">
								<div class="col-4" style="text-align: right">
									<img src="/resources/user-bootstrap/img/index/artist6.jpg"
										width="80%" style="border-radius: 15px;"> <br>
								</div>
								<div class="col-8" style="text-align: left">
									<a href="" class="btn btn-success" style="font-size: 10px;">表演</a>
									<br> <br> <span style="color: white">表演標題</span> <br>
								</div>
							</div>
						</div>
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">最近瀏覽</span>
						</div>
					</div>
				</div>
			</div>

	<jsp:include page="../footer.jsp"></jsp:include>
	
		</footer>
		


</body>
 <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>
<script>
var thisaid = $("#thisp").val();
var thisuser = $("#thisuser").val();

$.ajax({
	url : "/activity/article/"+${activityParam.id},
	type : "GET",
	contentType : 'application/json;charset=UTF-8',
	dataType : 'json',
	success : function(res) {
// 			alert(JSON.stringify(res.data[0].name));
			if(res.type=="ERROR"){
				txt1 ="<span style='font-size: 20px; border-bottom: 3px solid black; font-weight: bold;'><i class='far fa-newspaper'></i>相關文章:<br></span>";
		 		txt2 ="<div id='"+${activityParam.id}+"'><span style='font-size: 20px; border-bottom: 1px solid black; font-weight: bold;'>暫無文章</span><br><a href='/article/add?user="+thisuser+"&refid="+thisaid+"&type=Activity' id='insertArticle'><span>點我新增<i class='fas fa-pencil-alt'></i></span></a></div>";
		 		txt3 = txt1+txt2;
				$("#article").append(txt3);
			}else{
			txt1 ="<span style='font-size: 20px; border-bottom: 3px solid black; font-weight: bold;'><i class='far fa-newspaper'></i>相關文章:<br></span>";
	 		$.each(res.data,function(index,value){
	 			txt2 ="<div onclick='popout(this)' style='cursor:pointer;' id='"+value.id+"'><span style='font-size: 20px; border-bottom: 1px solid black; font-weight: bold; color:HotPink'>"+value.name+"</span></div>";
	 		 	txt3 = txt1+txt2+ "<br><a href='/article/add?user="+thisuser+"&refid="+thisaid+"&type=Activity' id='insertArticle'><span>點我新增<i class='fas fa-pencil-alt'></i></span></a>";
	 		})
		
			$("#article").append(txt3);}
	}
})




function popout(obj){
	articleUrl = "/article/"+obj.id;
	window.open (articleUrl);
}

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
  
  
  
  
  
  
$(document).ready(function(){
	
	 $.ajax({
			url:"/activity/location/city",
			type:"POST",
			success: function(data){
				var txt="";		
				console.log(data);
				txt += "<option selected disabled hidden='true' value='${locationCity}'>"+"${locationCity}"+"</option>";
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
                   url: '/activity/location/'+ CName,
                   cache: false,
                   error: function(){
                       alert('發生錯誤');
                   },
                   success: function(data){
   					var txt="";		
   					console.log(data);
   					txt += '<option value="" style="display: none">請選擇鄉鎮市區</option>';
   					txt5 = '<option value="" style="display: none" >請先選擇鄉鎮市區</option>';
   					$.each(data,function(index,value){
   						txt += 	"<option value='"+ value +"'>"+ value +"</option>";			
   					})
   					txt2 ="<span style='font-size: 20px; font-weight: bold;padding-left:15px;color:red;'>" + CName +"<i class='fas fa-pen-fancy fa-sm' style='color:Mediumslateblue;'></i>"+"</span>";
   					$("#mappingIcon").attr("class","fas fa-spinner fa-pulse");
   					$("#mappingIcon").attr("style","color:RoyalBlue");
   					$("#addressInfo").empty();
   					$("#addressInfo").append(txt2);
   					$("#district").html(txt);
   					$("#locationName").html(txt5);
   					
   				}
               });
           });
           $('#district').change(function(){
        	   var CName= $('#city').val();
        	   var DisN= $('#district').val();
               $.ajax({
                   type: "POST",
                   url: '/activity/location/district/'+ DisN,
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
   					
   					txt2 ="<span style='font-size: 20px; font-weight: bold;padding-left:15px;color:red;'>" + CName + DisN +"<i class='fas fa-pen-fancy fa-sm' style='color:Mediumslateblue;'></i>"+"</span>";
   					$("#mappingIcon").attr("class","fas fa-spinner fa-pulse");
   					$("#mappingIcon").attr("style","color:RoyalBlue");
   					$("#addressInfo").empty();
   					$("#addressInfo").append(txt2);
   					$("#locationName").html(txt);
   					
   				}
               });
           });
           
           $("#locationName").change(function(){
               var LN= $("#locationName").val();
               var city1 = $("#city").val();
               var district1 = $("#district").val();
               $.ajax({
                   type: "POST",
                   url: '/activity/location/address/'+ LN,
                   cache: false,
                   error: function(){
                       alert('發生錯誤');
                   },
                   success: function(data){
                	  txt ="<span style='font-size: 20px; font-weight: bold;padding-left:15px'>" + data[0]['city']+data[0]['district']+data[0]['address'] +"<i class='fas fa-glass-cheers' style='color:Magenta'></i></span>";
                	  txtLocationid = data[0]['locationId'];
                	  
                	  $("#locationId").attr("value",txtLocationid);
                	  $("#mappingIcon").attr("class","fas fa-map-marker-alt");
                	  $("#mappingIcon").attr("style","color:black");
                	  $("#addressInfo").empty();
                	  $("#addressInfo").append(txt);
   					
   				}
               });
           });
           
       });
       
       
       
       
$("#update").click(
		function() {
			$.ajax({
				url : '/activity/update',
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

		
			function activityMap() {
	var	map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : ${vender.lat},
				lng :  ${vender.lng}
			},
			 draggable: false,
			clickableIcons : false,
			zoom : 16.5,
			minZoom : 16,
			maxZoom : 20,
			disableDefaultUI : true,
			styles : [ {
				"featureType" : "poi.business",
				"stylers" : [ {
					"visibility" : "off"
				} ]
			}, {
				"featureType" : "poi.park",
				"elementType" : "labels.text",
				"stylers" : [ {
					"visibility" : "off"
				} ]
			} ]
		});
	
	start();
	
	
	}
		
		
		
		
</script>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=activityMap"
	async defer></script>

</html>