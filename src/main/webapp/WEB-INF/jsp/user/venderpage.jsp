<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
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
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../topbar.jsp"></jsp:include>


	<div class="container">
		<!-- /.container-fluid -->

		<div class='col-sm-12 mb-0 mb-sm-0'>
			<img class='col-sm-12 mb-0 mb-sm-0' src="${vender.img}">
		</div>
		<!-- 廠商名 -->
		<div class="d-sm-flex align-items-center justify-content-between mb-6">
			<div class='col-sm-12 mb-3 mb-sm-6' style="text-align: center">
				<h1 class="text">${vender.name}</h1>
			</div>
		</div>



		<!-- 廠商資料內容 -->
		<div class='row' style='border: solid 1px silver; margin: 2%'>
	<div class='col-sm-12 mb-0 mb-sm-0'><br></div>
			<div class='col-sm-5 mb-0 mb-sm-0'>
				<div class='col-sm-12 mb-0 mb-sm-0'>
					<h4>最大容納人數:${vender.maxPeople}</h4>
				</div>
			</div>
			<div class='col-sm-5 mb-0 mb-sm-0'>
				<div class='col-sm-12 mb-0 mb-sm-0'>
					<h4>預約專線:${vender.phone} ${vender.contactPerson}</h4>
				</div>
			</div>
			<div class='col-sm-7 mb-0 mb-sm-0'>
				<div class='col-sm-12 mb-0 mb-sm-0'>
					<h4>地址:</h4>
				</div>
				<h5 style='padding-left: 10%'>${vender.city}${vender.district}
					${vender.address}</h5>
				<div class='col-sm-12 mb-0 mb-sm-0'>
					<h4>關於我們:</h4>
				</div>
				<div class='col-sm-12 mb-3 mb-sm-0'>
					<h5
						style='border: solid 1px silver; text-align: center; padding: 1%'>
						${vender.introduction}</h5>
				</div>

			</div>
			<div class='col-sm-5 mb-3 mb-sm-6' id="map" style='height: 250px'></div>
		</div>
		<!-- 廠商資料內容END -->









		<div >
		<div  class='row' style='margin-left: 2%; margin-right: 2%'>
		<div class='col-sm-10 mb-0 mb-sm-0'></div><div class='col-sm-2 mb-0 mb-sm-0' id='addnewjob' onclick='addnewjob()'><label
		class='btn btn-primary my-2 my-sm-0'>新增工作</label></div>
		</div>
			<div  class='row' style='border: solid 1px silver; margin-left: 2%; margin-right: 2%' id='joblist'> 
			<div class='col-sm-12 mb-0 mb-sm-0'>
				<h3 style='text-align: center'>jobname</h3>
			</div>
			<div class='col-sm-4 mb-0 mb-sm-0'>
				<h4>類別:obj.type</h4>
			</div>
			<div class='col-sm-4 mb-0 mb-sm-0'>
				<h4>時間:obj.time</h4>
			</div>
			<div class='col-sm-4 mb-0 mb-sm-0'>
				<h4>薪資:obj.reward</h4>
			</div>
			<div class='col-sm-12 mb-0 mb-sm-0' style='padding: 1%'>
				<h4 style='text-align: center'>詳細內容</h4>
				<textarea class='form-control' name='description'
					style='resize: none; text-align: center' readonly>obj.detal</textarea>
			</div>

			<button class='col-sm-12 mb-0 mb-sm-0' style='text-align: center'
				onclick='showapplication(this.id)' id='1'>申請表</button>
			<div class='col-sm-12 mb-0 mb-sm-0' id='application1'
				style='display: none'>

				<!-- 			申請表 -->
				<div class='row' style='margin: 0% 1%'>
					<a class='col-sm-4 mb-0 mb-sm-0' href='/obj.username'>
						<h4>obj.name</h4>
					</a>
					<div class='col-sm-4 mb-0 mb-sm-0'>
						<h4>obj.time</h4>
					</div>
					<div class='col-sm-2 mb-0 mb-sm-0'>
						<button
							class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>接受</button>
					</div>
					<div class='col-sm-2 mb-0 mb-sm-0'>
						<button
							class='d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm'>拒絕</button>
					</div>
				</div>


			</div>
</div>
		</div>


	</div>



	<br>
	<br>
	<br>
	<form id="venderinfo" name="vender" id='venderobj'
		method="POST" hidden>
		<input id="venderId" name="id" value="${vender.id}">
	</form>

<input hidden="hidden" name="userName" value="<sec:authentication property="name" />" id="username">

</body>
<jsp:include page="../footer.jsp"></jsp:include>

