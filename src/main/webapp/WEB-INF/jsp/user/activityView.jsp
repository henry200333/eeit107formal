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
    <a class="navbar-brand" href="#" id='title'>活動詳情</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">新增活動
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/activity/list">返回查詢頁面</a>
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
    
    
    <div class='row'>
    <div >
   <img src='/resources/user-bootstrap/img/activity/activity${activityParam.id}.jpg' style='height:280px;border-radius:20px;width:500px'>
   </div>
   <div class='col-sm-6 mb-3 mb-sm-6' id="map" style='height:280px;border-radius:20px;width:500px;border-color:DarkGrey; border-style:solid;margin-left:10px'>

   </div>
  	</div>
  
   <div style='padding-top:20px' id="塞資料處">
   <div class='row'>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="fas fa-user"></i>表演者名: </span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${activityParam.artist}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="far fa-smile-beam"></i>活動地點: </span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${locationLocationName}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="far fa-smile-beam"></i>活動名稱: </span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px" id='activityName'>${activityParam.name}</span>
   </div>
   
    <div class="col-12">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="far fa-calendar-alt"></i>活動期間:</span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${beginTime} 至   ${endTime}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="fas fa-hat-wizard"></i>表演類型:</span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${activityParam.perfType}</span><br>
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i	class="fab fa-hotjar"></i>追蹤人數:</span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${activityParam.awesomeNum}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i	class="fab fa-hotjar"></i>地址:</span><br>
   <span style="font-size: 20px; font-weight: bold;padding-left:20px" id='addressForMap'>${locationCity}${locationDistrict}${locationAddress}</span>
   </div>
   <div class="col-6" id='article'>
   
   </div>
   <div class="col-6" id='subdiv' style='margin-top:10px'>
   <button type="button" class="btn btn-danger" id="sub">
		<i class="fas fa-plus" style="color: white" id="subpic"></i><span id="subhtml">追蹤活動</span>
	</button>
   </div>
 	
   
   </div>  
   </div>
   
</div>




    </div>
    
    <!-- 留言放這 -->
    
    
    
    
  </div>
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

<script>
$.ajax({
	url : "/activity/article/"+${activityParam.id},
	type : "GET",
	contentType : 'application/json;charset=UTF-8',
	dataType : 'json',
	success : function(res) {
// 			alert(JSON.stringify(res.data[0].name));
			if(res.type=="ERROR"){
				txt1 ="<span style='font-size: 20px; border-bottom: 3px solid black; font-weight: bold;'><i class='far fa-newspaper'></i>相關文章:<br></span>";
		 		txt2 ="<div id='"+${activityParam.id}+"'><span style='font-size: 20px; border-bottom: 1px solid black; font-weight: bold; color:red'>暫無文章</span></div>";
		 		 txt3 = txt1+txt2;
				$("#article").append(txt3);
			}else{
			txt1 ="<span style='font-size: 20px; border-bottom: 3px solid black; font-weight: bold;'><i class='far fa-newspaper'></i>相關文章:<br></span>";
	 		$.each(res.data,function(index,value){
	 			txt2 ="<div onclick='popout(this)' style='cursor:pointer;' id='"+value.id+"'><span style='font-size: 20px; border-bottom: 1px solid black; font-weight: bold; color:red'>"+value.name+"</span></div>";
	 		 	txt3 = txt1+txt2;
	 		})
		
			$("#article").append(txt3);}
	}
})

function popout(obj){
	articleUrl = "/article/"+obj.id;
	window.open (articleUrl);
}




var thisaid = $("#thisp").val();
var thisuser = $("#thisuser").val();
$.ajax({
	url:"/activity/checkuser",
	type:"POST",
	data:{
		"id":thisaid,
		"username":thisuser
	},
	success:function(data){
		if(data==true){
			var txt="<button type='button' class='btn btn-success' id='editp'>"
				txt+="<i class='fas fa-edit'></i><span>編輯活動</span></button>";
				$("#subdiv").html(txt);
		}
		$("#editp").click(function(){
			window.location.href="/activity/edit/"+${activityParam.id};
		})
	}
})


	$("#sub").click(function(){
						var user = $("#thisuser").val();
						if(user=="anonymousUser"){
							var login = confirm("請先登入");
							if(login==true){window.open("/login")+(location.href).substring(7);}
						}else{
							//追蹤
							var thispid = $("#thisp").val();
// 							$.ajax({
// 								url:'/user/performance/addfriend',
// 								data:{"id":thispid,
// 									"username":user									
// 								},
// 								success:function(data){
									
// 								}
// 							})
							
							var activityName = $("#activityName").html();
							alert("已追蹤活動:"+activityName);
							$("#sub").attr('class','btn btn-success');
							$("#subpic").attr('class','fas fa-star');
							$("#subhtml").html("已追蹤");
							
							
						}
						
					})
					
	
	
var geocoder, map;
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

            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        }
    });
}
					
	
					
					
					
					
					
// var	map
// var self;
// var marker;
// function initMap() {	
// 	map = new google.maps.Map(document.getElementById('map'), {
// 		center : {
// 				lat :  25.0337113,
// 				lng :  121.543364
// 			},
// 			 draggable: true,
// 			clickableIcons : false,
// 			zoom : 21,
// 			minZoom : 16,
// 			maxZoom : 20,
// 			disableDefaultUI : true,
// 			styles : [ {
// 				"featureType" : "poi.business",
// 				"stylers" : [ {
// 					"visibility" : "off"
// 				} ]
// 			}, {
// 				"featureType" : "poi.park",
// 				"elementType" : "labels.text",
// 				"stylers" : [ {
// 					"visibility" : "off"
// 				} ]
// 			} ]
// 		});
	
// 	self = new google.maps.Marker({
// 		position : {

// 			lat : map.getCenter().lat(),
// 			lng : map.getCenter().lng()
// 		},
// 		map : map
// 	});
	
// 	};
	
// function changeCenter(){
// 		var geocoder = new google.maps.Geocoder();
// 		geocoder.geocode({
// 		        'address':$("#addressForMap").html(),
// 		    }, function (results, status) {
// 		        if (status == google.maps.GeocoderStatus.OK) {
// 				map.setCenter(results[0].geometry.location);
// 	            map.setZoom(15);
// 	            self.setPosition(results[0].geometry.location);
// 		    }	        
// 		});	
// 	};


// 	changeCenter();
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=initMap"
	async defer></script>


</html>