<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=initMap"
		async defer></script>
<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Using Closures in Event Listeners</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 80%;
	margin: 20%;
	width: 60%;
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
	<div id="map"></div>

	<script>
		var map;
		var self;
		var marker;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {

				center : {
					lat : 25.0282131,
					lng : 121.5359507
				},
				zoom : 17.5,
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

			map.addListener('click', function(event) {
				self.setPosition(event.latLng)


				window.setTimeout(function() {
					map.panTo(event.latLng);
				}, 100);
			});
			addmarker(map);
			

			
		}

	
		function attachSecretMessage(marker, secretMessage) {
			var infowindow = new google.maps.InfoWindow({
				content : secretMessage
			});

			marker.addListener('click', function() {
				infowindow.open(marker.get('map'), marker);
			});
		}
		
		
		
		function addmarker(map){
	$.ajax({
			url : '/admin/vender/query',
			type : "POST",
			success : function(data) {
				$.each(data,function(key, obj) {
					 marker = new google.maps.Marker({
						position : {
							lat : 	obj['lat'],
							lng : obj['lng']
						},
						map : map,
						icon : {
							path : google.maps.SymbolPath.CIRCLE,
							scale : 8.5,
							fillColor : "#F99",
							fillOpacity : 0.8,
							strokeWeight : 1
						}
					});
				
					 attachSecretMessage(marker,obj['name']);	;
				});
				
				
			}
		})}
	
	</script>

</body>
</html>