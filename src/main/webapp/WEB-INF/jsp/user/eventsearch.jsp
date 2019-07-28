<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="/resources/admin-bootstrap/vendor/jquery/jquery.min.js"></script>
<script
	src="/resources/admin-bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script
	src="/resources/admin-bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="/resources/admin-bootstrap/js/sb-admin-2.min.js"></script>

<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Using Closures in Event Listeners</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 750px;
	width: px;
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

	<div >
		<div class="row">
			<div class="col-2"></div>
			<div class="col-10">
				<input type="text" id="address"></input>

				<button id="click">搜尋地址</button>
			</div>
			<div class="col-8">
				<div id="map"></div>
			</div>
			<div class="col-4" id="list">
				
			</div>
			<div hidden>
				<br> <label>Lat:</label>
				<p id=lat></p>
				<label>Lng:</label>
				<p id=lng></p>
			</div>
		</div>
	</div>
	<script>
		var map;
		var self;

		var vendermarkersdata = [];
		// 		var vendermarkers;
		var locationmarkers = [];
		var vendermarkers = [];
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {

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

			self = new google.maps.Marker({
				position : {

					lat : map.getCenter().lat(),
					lng : map.getCenter().lng()
				},
				map : map
			});
			changelatlng();
			map.addListener('click', function(event) {
				// 				alert(event.latLng.lat())

				// 				alert(getDistance(self.getPosition().lat(), self.getPosition().lng(),event.latLng.lat(),event.latLng.lng()));		

				window.setTimeout(function() {
					clearmarker();
				}, 100);

				window.setTimeout(function() {
					addmarker(map);
				}, 100);

			});

			map.addListener('click', function(event) {

				map.panTo(event.latLng);

				self.setPosition(event.latLng);

				changelatlng();

			});
			// 			addmarker(map);

		}

		function list(vendermarkers, id, type, vender) {
			// 	
			console.log(type)
			if (type == "vender") {
				vendermarkers.addListener('click', function() {
					var txt="";
					txt+="<div class='row' style='border: solid 1px silver; margin: 2%'><div class='col-sm-12 mb-0 mb-sm-0'><br></div><div class='col-sm-12 mb-0 mb-sm-0'><a href='/job/vender/";
					txt+=vender.id;
					txt+="' ><h4 style='text-align: center'>";
					txt+=vender.name;
					txt+="</h4></a></div><div class='col-sm-12 mb-0 mb-sm-0'><h5>預約專線:</h5></div><div class='col-sm-12 mb-0 mb-sm-0'><h5 style='padding-left: 10%'>";
					txt+=vender.phone;
					txt+="</h5></div><div class='col-sm-12 mb-0 mb-sm-0'><h5>地址:</h5></div><div class='col-sm-12 mb-0 mb-sm-0'><h5 style='padding-left: 10%'>";
					txt+=vender.city+vender.district+vender.address;
					txt+="</h5></div><div class='col-sm-12 mb-0 mb-sm-0'><h5>關於我們:</h5></div><div class='col-sm-12 mb-3 mb-sm-0'><h5 style='border: solid 1px silver; text-align: center; padding: 1%'>";
					txt+=vender.introduction;
					txt+="</h5></div></div>";
					$("#list").html(txt);	
				});
			}else if(type=="location"){
				vendermarkers.addListener('click', function() {
					$.ajax({url :"/map/activity?id="+vender["locationId"],
						type : "GET",
						success : function(data) {
							console.log(data)}
						})
				})
			}
		}

		function changelatlng() {
			$("#lat").text(self.getPosition().lat());
			$("#lng").text(self.getPosition().lng());

		}

		function addmarker(map) {

			gp = map.getBounds();

			var maxlat = gp.getSouthWest().lat()
					+ (gp.getNorthEast().lat() - gp.getSouthWest().lat()) * 1.0;
			// 			alert(maxlat)
			var minlat = gp.getSouthWest().lat()
					+ (gp.getNorthEast().lat() - gp.getSouthWest().lat()) * 0.0;
			// 			alert(minlat)
			var maxlng = gp.getSouthWest().lng()
					+ (gp.getNorthEast().lng() - gp.getSouthWest().lng()) * 1.0;
			var minlng = gp.getSouthWest().lng()
					+ (gp.getNorthEast().lng() - gp.getSouthWest().lng()) * 0.0;
			$.ajax({url : "/map/map?page=1&rows=20&maxlat=" + maxlat
								+ "&minlat=" + minlat + "&maxlng=" + maxlng
								+ "&minlng=" + minlng,
						type : "POST",
						success : function(data) {
							$.each(data,function(key, obj) {
												// 								alert(obj['lat'])
												vendermarkers[key] = new google.maps.Marker(
														{position : {
																lat : obj['lat'],
																lng : obj['lng'],
															},
															map : map,
															icon : {
																url : "http://www.oxxostudio.tw/img/articles/201801/google-maps-3-marker-icon.png",
																scale : 8.5,
																fillColor : "#F99",
																fillOpacity : 0.1,
																strokeWeight : 1
															}
														});
												list(vendermarkers[key],
														obj['id'], "vender",
														obj);
											});
						}

					})
					
			$.ajax({url : "/map/location?page=1&rows=20&maxlat=" + maxlat
								+ "&minlat=" + minlat + "&maxlng=" + maxlng
								+ "&minlng=" + minlng,
						type : "POST",
						success : function(data) {
							$.each(data,function(key, obj) {
																				alert(obj['locationId'])
												locationmarkers[key] = new google.maps.Marker(
														{position : {
																lat : obj['lat'],
																lng : obj['lng'],
															},
															map : map,
															icon : {
																url : "http://www.oxxostudio.tw/img/articles/201801/google-maps-3-marker-icon.png",
																scale : 8.5,
																fillColor : "#F99",
																fillOpacity : 0.1,
																strokeWeight : 1
															}
														});
												list(locationmarkers[key],obj['id'], "location",obj);
											});
						}

					})

		};

		function clearmarker() {
			console.log(vendermarkers)
			for (var i = 0; i < vendermarkers.length; i++) {
				if (vendermarkers[i]) {
					vendermarkers[i].setMap(null);
				}
			}
			verclearmarkers = [];
		}

		$("#click").click(function() {
			// 		alert($("#address").val())
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				'address' : $("#address").val(),
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					map.setCenter(results[0].geometry.location);
					map.setZoom(19);
					self.setPosition(results[0].geometry.location);
					changelatlng();
				}

			});

		});
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=initMap"
		async defer></script>

</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>