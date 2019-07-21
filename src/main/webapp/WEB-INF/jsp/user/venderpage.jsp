<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=initMap" async defer></script>
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
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../topbar.jsp"></jsp:include>
<body>













	<div class="container">
		<!-- /.container-fluid -->


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
				<h6 style='padding-left: 10%'>
					${vender.city} ${vender.district} ${vender.address}</h6>
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







	</div>


	<jsp:include page="../footer.jsp"></jsp:include>




</body>


<script>
$.ajax({
	url : "/user/job/findByVender",
	type : "POST",
	data : ${vender.name},
	success : function(data) {
		alert("success")
	}
})



	function initMap() {
	var	map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 25.0282131,
				lng : 121.5359507
			},
			clickableIcons : false,
			zoom : 17.5,
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
	}
	initMap();
</script>
</html>