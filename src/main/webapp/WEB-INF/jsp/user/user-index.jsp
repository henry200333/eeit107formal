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
<link href="https://fonts.googleapis.com/css?family=Knewave|Pacifico&display=swap" rel="stylesheet">
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
	font-size:80px;
	margin-top: 70px;
	margin-left: 30px;
		font-family: 'Pacifico', cursive;
		color:white;
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
			<span class="m1">Jayee</span>
			 <img
				src="../../../resources/admin-bootstrap/img/message.gif" class="m2"> <img
				src="../../../resources/admin-bootstrap/img/notice.gif" class="m3"> <img
				src="../../../resources/admin-bootstrap/img/photo.gif" class="m4"> <img
				src="../../../resources/admin-bootstrap/img/logout.gif" class="m5"> <br>
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
	<span style="color:white;margin-left:25px;">TOP 3 </span><a href='/admin/activity/list'>Activities</a>
	<br><br>
	<div class="activityTop3">
	
	</div>
	<br><br>
	</div>
	<div class="articled">
		<br>
		<span style="color:white;margin-left:15px;">TOP 10 </span><a href='/admin/article/list'>Article</a>
		<div id="top10Article">
		<!-- 		put top10 article here -->
		</div>
	</div>
		<div class="performanced">
			<br>
			<span style="color:white;margin-left:25px;">推薦</span><a href='/admin/performance/list'>表演</a>
			<br>
			<div id="iframeWrapper" style="width: 42%;float: left;">
				<!-- 			put iframe element into this div -->
				<!-- 	<img src="../../../admin-bootstrap/resources/img/photo.gif" class="m8"> -->
				<!-- 	<img src="../../../admin-bootstrap/resources/img/photo.gif" class="m8"> -->
				<!-- 	<img src="../../../admin-bootstrap/resources/img/photo.gif" class="m8"> -->
				<!-- 	<img src="../../../admin-bootstrap/resources/img/photo.gif" class="m9"> -->
				<!-- 	<img src="../../../admin-bootstrap/resources/img/photo.gif" class="m9"> -->
				<!-- 	<img src="../../../admin-bootstrap/resources/img/photo.gif" class="m9"> -->
			</div>
			<div id="articleWrapper" style="width: 56%;float: right;padding: 2px">
				<!-- 			put top1 article into this div -->
			</div>
			<div id="forumWrapper" style="width: 56%;float: right;padding: 2px">
				<!-- 			put forum into this div -->
<!-- 				<div id="forum1" style="padding: 2px"> -->
<!-- 					<b>大中天</b> -->
<!-- 					<div>以前你偶爾聽，現在你應該天天聽</div> -->
<!-- 				</div> -->
<!-- 				<div id="forum2" style="padding: 2px"> -->
<!-- 					<b>大平台</b> -->
<!-- 					<div>我已經買了</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		
		</div>
	</div>
	</div>
	<!-- Bootstrap core JavaScript-->
<script src="/resources/admin-bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="/resources/admin-bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/admin-bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/admin-bootstrap/js/sb-admin-2.min.js"></script>
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
				
			$("#iframeWrapper").append(txt);
			$("#iframeWrapper").append("<br>");
			$("#iframeWrapper").append(title);
			
		}
	});
	$.ajax({
		url :"/user/artistsTop5",
		type:"GET",
		success: function(data){
			txt = "<div style='position: relative;display:inline'><img src='/resources/admin-bootstrap/img/artist"
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
	
// 		append Top1 Article div next to performance
//		save ID for Forum
var articleId;
		$.ajax({
			url : "/user/articleTop",
			type : "GET",
			success : function(res) {
				if(res.type == 'SUCCESS'){
					var articleDiv = "";
					articleDiv += "<b style='mergin: 2px;font-size: 1.5em'>" + res.data.name + "</b>";
					articleDiv += "<div>" + res.data.content + "</div><br><hr style='width: '>";
					$("#articleWrapper").append(articleDiv);
					articleId=res.data.id;
					getComment();
				}
			}
		})
		
		// top 1 comment for article 

	function getComment() {
		var board = "Article";
		var upperBound = 2;
		var commentReqData = {
			"board" : board,
			"refId" : articleId
		};
		$.ajax({
			url : "/user/fitComments/"+board+"/"+articleId,
			type : "GET",
			success : function(data) {
				var txtComment='';
				$.each(data,function(index,value){
					if((index+1)>upperBound) return false;
					txtComment += '<div id="forum' + (index+1) + '" style="padding: 2px">'
					txtComment += "<b>" + value.userName + "</b>";
					txtComment += "<div>" + value.comment +"</div></div>";					
				})
// 				console.log(txtComment);
// 				console.log(data);
				$("#forumWrapper").append(txtComment);
			}
		})
	}

	// 		append Top10 Article div into performance
	$.ajax({
		url : "/user/articleTop10",
		type : "GET",
		success : function(res) {
			if (res.type == 'SUCCESS') {
				var articleDiv = "";
				var i = 0;
				$.each(res.data, function() {
					articleDiv += "<div style='margin: 8px'><b>" + (i + 1)
							+ ". </b><a href='#'>" + res.data[i].name
							+ "</a></div>";
					i++;
				})
				$("#top10Article").append(articleDiv);
			}
		}
	});

	$
			.ajax({
				url : "/user/activityTop3",
				type : "GET",
				success : function(data) {
					txt1 = "<div style='border-style:solid;border-radius:20px;margin:2px;background-color:#FFFFBB'><img style='border-radius:20px;border-style:double;border-width:3px;display:inline' src='/resources/user-bootstrap/img/activity/activity"
				txt2 = ".jpg' class='m7'><div style='margin-left:10px;display:inline;float:right;width:350px;border-color:#DDDDDD'>"
					txt3 = "</div></div>"
					txt4 = "<br>"
					$.each(data, function(key, value) {
						pictureNum = value['id'];
						txt5 = "活動名稱: " + value['name'] + txt4 + "表演者: "
								+ value['artist'] + txt4 + "活動描述: "
								+ value['description'] + txt4 + "舉辦時間: "
								+ value['beginTime'] + txt4 + "結束時間: "
								+ value['endTime'] + txt4 + "讚數: "
								+ value['awesomeNum']
						txt6 = txt1 + pictureNum + txt2 + txt5 + txt3
						$("div.activityTop3").append(txt6)

					})
				}
			});
</script>
</body>
</html>