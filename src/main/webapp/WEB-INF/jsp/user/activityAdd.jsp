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

<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
	width: 1000px;
}

.body {
	height: 100%;
}

/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>	
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
    <a class="navbar-brand" href="#" id='title'>新增活動頁面</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <button class="btn btn-muted">新增活動
                <span class="sr-only">(current)</span>
              </button>
        </li>
        <li class="nav-item">
          <button class="btn btn-primary" onclick='javascript:window.location.assign("/activity/list")'>返回查詢頁面</button>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">

  <input type="text" class="form-control form-control-user" id="useraId" name="useraId"	 value="${useraId}" hidden='hidden'>
  <div class="card border-0 shadow my-5">
    <div class="card-body p-5">
    <div id='dataDiv'>
    
   <form method="post" action="/activity/uploadActivityPhoto" enctype="multipart/form-data"> 
    <div class='row'>
    
    <div  style='position:relative'> 
    <div id='clickUpdatePhoto'>   
   <img src='/resources/user-bootstrap/img/activity/activityDefault.jpg' style='height:280px;border-radius:20px;width:500px'>
   </div>
   </div>
   
   
   
   <div class='col-sm-6 mb-3 mb-sm-6' id="map" style='height:280px;border-radius:20px;width:500px;border-color:DarkGrey; border-style:solid;margin-left:10px'>
   </div>
  	</div>
  <input type="file" name="imageFile" id="imageFile"
						accept="image/gif, image/jpeg, image/png" style='display:none' /> <input type="text"
						hidden="hidden" name="activityId" id="activityId"
						value="${activityParam.nextId}"> 
			<input	type="submit" value="Upload" id='pictureSubmit' style='display:none' />
  
  </form>
  
  <script>
//   	$("#clickUpdatePhoto").click(function(){
//   		$("#imageFile").trigger("click");
//   	});
//   	$("#imageFile").change(function() {
// 		$("#clickUpdatePhoto").html("<img src='' style='height:280px;border-radius:20px;width:500px' id='activityPic'>");
// 		readURL(this);
// 		$("#pictureSubmit").trigger("click");
// 	});

// 	function readURL(input) {
// 		if (input.files && input.files[0]) {
// 			var reader = new FileReader();
// 			reader.onload = function(e) {
// 				$("#activityPic").attr('src', e.target.result);
// 			}
// 			reader.readAsDataURL(input.files[0]);
// 		}
// 	}
  	
  	
  	</script>
  
  
  <form id="form"  name="form" class="user" autocomplete="off">
   <div style='padding-top:20px' id="塞資料處">
   <div class='row'>
   
   <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>表演者名:</span>
   <div class='col-8'>
   <input type="text" class="form-control form-control-user" id="artist" name="artist"	placeholder="" value="${userName}" readonly>
   </div>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i id='mappingIcon' class="fas fa-map-marker-alt"></i>活動詳細地址: </span>
   <div class='col-11' id='addressInfo'>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px"></span>
   </div>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>活動名稱: </span>
   <div class='col-8'>
   <input type="text" class="form-control form-control-user" id="name" name="name">
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
						<option selected  hidden='true' >市區</option>
						</select>
						</div>
						<div class="col-sm-5 mb-3 mb-sm-0">
						<select  name="locationName" id="locationName"  class="form-control">
						<option selected  hidden='true'>活動地點</option>
						</select>
						</div>
	</div>
   </div>
   
   <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>表演類型:</span>
   <div class='col-8'>
	<select  name="perfType" id="perfType"  class="form-control">
					<option selected  hidden='true' value="">請選擇表演類型</option>
					<option value='創意藝術'>創意藝術</option>
					<option value='視覺藝術'>視覺藝術</option>
					<option value='表演藝術'>表演藝術</option>
					</select>   
   
   </div><br>
   <span>
   <input type="text" class="form-control form-control-user" id="locationId" name="locationId"	placeholder="" value=""  hidden='hidden'>
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
   <input id="beginTime" name="beginTime" type="text"	class="form-control form-control-user" placeholder="請輸入起始時間"	readonly="readonly" style="background-color:#ffffff;" />
   </div>
      
  <div class='input-group mb-3 col-8'>
   <div class='input-group-prepend'>
   <span class='input-group-text' style="font-weight: bold;padding-left:15px">至</span>
   </div>
   <input id="endTime" name="endTime" type="text"	class="form-control form-control-user" placeholder="請輸入結束時間" readonly="readonly" style="background-color:#ffffff;" />
   </div>
  
  
   </div>
  
  <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="far fa-smile-beam"></i>活動描述: </span>
   <div class='col-12'>
   <textarea class="form-control form-control-user" id="description" name="description"	 ></textarea>
   </div>
   </div>
  
  
 
   <div class="col-5" id='article'>
   
   </div>
 
   
   </div>  
   </div>
   </form>
</div>




    </div>
  </div>
  		<button id="insert" type="button"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text"> 新增活動</span>
						</button>

						<button id="reset" type="button"
							class="btn btn-danger btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-excel"></i>
							</span> <span class="text"> 取消</span>
						</button>
  
