<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAYEE</title>
<link
	href="https://fonts.googleapis.com/css?family=Comfortaa|Rubik+Mono+One&display=swap"
	rel="stylesheet">
<style>
body{
font-family: 'Rubik Mono One', sans-serif;
font-family:'微軟正黑體';
}
.d1 {
	width: 80%;
	margin: auto;
	overflow-auto;
}

.topd {
	width: 100;
	margin: 5px;
	background-color: #CCDDFF;
}

.m1 {
	width: 200px;
	margin-top: 30px;
	margin-left: 30px;
	transform:rotate(-5deg)
}

.m2 {
	width: 20px;
	margin-top: 40px;
	margin-left: 730px;
}

.m3 {
	width: 20px;
	margin-left: 5px;
}

.m4 {
	width: 70px;
	margin-left: 20px;
}

.username {
	float: right;
	margin-right: 180px;
	margin-top: 90px;
	color: white;
	font-size: 25px;
	font-family: 'Comfortaa', cursive;
}

.m5 {
	width: 70px;
	margin-left: 110px;
}

.leftd{
background-color:#FFCCCC;
margin-left:5px;
margin-top:5px;
width:20%;
float:left;
}

a{
text-decoration:none

}
a:hover{
opacity:0.5;
}

.linkbtn{
color:white;
}
.linklist{
margin-top:10px;
}
.artistd{
background-color:#CCFF99;
margin-top:5px;
margin-right:5px;
width:78.5%;
float:right;
}

.m6{
width:180px; 
height:180px;
margin-left:20px;
}
.rightd{

margin-top:10px;
margin-right:5px;
width:78.5%;
float:right;
overflow:auto;
}
.activityd{
width:75%;
float:left;
background-color:#FFEE99;
}
.articled{
width:24%;
float:right;
background-color:#E8CCFF;
}
.performanced{
margin-top:10px;
width:75%;
float:left;
background-color:#DDDDDD;
}

.m7{
width:365px;
height:150px; 
margin-left:20px;
}
.m8{
width:330px;
height:200px; 
margin-left:40px;
}
.m9{
display:inline;
width:230px;
margin-left:40px;
margin-top:5px;
font-size:12px;
}
</style>
</head>
<body>
	<div class="d1">

		<div class="topd">
			<img src="../../../resources/img/jayee.gif" class="m1"> <img
				src="../../../resources/img/message.gif" class="m2"> <img
				src="../../../resources/img/notice.gif" class="m3"> <img
				src="../../../resources/img/photo.gif" class="m4"> <img
				src="../../../resources/img/logout.gif" class="m5"> <br>
			<br>
		</div>
	<div class="leftd">
	<br><br>
	<ul>
	<li class="linklist"><a href="" class="linkbtn">pagelink1</a></li>
	<li class="linklist"><a href="" class="linkbtn">pagelink2</a></li>
	<li class="linklist"><a href="" class="linkbtn">pagelink3</a></li>
	<li class="linklist"><a href="" class="linkbtn">pagelink4</a></li>
	<li class="linklist"><a href="" class="linkbtn">pagelink5</a></li>
	</ul>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>	
	<div class="artistd">
	<br>
	<span style="color:white;margin-left:25px;">TOP 5 </span><a href='/admin/artist/list'>Artist</a>
	<br><br>
	<div class="artists5">
	
	</div>
	<br><br>
	</div>
	<div class="rightd">
	<div class="activityd">
	<br>
	<span style="color:white;margin-left:25px;">TOP 4 </span><a href='/admin/activity/list'>Activities</a>
	<br><br>
	<img src="../../../resources/img/photo2.gif" class="m7">
	<img src="../../../resources/img/photo2.gif" class="m7">
	<br><br>
	<img src="../../../resources/img/photo2.gif" class="m7">
	<img src="../../../resources/img/photo2.gif" class="m7">
	<br><br>
	</div>
	<div class="articled">
	<br>
	<span style="color:white;margin-left:25px;">TOP 10 </span><a href='/admin/article/list'>Article</a>
	<ol style="width:200px;color:white">
	<li style="margin-left:50px;">AAA</li>
	<li style="margin-left:50px;">BBB</li>
	<li style="margin-left:50px;">CCC</li>
	<li style="margin-left:50px;">DDD</li>
	<li style="margin-left:50px;">EEE</li>
	<li style="margin-left:50px;">FFF</li>
	<li style="margin-left:50px;">GGG</li>
	<li style="margin-left:50px;">HHH</li>
	<li style="margin-left:50px;">III</li>
	<li style="margin-left:50px;">JJJ</li>
	</ol>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div class="performanced">
	<br>
	<span style="color:white;margin-left:25px;">推薦</span><a href='/admin/performance/list'>表演</a>
	<br>
<!-- 	<img src="../../../resources/img/photo.gif" class="m8"> -->
<!-- 	<img src="../../../resources/img/photo.gif" class="m8"> -->
<!-- 	<img src="../../../resources/img/photo.gif" class="m8"> -->
<!-- 	<img src="../../../resources/img/photo.gif" class="m9"> -->
<!-- 	<img src="../../../resources/img/photo.gif" class="m9"> -->
<!-- 	<img src="../../../resources/img/photo.gif" class="m9"> -->
	<br><br>
	</div>
	</div>
	</div>
	<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>
<script>

var sortBy = function (filed, rev, primer) {
    rev = (rev) ? -1 : 1;
    return function (a, b) {
        a = a[filed];
        b = b[filed];
        if (typeof (primer) != 'undefined') {
            a = primer(a);
            b = primer(b);
        }
        if (a < b) { return rev * -1; }
        if (a > b) { return rev * 1; }
        return 1;
    }
};


	$.ajax({
		url:"/admin/performance/query",
		type:"GET",
		success: function(data){
			var txt="";	
			var title="";
			console.log(data);
			data.sort(sortBy('views', false, parseInt));
			console.log(data);
			//https://www.youtube.com/embed/Lhel0tzHE08
			//https://www.youtube.com/watch?v=Lhel0tzHE08
			$.each(data,function(index,value){
				var head=value['url'].substring(0,24);
				var back = value['url'].substring(32,43);
				console.log(head+"embed/"+back);
				console.log(value['title'] + ",點閱="+ value['views']);
				txt= "<iframe  src='"+ head+"embed/"+back +"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen class='m8' id='"+value['id']+"'></iframe>";
				title="<div  class='m9'><span style='font-size:18px;'>"+value['title']+"</span><br><button type='button' onclick='views("+value['id']+")'>點閱率++</button><br><span style='margin-left:300px;'>點閱率   :</span><span id='view'>"+value['views'] +"</span></div>";
				});	
				
			$("div.performanced").append(txt);
			$("div.performanced").append("<br>");
			$("div.performanced").append(title);
			
		}
	});
	$.ajax({
		url :"/admin/performance/index/artistsTop5",
		type:"GET",
		success: function(data){
			txt = "<div style='position: relative;display:inline'><img src='../../../resources/img/artist"
			txt2 = ".jpg' class='m6'><div style='position: absolute;z-index: 2;left:20px'>"
			txt3 = "</div></div>"
			$.each(data, function(index,value){
				name =  value['name']
				num = index+1
				txt4 = txt + num + txt2 + name + txt3
				$("div.artists5").append(txt4)
			})
		}
	});
	

		var views  = function(id){
			$.ajax({
				url:"/admin/performance/viewplus",
				type: "GET",
				data:{"id":id},
				success: function(data){
 					$("#view").html(data['views']);
							

				}
			});
		};
	


</script>
</body>
</html>