<script>
	function venderMap() {
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



<script>

function addnewjob(){
	window.location.assign('/job/vender/'+${vender.id}+'/newjob');
}


	


function start(){
// 	alert($("#venderId").val());
	$.ajax({
	url :"/job/findByVender",
	type :"post",
	dataType : "json",
	contentType : 'application/json;charset=utf-8',
	data :$("#venderId").val(),
	success : function(data) {
		var txt = "";
		$.each(data,function(key, obj){
	console.log(obj)
		txt +="<div class='col-sm-12 mb-0 mb-sm-0'><h3 style='text-align: center'>"	
		txt +=obj.name
		txt +="</h3></div><div class='col-sm-3 mb-0 mb-sm-0'><h4>類別:"
		txt +=obj.jobType
		txt +="</h4></div><div class='col-sm-3 mb-0 mb-sm-0'><h4>時間:"	
		txt +=obj.jobTime		
		txt +="</h4></div><div class='col-sm-2 mb-0 mb-sm-0'><h4>薪資:";
		txt +=obj.reward;
		txt +="</h4></div><div class='col-sm-4 mb-0 mb-sm-0'><h4>已定表演者:<a href='/";
		txt +=obj.user.account;
		txt +="'>"
		txt +=obj.user.displayName;
		txt +="</a></h4></div><div class='col-sm-12 mb-0 mb-sm-0' style='padding: 1%'><h4 style='text-align: center'>詳細內容</h4><textarea class='form-control' name='description' style='resize: none; text-align: center' readonly>";	
		txt +=obj.detal;	
		txt +="</textarea></div><button class='col-sm-12 mb-0 mb-sm-0' style='text-align: center'onclick='toggleapplication(this)' id='";	
		txt +=obj.id;
		txt +="'>申請表</button><div class='col-sm-12 mb-0 mb-sm-0' id='job";
		txt +=obj.id;
		txt +="'style='display:none'>test</div>";
		});
		$("#joblist").html(txt);
	}
 })
};





function toggleapplication(object){
	var id=object.id;
	
	$.ajax({
		url :"/job/findUserId/"+$("#username").val(),
		type :"GET",
		
		success : function(data) {
			var t=${user.userId};
			if(t=="")
			t=0;
			if(data.userId==${user.userId})
			{			
			$("#job"+id).toggle();
			showapplication(id);
			}else{
				alert("只有廠商可以看申請名單")
				
			}
			
// 			
		}
	});	
	
	
	
// 	alert(${user.userId})
	
	
	
	
};

function resp(object){
	var jobId=$(object).parent().parent().attr('id');
// 	alert($(object).parent().parent().attr('id'))
	var userId=$(object).parent().attr('id');
// 	alert($(object).parent().attr('id'))
	var resp=$(object).text();
// 	alert($(object).text())
	
	
	if(resp=='接受'){
		resp='accept';
	}else if(resp='拒絕'){
		resp='reject';
	};

	
	$.ajax({
		url :"/job/respapplication/"+jobId+"/"+userId+"/"+resp,
		type :"GET",
		success : function(data) {
			alert(data.mes)
			window.setTimeout(function() {
				start();
			}, 50);	
			

		}
	});	

	

	
};





function showapplication(id){
// 	alert(id)
	$.ajax({
		url :"/job/applicationFindByJobId",
		type :"post",
		dataType : "json",
		contentType :"application/json;charset=utf-8",
		data :id,
		success : function(data) {
			var txt="";
			$.each(data.rows,function(key, obj){
				txt +="<div class='row' style='border: solid 1px black;margin:0% 1px' id='user"
				txt += obj.user.userId;
				txt +="'><a style='text-align:center;border:solid 1px silver' class='col-sm-5 mb-0 mb-sm-0' href='/";
				txt +=obj.user.username;
				txt +="'><h4>";
				txt +=obj.user .displayName;
				txt +="</h4></a><div class='col-sm-5 mb-0 mb-sm-0' style='border:solid 1px silver'><h5>";
				txt +=obj.applicationTime;
				txt +="</h5></div><div class='col-sm-1 mb-0 mb-sm-0' style='border:solid 1px silver'  onclick='resp(this)'><button  class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>接受</button></div><div class='col-sm-1 mb-0 mb-sm-0' style='border:solid 1px silver' onclick='resp(this)'><button class='d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm' >拒絕</button></div></div>";
// 				alert(obj.user.username)
	
			})
			$("#job"+id).html(txt);
		}
	});	
	
	
	
}



</script>


<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=venderMap"
	async defer></script>

</html>