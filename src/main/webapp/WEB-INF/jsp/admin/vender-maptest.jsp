<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<script src="/resources/admin-bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="/resources/admin-bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/admin-bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/admin-bootstrap/js/sb-admin-2.min.js"></script>
	
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4fmDiIyJ9mPTKGL7iIVPvB5Igfo54eMk&callback=initMap"
		async defer></script>


<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Using Closures in Event Listeners</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 80%;
	width: 80%;
}
.body{
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

<div class="body">
	<div id="map"></div>
	<input type="text" id="address"></input><button id="click">搜尋地址</button><br>
	<label>Lat:</label><p id=lat></p>
	<label>Lng:</label><p id=lng></p>
</div>
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
				clickableIcons:false,
				zoom : 17.5,
				minZoom:16 ,
				maxZoom:20,
				disableDefaultUI:true,
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
			map.addListener('center_changed', function(event) {
// 				alert(event.latLng.lat())
				
// 				alert(getDistance(self.getPosition().lat(), self.getPosition().lng(),event.latLng.lat(),event.latLng.lng()));

		
				changelatlng();
					window.setTimeout(function() {
						 addmarker(map);
					}, 500);
				
			});
			
			map.addListener('click', function(event) {
				self.setPosition(event.latLng);

				changelatlng();
					window.setTimeout(function() {
						map.panTo(event.latLng);
					}, 100);
			
			});	
// 			addmarker(map);
			

			
		}

	
		function attachSecretMessage(marker, secretMessage) {
			var infowindow = new google.maps.InfoWindow({
				content : secretMessage
			});

			marker.addListener('click', function() {
				infowindow.open(marker.get('map'), marker);
			});
		}
		
		
		
		function changelatlng(){
			$("#lat").text(self.getPosition().lat());
			$("#lng").text(self.getPosition().lng());

		}
		function	getabslat(latLng,d) {
				 d=d/1000;
				 alert(d);

		         lat1 = (Math.PI/180)*latLng.lat();  
		         lon1 = (Math.PI/180)*latLng.lng();    
		        //地球半径  
		         R = 6371;  
		      	 latdes=Math.acos(Math.cos(d/R))   
		      	  alert(latdes);
		        return Math.abs(latdes)/(Math.PI/180);  
		 }
		function	getabslng(latLng,d) { 
			 d=d/1000;
			 lat1 = (Math.PI/180)*latLng.lat();  
	         lon1 = (Math.PI/180)*latLng.lng();          
	       //地球半径  
	        R = 6371;  
	     	 londes=Math.acos((Math.cos(d/R)-Math.sin(lat1)*Math.sin(lat1))/(Math.cos(lat1)*Math.cos(lat1)))
	     	 alert(londes);
	       return Math.abs(londes)/(Math.PI/180);  
	}
		
		
		
		
		
		
		
		
		function addmarker(map){
			 gp = map.getBounds();
// 			 alert(gp.getNorthEast());
// 			 alert(gp.getSouthWest());
// 			latabs=getabslat(self.getPosition(),200);
// 			lngabs=getabslng(self.getPosition(),200);
			maxlat=gp.getNorthEast().lat();
			minlat=gp.getSouthWest().lat();
			maxlng=gp.getNorthEast().lng();
			minlng=gp.getSouthWest().lng();	
	$.ajax({
			url :  "/admin/vender/map?page=1&rows=20&maxlat="+maxlat+"&minlat="+minlat+"&maxlng="+maxlng+"&minlng="+minlng,
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
				
					 attachSecretMessage(marker,obj['name']);
					 
			
					 
					 
					 
				});
				
				
			}
		})}
		
	$("#click").click(function(){
// 		alert($("#address").val())
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
		        'address':$("#address").val(),
		    }, function (results, status) {
		        if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
	            map.setZoom(19);
	            self.setPosition(results[0].geometry.location);
	    		changelatlng();
		    }
		        
		});	

	});
	

	


		
		
	</script>

			<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>