</div>









		<jsp:include page="../chat.jsp"></jsp:include>	
		<!-- Footer -->

		

	<jsp:include page="../footer.jsp"></jsp:include>
	
	
		


</body>
 <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>
<script>
var thisaid = $("#thisp").val();
var thisuser = $("#thisuser").val();




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
  
var	map
var self;
var marker;
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat :  25.0337113,
				lng :  121.543364
			},
			 draggable: true,
			clickableIcons : false,
			zoom : 21,
			minZoom : 16,
			maxZoom : 21,
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
	
	self = new google.maps.Marker({
		position : {

			lat : map.getCenter().lat(),
			lng : map.getCenter().lng()
		},
		map : map
	});
	
	
	
	
	
	};

	function changeCenter(){
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
		        'address':$("#addressForMap").html(),
		    }, function (results, status) {
		        if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
	            map.setZoom(15);
	            self.setPosition(results[0].geometry.location);
		    }
		        
		});	

	};




  
  
  
  
$(document).ready(function(){

// 	initMap();
	 $.ajax({
			url:"/activity/location/city",
			type:"POST",
			success: function(data){
				var txt="";		
				console.log(data);
				txt += "<option selected disabled hidden='true'>縣市</option>";
				$.each(data,function(index,value){
					txt += 	"<option value='"+ value +"'>"+ value +"</option>"			
					})	
				$("#city").html(txt);
				
			}
		})
           
           $('#city').change(function(){
               var CName= $('#city').val();
//                changeCenter();
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
   					txt2 ="<span style='font-size: 20px; font-weight: bold;padding-left:15px;color:red;'>"+"<div id='addressForMap'>" + CName +"</div>"+"</span>";
   					$("#mappingIcon").attr("class","fas fa-spinner fa-pulse");
   					$("#mappingIcon").attr("style","color:RoyalBlue");
   					$("#addressInfo").empty();
   					$("#addressInfo").append(txt2);
   					$("#district").html(txt);
   					$("#locationName").html(txt5);
   					window.setTimeout(function() {
   						changeCenter();
					}, 50);
   					
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
   					
   					txt2 ="<span style='font-size: 20px; font-weight: bold;padding-left:15px;color:red;'>"+"<div id='addressForMap'>"+ CName + DisN +"</div>"+"</span>";
   					$("#mappingIcon").attr("class","fas fa-spinner fa-pulse");
   					$("#mappingIcon").attr("style","color:RoyalBlue");
   					$("#addressInfo").empty();
   					$("#addressInfo").append(txt2);
   					$("#locationName").html(txt);
   					window.setTimeout(function() {
   						changeCenter();
					}, 50);
   					
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
                	  txt ="<span style='font-size: 20px; font-weight: bold;padding-left:15px'>" +"<div id='addressForMap'>"+ data[0]['city']+data[0]['district']+data[0]['address'] +"</div>"+"</span>";
                	  txtLocationid = data[0]['locationId'];
                	  
                	  $("#locationId").attr("value",txtLocationid);
                	  $("#mappingIcon").attr("class","fas fa-map-marker-alt");
                	  $("#mappingIcon").attr("style","color:black");
                	  $("#addressInfo").empty();
                	  $("#addressInfo").append(txt);
                	  window.setTimeout(function() {
     						changeCenter();
  					}, 50);
   				}
               });
           });
           
       });
       
       
       
       
$("#insert").click(
		function() {
			$.ajax({
				url : '/activity/insert',
				method : 'GET',
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				data : JSON.parse($("#form").serializeObject()),
				success : function(response) {
					if (response.type == "SUCCESS") {
						alert("資料新增成功！\n您修改了一筆名為："
								+ JSON.stringify(response.data.name)+"\n即將導入活動頁面");
// 						alert(response.data['id']);
						window.location.assign('/activity/view/'+response.data['id']);
					} else {
						alert("資料新增失敗！請檢查輸入欄位！");
					}
				},
				error : function(re) {
					alert("資料新增失敗！請檢查輸入欄位！");
				}
			})
		})
	
		
// var form = $('#form').get(0);  
// var formdata = new FormData(form);  
// 		$("#clickUpdatePhoto").click(
// 		function() {		
// 			$("#imageFile").trigger("click");	
// 			$("#imageFile").change(function() {
// 		 		$("#clickUpdatePhoto").html("<img src='' style='height:280px;border-radius:20px;width:500px' id='activityPic'>");
// 		 		readURL(this);
// 		 		$.ajax({
// 					url : '/activity/addActivityPhoto',
// 					method : 'Post',
// 					async: false,  
// 			        cache: false,  
// 			        contentType: false,  
// 			        processData: false,
// 					data : formdata,
// 					success : function(response) {
// 						alert("成功!")
// 					},
// 					error : function(re) {
// 						alert("失敗！");
// 					}
// 				})
		 		
		 		
// 		 	});
					
// 		})
		
		

</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=initMap"
	async defer></script>


</html>