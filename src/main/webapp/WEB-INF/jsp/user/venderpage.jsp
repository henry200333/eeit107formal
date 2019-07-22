<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<h1 class="text">${vender.name }</h1>
			</div>
		</div>



		<!-- 廠商資料內容 -->
		<div class='row' style='border: solid 1px silver; margin: 2%'>

			<div class='col-sm-7 mb-0 mb-sm-0'>
				<div class='col-sm-12 mb-0 mb-sm-0'>
					<h4>地址:</h4>
				</div>
				<h6 style='padding-left: 10%'>${vender.city}${vender.district}
					${vender.address}</h6>
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


		<div class='row'
			style='border: solid 1px silver; margin-left: 2%; margin-right: 2%'
			id='joblist'>
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
			<div class='col-sm-12 mb-0 mb-sm-0' id='application1' style='display:none'>
			
<!-- 			申請表 -->
				<div class='row' style='margin:0% 1%'>
				<a class='col-sm-4 mb-0 mb-sm-0' href='/obj.username'><h4>obj.name</h4></a>
				<div class='col-sm-4 mb-0 mb-sm-0'><h4>obj.time</h4></div>
				<div class='col-sm-2 mb-0 mb-sm-0'><button class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>接受</button></div>
				<div class='col-sm-2 mb-0 mb-sm-0'><button class='d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm'>拒絕</button></div>
				</div>
		

		</div>

	</div>


	</div>




	<form id="venderinfo" name="vender" action="/user/job/findByVender"
		method="POST" hidden>
		<input id="venderId" name="id" value="${vender.id}">
	</form>


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
function start(){
	$.ajax({
	url :"/job/findByVender",
	type :"post",
	dataType : "json",
	contentType : 'application/json;charset=utf-8',
	data :$("#venderId").val(),
	success : function(data) {
		var txt = "";
		$.each(data,function(key, obj){
	alert(obj.name)
		txt +="<div class='col-sm-12 mb-0 mb-sm-0'><h3 style='text-align: center'>"	
		txt +=obj.name
		txt +="</h3></div><div class='col-sm-4 mb-0 mb-sm-0'><h4>類別:"
		txt +=obj.jobType
		txt +="</h4></div><div class='col-sm-4 mb-0 mb-sm-0'><h4>時間:"	
		txt +=obj.jobTime		
		txt +="</h4></div><div class='col-sm-4 mb-0 mb-sm-0'><h4>薪資:";
		txt +=obj.reward;
		txt +="</h4></div><div class='col-sm-12 mb-0 mb-sm-0' style='padding: 1%'><h4 style='text-align: center'>詳細內容</h4><textarea class='form-control' name='description' style='resize: none; text-align: center' readonly>";	
		txt +=obj.detal;	
		txt +="</textarea></div><button class='col-sm-12 mb-0 mb-sm-0' style='text-align: center'onclick='showapplication(this.id)' id='";	
		txt +=obj.id;
		txt +="'>申請表</button><div class='col-sm-12 mb-0 mb-sm-0' id='application";
		txt +=obj.id;
		txt +="'style='display:none'></div>";
		});
		$("#joblist").html(txt)
	}
 })
};

function showapplication(object){
	$("#application"+object).toggle();
	
}

</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=venderMap"
	async defer></script>

</html>