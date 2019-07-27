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
	background-color: #ffb5b5;
	color: white;
	padding: 5px 32px 14px;
	border-radius: 50%;
}

.act2 {
	font-size: 80px;
	background-color: #00aeae;
	color: white;
	padding: 5px 32px 14px;
	border-radius: 50%;
}

.act3 {
	font-size: 80px;
	background-color: #84c1ff;
	color: white;
	padding: 5px 32px 14px;
	border-radius: 50%;
}

.activity1 {
	text-align: center;
	background-color: #ae0000;
	padding: 20px 0;
	border-radius: 40px;
	margin: 0 10px;
	opacity: 1;
}

.activity1:hover {
	cursor: pointer;
	transition-property: opacity;
	transition-duration: 0.3s;
	opacity: 0.7;
}

.activity2 {
	text-align: center;
	background-color: #007979;
	padding: 20px 0;
	border-radius: 40px;
	margin: 0 10px;
	opacity: 1;
}

.activity2:hover {
	cursor: pointer;
	transition-property: opacity;
	transition-duration: 0.3s;
	opacity: 0.7;
}

.activity3 {
	text-align: center;
	background-color: #004b97;
	padding: 20px 0;
	border-radius: 40px;
	margin: 0 10px;
	opacity: 1;
}

.activity3:hover {
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

.gree{
	margin-left:30px; 
	font-size:20px;
	font-weight:bold;
	color:#009100;
}

.redd{
	margin-left:30px; 
	font-size:20px;
	font-weight:bold;
	color:#ea0000;
}

.blues{
	margin-left:30px; 
	font-size:20px;
	font-weight:bold;
	color:#0066cc;
}
</style>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<input type="hidden" value="<sec:authentication property='name' />"
		id="thisuser">

	<div class="container" style="margin-top: 40px;">
		<span class="select"><i class="fas fa-mouse-pointer"></i> 選擇活動</span><br><br>
		<span class="gree">綠色為:即將舉行的活動   </span>
		<span class="redd">紅色為:舉行中的活動   </span>
		<span class="blues">藍色為:已結束的活動</span><br>


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
							if(data['length']==0){
								alert("您沒有辦過活動喔!");
							}
							var count = 1 ;
							var flag = true;
							$
									.each(
											data,
											function(index, value) {
												if(value['activityStatus']==0){
													var txt = "<div class='col-3' style='margin-top:20px;margin-bottom:10px'>";
													txt += "<div class='activity1' id='" +value['id'] +"'>"
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
												}else if(value['activityStatus']==1){
													var txt = "<div class='col-3' style='margin-top:20px;margin-bottom:10px'>";
													txt += "<div class='activity2' id='" +value['id'] +"'>"
													txt += "<span class='act2'><i class='fas fa-chess-knight'></i></span><br>";
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
												}else if(value['activityStatus']==2){
													var txt = "<div class='col-3' style='margin-top:20px;margin-bottom:10px'>";
													txt += "<div class='activity3' id='" +value['id'] +"'>"
													txt += "<span class='act3'><i class='fas fa-chess-knight'></i></span><br>";
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
												}
												
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
																		if(count==1){
																			alert("無法少於1筆");
																		}
																		if(count>1){
																			$("#insertdiv"+count).remove();
																			$("#movie"+count).remove();
																			count--;
																		}
																		
																	})
																	$("#enter").click(function(){
																		var total = $("iframe").length;
 																		var check = confirm("確定新增"+total+"部表演到活動["+value['name']+"]嗎");
 																		if(check){
 																			var flag=true;
 																			for(var j=1;j<=total;j++){
 																				var t = $("#title"+j).val();
 																				var u = $("#url"+j).val();
 																				var i = $("#introduction"+j).val();
 																				var aid = $("#thisact").val();
 																				$.ajax({
 																					url:"/user/performance/padd",
 																					type:"POST",
 																					data:{
 																						"username" : username,
 																						"title":t,
 																						"url":u,
 																						"introduction":i,
 																						"actid": aid
 																					},
 																					async: false,
 																					success:function(data){
 																						
 																						if(data==false){
 																							flag=false;
 																							alert("第"+j+"筆資料錯誤，請檢查輸入後再試一次。");
 																							for(var x=1;x<j;x++){
 																								$.ajax({
 																									url:"/user/performance/paddfalse",
 																									type:"POST",
 																									async: false,
 																									success:function(data){
 																										
 																									}
 																								})
 																							}
 																							j=total+1;
 																							
 																						}
 																					}
 																				})
 																			}
 																			if(flag){
 																				alert("表演新增成功，將回到表演列表。");
 																				
 																					$.ajax({
 																						url:"/user/performance/notice",
 																						type:"POST",
 																						data:{"username" : username,
 																							"size":j-1},
 																						success:function(data){
 																							
 																							console.log("通知新增成功");
 																						}
 																					})
 																				
 																				window.location.href="/performances";
 																			}
 																		}
																	})
																	
																})
											})
// 											each結束
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