<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<style>
.select {
	margin-top: 70px;
	margin-left: 20px; border : 3px solid red;
	font-size: 30px;
	background-color: red;
	color: white;
	font-weight: bold;
	line-height: 60px;
	padding: 0 15px;
	border-radius: 50px;
	border: 3px solid red;
}

.act1 {
	font-size: 80px;
	background-color: #00aeae;
	color: white;
	padding: 5px 32px 14px;
	border-radius: 50%;
}

.activity {
	text-align: center;
	background-color: #007979;
	padding: 20px 0;
	border-radius: 40px;
	margin: 0 10px;
	opacity: 1;
}

.activity:hover {
	cursor: pointer;
	transition-property: opacity;
	transition-duration: 0.3s;
	opacity: 0.7;
}

.title {
	font-size: 20px;
	color: white;
	font-weight: bold;
	border-bottom: 2px solid white;
	-webkit-user-select: none;
}

.user {
	color: white;
	-webkit-user-select: none;
}

.time {
	color: white;
	font-size: 13px;
	-webkit-user-select: none;
}

.in {
	border: none;
	border-bottom: 2px solid #bebebe;
	margin-top: 8px;
	margin-left: 20px;
	width: 80%;
}

.ddiv {
	border-radius: 30px;
	padding: 20px 30px;
	margin-top:10px;
}

input:focus {
	outline: none;
	transition-property: border-bottom;
	transition-duration: 0.5s;
	border-bottom: 2px solid blue;
}

i.fa-question-circle{
color:#9d9d9d;
}

button.bttt{
margin-left:10px;
margin-top:20px;
	cursor: pointer;
}
</style>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<input type="hidden" value="<sec:authentication property='name' />"
		id="thisuser">

	<div class="container" style="margin-top: 40px;">
		<span class="select"><i class="fas fa-mouse-pointer"></i> 選擇活動</span><br>


		<div class="row" style="margin-top: 50px;" id="activitys"></div>
		<div class="row" style="margin-top: 50px; margin-bottom: 15px"	id="padd">

		</div>

		<script>
			var username = $("#thisuser").val();

			$("#bttt").click(function() {
				var title = $("#titles").val();
				var url = $("#urls").val();
				var introduction = $("#introductions").val();
				var actid = $("#thisact").val();
				console.log(title);
				$.ajax({
					url : "/user/performance/padd",
					type : "POST",
					data : {
						"username" : username,
						"title" : title,
						"url" : url,
						"introduction" : introduction,
						"actid" : actid
					},
					success : function(data) {
						console.log(data);
					}
				})
			})
			$
					.ajax({
						url : "/user/performance/activity",
						type : "POST",
						data : {
							"username" : username
						},
						success : function(data) {
							console.log(data);
							var count = 1 ;
							var flag = true;
							$
									.each(
											data,
											function(index, value) {
												var txt = "<div class='col-3' style='margin-top:20px;margin-bottom:10px'>";
												txt += "<div class='activity' id='" +value['id'] +"'>"
												txt += "<span class='act1'><i class='fas fa-chess-knight'></i></span><br>";
												txt += "<br> <span class='title'>"
														+ value['name']
														+ "</span><br> <span	class='user'>"
														+ value['artist']
														+ "</span><br> <span class='time'>"
														+ value['beginTime']
														+ "<br>↓<br>"
														+ value['endTime']
														+ "</span>";
												txt += "</div></div>";
												$("#activitys").append(txt);
												$("#" + value['id'])
														.click(function() {
																	$(".select").html("<i class='fas fa-film'></i>  新增表演");
																	$("#thisact").val(value['id']);
																	$("#activitys").remove();
																	var txt2 ="<div class='col-9 ddiv' id='insertdiv"+count+"'>";
																	txt2 += "<div class='space'>";
																	txt2 +="<label>表演標題 : </label><input class='in' type='text' id='title"+count+"' name='title' autocomplete='off'>  <i class='fas fa-question-circle' title='表演的標題'></i><br>"; 
																	txt2 +="<label>表演網址 : </label><input class='in' type='url' name='url' id='url"+count+"' autocomplete='off'>  <i class='fas fa-question-circle'  title='格式http://www.youtube.com/watch?v=XXXXXXX'></i><br>";
																	txt2 +="<label>表演簡介 : </label><input class='in' type='text' name='introduction' id='introduction"+count+"' autocomplete='off'>  <i class='fas fa-question-circle' title='關於表的簡介'></i>";
																	txt2 +="</div></div>";
																	txt2 +="<div class='col-3' id='movie"+count+"'>";
																	txt2 +="<iframe width='100%' height='160px' id='frame"+count+"'	style='border-radius: 10px; border: 2px solid black; margin-top: 3px'	src='https://www.youtube.com/embed/XXXXXXX' 	allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' 	allowfullscreen></iframe>";
																	txt2 +="</div>";
																	txt2 +="<div class='col-12' style='text-align: right'>";
																	txt2 +="<button class='btn btn-primary bttt' id='new'>新增</button>";
																	txt2 +="<button class='btn btn-danger bttt' id='del'>刪除</button>";
																	txt2 +="<button class='btn btn-success bttt' id='enter'>確認</button></div>";
																	$("#padd").append(txt2);
																	$("#url"+count).blur(function(){
																		$("#frame"+count).attr('src','https://www.youtube.com/embed/'+$("#url"+count).val().substring(32));
																	})
																	$("#new").click(function(){
																		var txtnew ="<div class='col-9 ddiv' id='insertdiv"+(count+1)+"'>";
																		txtnew += "<div class='space'>";
																		txtnew +="<label>表演標題 : </label><input class='in' type='text' id='title"+(count+1)+"' name='title' autocomplete='off'>  <i class='fas fa-question-circle' title='表演的標題'></i><br>"; 
																		txtnew +="<label>表演網址 : </label><input class='in' type='url' name='url' id='url"+(count+1)+"' autocomplete='off'>  <i class='fas fa-question-circle'  title='格式http://www.youtube.com/watch?v=XXXXXXX'></i><br>";
																		txtnew +="<label>表演簡介 : </label><input class='in' type='text' name='introduction' id='introduction"+(count+1)+"' autocomplete='off'>  <i class='fas fa-question-circle' title='關於表的簡介'></i>";
																		txtnew +="</div></div>";
																		txtnew +="<div class='col-3' id='movie"+(count+1)+"'>";
																		txtnew +="<iframe width='100%' height='160px' id='frame"+(count+1)+"'	style='border-radius: 10px; border: 2px solid black; margin-top: 3px'	src='https://www.youtube.com/embed/XXXXXXX' 	allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' 	allowfullscreen></iframe>";
																		txtnew +="</div>";
																		$("#movie"+count).after(txtnew);
																		count++;
																		$("#url"+count).blur(function(){
																			$("#frame"+count).attr('src','https://www.youtube.com/embed/'+$("#url"+count).val().substring(32));
																		})
																	})
																	$("#del").click(function(){
																		$("#insertdiv"+count).remove();
																		$("#movie"+count).remove();
																		count--;
																	})
																	$("#enter").click(function(){
																		var total = $("iframe").length;
 																		var check = confirm("確定新增"+total+"部表演到活動["+value['name']+"]嗎");
 																		if(check){
 																			for(var i=1;i<=total;i++){
 																				var t = $("#title"+i).val();
 																				var u = $("#url"+i).val();
 																				var i = $("#introduction"+i).val();
 																				
 																			}
 																		}
																	})
																	
																})
											})

											}
						}

					})
		</script>

	</div>
	<input type="hidden" id="thisact">
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	<script>
		
	</script>
</body>
</html>