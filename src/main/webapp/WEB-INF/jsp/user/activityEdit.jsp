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
          <button class="btn btn-success" id='newActivity'>新增活動
                <span class="sr-only">(current)</span>
              </button>
        </li>
        <li class="nav-item">
          <button class="btn btn-info" onclick='javascript:window.location.assign("/activity/list")'>返回查詢頁面</button>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">

  <div class="card border-0 shadow my-5">
    <div class="card-body p-5">
    <div id='dataDiv'>
    
    <form method="post" action="/activity/uploadActivityPhoto" enctype="multipart/form-data">
    <div class='row'>
  
    <div  style='position:relative'> 
    <div id='clickUpdatePhoto'>   
   <img src='/resources/user-bootstrap/img/activity/activity${activityParam.id}.jpg' style='height:280px;border-radius:20px;width:500px'>
   </div>
   </div>
 
  <div class='col-sm-6 mb-3 mb-sm-6' id="map" style='height:280px;border-radius:20px;width:500px;border-color:DarkGrey; border-style:solid;margin-left:10px'>
   </div>
  	</div>
  	<input type="file" name="imageFile" id="imageFile"
						accept="image/gif, image/jpeg, image/png" style='display:none' /> <input type="text"
						hidden="hidden" name="activityId" id="activityId"
						value="${activityParam.id}"> 
			<input	type="submit" value="Upload" id='pictureSubmit' style='display:none' />
  	</form>
  	
  	<script>
  	$("#clickUpdatePhoto").click(function(){
  		$("#imageFile").trigger("click");
  	});
  	$("#imageFile").change(function() {
		$("#clickUpdatePhoto").html("<img src='' style='height:280px;border-radius:20px;width:500px' id='activityPic'>");
		readURL(this);
		$("#pictureSubmit").trigger("click");
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#activityPic").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	};
	
	 function clickInfo(){
	  		$("#name").val("兒童新樂園不見不散～");
	  		$("#description").val("台北兒童新樂園，暑假開始的第一場演出！讓我們一起帥一波吧！如果你有看到此文，當天來的話，我們一起穿白色吧！穿白衣者有機會獲得好康，耶～");
	  		
	  	};
  	
  	
  	</script>
  	
  	
  <form id="form" name="form" class="user" autocomplete="off">
   <div style='padding-top:20px' id="塞資料處">
   <div class='row'>
   
   <div class="col-6">
   <span style="font-size: 20px; font-weight: bold;"><i class="fas fa-user"></i>表演者名: </span>
   <div class='col-8 input-group mb-3'>
   <input type="text" class="form-control form-control-user" id="artist" name="artist"	placeholder="" value="${activityParam.artist}" readonly>
   <div class="input-group-append">
    <input type='button' class="btn btn-success" onclick='clickInfo()' value='一鍵編輯'></input> 
  </div>
   </div>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i id='mappingIcon' class="fas fa-map-marker-alt"></i>活動詳細地址: </span>
   <div class='col-11' id='addressInfo'>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px;position:absolute" id='addressForMap' >${locationCity}${locationDistrict}${locationAddress}</span>
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
   <span style="font-size: 20px; font-weight: bold;"><i class="fas fa-hat-wizard"></i>表演類型:</span>
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
   <span style="font-size: 20px; font-weight: bold;"><i class="fas fa-audio-description"></i>活動描述: </span>
   <div class='col-12'>
   <textarea class="form-control form-control-user" id="description" name="description"	placeholder="" >${activityParam.description}</textarea>
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
  		<button id="update" type="button"
							class="btn btn-primary btn-user btn-block">
							<span class="icon text-white-50"> <i
								class="fas fa-file-import"></i>
							</span> <span class="text"> 編輯活動</span>
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
var self;
var marker;
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
	 		 	txt3 = txt1+txt2+ "<br><a href='/article/add?user="+thisuser+"&refid="+thisaid+"&type=Activity' id='insertArticle' onclick='window.open(this.href,'window','width=500,height=500')'><span>點我新增<i class='fas fa-pencil-alt'></i></span></a>";
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
//             changeCenter();
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
       
       
// function changeCenter(){
// 	var geocoder = new google.maps.Geocoder();
// 	geocoder.geocode({
// 	        'address':$("#addressForMap").html(),
// 	    }, function (results, status) {
// 	        if (status == google.maps.GeocoderStatus.OK) {
// 			map.setCenter(results[0].geometry.location);
//             map.setZoom(15);
//             self.setPosition(results[0].geometry.location);
// 	    }
	        
// 	});	

// };
       
       
       
$("#update").click(
		function() {
			$.ajax({
				url : '/activity/update',
				method : 'GET',
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				data : JSON.parse($("#form").serializeObject()),
				success : function(response) {
					if (response.type == "SUCCESS") {
						alert("資料修改成功！\n您修改了一筆名為："
								+ JSON.stringify(response.data.name)+"\n即將導入活動頁面");
						window.location.assign('/activity/view/'+response.data['id']);
					} else {
						alert("資料修改失敗！請檢查輸入欄位！");
					}
				},
				error : function(re) {
					alert("資料修改失敗！請檢查輸入欄位！");
				}
			})
		})

		
var geocoder, map, marker;
function initMap(address) {
	var address = $("#addressForMap").text();
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        'address': address
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var myOptions = {
                zoom: 18,
                center: results[0].geometry.location,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map = new google.maps.Map(document.getElementById('map'), myOptions);

             marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        }
    });
}
		
function changeCenter(){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
	        'address':$("#addressForMap").html(),
	    }, function (results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
			map.setCenter(results[0].geometry.location);
            map.setZoom(15);
            marker.setPosition(results[0].geometry.location);
	    }
	        
	});	

};	

$("#newActivity").click(function(){
	var user = $("#thisuser").val();
	if(user=="anonymousUser"){
		var login = confirm("請先登入");
		if(login==true){window.open("/login")+(location.href).substring(7);}
	}else{
		window.location.assign("/activity/add");
	}
})
		
		
</script>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=initMap"
	async defer></script>

</html>