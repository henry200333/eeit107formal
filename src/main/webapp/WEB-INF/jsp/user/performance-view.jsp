<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<style>
.type {
	border-radius: 10px;
	color: blue;
	padding: 2px 5px;
	background-color: white;
	line-height: 40px;
}

.type:hover {
	transition-property: background-color, color;
	transition-duration: 0.3s;
	background-color: blue;
	color: white;
	cursor: pointer;
}

.view {
	font-size: 13px;
	color: #8e8e8e;
	-webkit-user-select: none;
}

.artist {
	font-size: 16px;
	font-weight: bold;
	line-height: 16px;
}

.photo:hover {
	transition-property: border;
	transition-duration: 0.5s;
	border: 1px solid black;
}

.photo {
	width: 50px;
	border-radius: 50%;
	border: 1px solid white;
}

.time {
	font-size: 13px;
	color: #8e8e8e;
}

.likediv:hover {
	cursor: pointer;
}

.dislikediv:hover {
	cursor: pointer;
}

.likediv {
	margin-top: 80px;
	display: inline;
	border-bottom: 3px solid white;
	padding: 5px;
	text-align: center;
}

.dislikediv {
	margin-top: 80px;
	display: inline;
	border-bottom: 3px solid white;
	padding: 5px;
	text-align: center;
	margin-left: 10px;
}

.introduction {
	margin-top: 5px;
	font-size: 14px;
}

.f1{
    position: absolute;
    top: 0;
    left: 0;
    content: "";
    background-color: white;
    opacity: 0;
    z-index: 1;
    width: 100%;
    height: 95%;
}

#f1{
-webkit-user-select: none;
}
</style>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<input type="hidden" value="${performance.id}" id="thisp">
	<div class="container">
		<div class="row">
			<!-- 			影片那塊(左邊) -->
			<div class="col-8">
				<div class="row">
					<div class="col-12">
						<iframe width="100%" height="410" id="main"
							style="margin-top: 50px; border-radius: 10px 0 10px 0;"
							src="https://www.youtube.com/embed/${performance.url}?autoplay=1&modestbranding=1&rel=0"
							frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>

					<div class="col-8">
						<span class="type"># ${performance.performanceGerne}</span>
						<h5 style="font-weight: bold; cursor: pointer;">${performance.title}</h5>
						<span class="view">${performance.views} 次觀看</span>
					</div>
					<div class="col-4">
						<div class="row">
							<div class="col-4 likediv">
								<span id="like"><i class="fas fa-heart like"></i>
									${performance.likes} </span>
							</div>
							<div class="col-4 dislikediv">
								<span id="dislike"><i class="fas fa-heart-broken dislike"></i>
									${performance.dislikes}</span>
							</div>
						</div>
						<!-- 						喜歡的JS -->
						<script>
							$(".likediv").hover(function() {

								$(".likediv").animate({
									borderBottomColor : '#2894ff'
								}, 300);
								$("#like").animate({
									"color" : '#2894ff'
								}, 300);

							}, function() {
								$(".likediv").animate({
									borderBottomColor : '#ffffff'
								}, 300)
								$("#like").animate({
									"color" : 'black'
								}, 300);
							})

							$(".dislikediv").hover(function() {

								$(".dislikediv").animate({
									borderBottomColor : '#ff5151'
								}, 300);
								$("#dislike").animate({
									"color" : '#ff5151'
								}, 300);

							}, function() {
								$(".dislikediv").animate({
									borderBottomColor : '#ffffff'
								}, 300)
								$("#dislike").animate({
									"color" : 'black'
								}, 300);
							});

							$("#like").click(function() {

								$(".like").animate({
									"height" : "-=8px"
								}, 100, function() {
									$(".like").animate({
										"height" : "+=8px"
									}, 100);
								});
							})

							$("#dislike").click(function() {
								$(".dislike").animate({
									"height" : "-=8px"
								}, 100, function() {
									$(".dislike").animate({
										"height" : "+=8px"
									}, 100);
								});
							})
						</script>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-1">
						<img
							src="/resources/user-bootstrap/img/performance/${performance.userpId}.jpg"
							class="photo">
					</div>
					<div class="col-9" style="padding-top: 5px;">
						<span class="artist">${performance.username}</span><br> <span
							class="time">${time}</span><br> <span class="introduction">${performance.introduction}</span><br>
						<span>________________________________________________________</span><br>
						<div class="row" style="margin-top:15px;" >
						<div class="col-2" ><img src="/resources/user-bootstrap/img/performance/dog.jpg" width="100%" style="border-radius:50%"></div>
						<div class="col-10" style="margin-top:10px;padding-left:0"><span style="font-size:16px;font-weight:bold;">${activity.name}</span><br>
						<span style="line-height:10px;font-size:12px;">${begin} - ${end}</span></div>
						
						</div>
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-danger">
							<i class="fas fa-plus" style="color: white"></i> 訂閱
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-6"></div>
				</div>
			</div>
			<!-- 			影片右邊塊(右邊) -->
			<div class="col-4">
				<div class="row">
				<div class="col-7" style="margin-top: 50px;">
				<div class="f1"></div>
					<iframe width="100%" height="98px" id="f1" style="border-radius:5px;"
						src="https://www.youtube.com/embed/GfWkG4qedoE"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 50px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;" id="ft1"></span><br>
				<span style="font-size:12px;"  id="fn1"></span><span style="font-size:12px;color:blue;float:right"  id="fg1"></span><br>
				<span  style="font-size:12px;" id="fv1"></span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
					<div class="f2"></div>
					<iframe width="100%" height="98px" id="f2" style="border-radius:5px;"
						src="https://www.youtube.com/embed/GfWkG4qedoE"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;" id="ft2"></span><br>
				<span style="font-size:12px;"  id="fn2"></span><span style="font-size:12px;color:blue;float:right"  id="fg2"></span><br>
				<span  style="font-size:12px;" id="fv2"></span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
				<div class="f3"></div>
					<iframe width="100%" height="98px" id="f3" style="border-radius:5px;"
						src="https://www.youtube.com/embed/GfWkG4qedoE"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;" id="ft3"></span><br>
				<span style="font-size:12px;"  id="fn3"></span><span style="font-size:12px;color:blue;float:right"  id="fg3"></span><br>
				<span  style="font-size:12px;" id="fv3"></span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
				<div class="f4"></div>
					<iframe width="100%" height="98px" id="f4" style="border-radius:5px;"
						src="https://www.youtube.com/embed/GfWkG4qedoE"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;" id="ft4"></span><br>
				<span style="font-size:12px;"  id="fn4"></span><span style="font-size:12px;color:blue;float:right"  id="fg4"></span><br>
				<span  style="font-size:12px;" id="fv4"></span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
				<div class="f5"></div>
					<iframe width="100%" height="98px" id="f5" style="border-radius:5px;"
						src="https://www.youtube.com/embed/GfWkG4qedoE"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;" id="ft5"></span><br>
				<span style="font-size:12px;"  id="fn5"></span><span style="font-size:12px;color:blue;float:right"  id="fg5"></span><br>
				<span  style="font-size:12px;" id="fv5"></span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
				<div class="f6"></div>
					<iframe width="100%" height="98px" id="f6" style="border-radius:5px;"
						src="https://www.youtube.com/embed/GfWkG4qedoE"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;" id="ft6"></span><br>
				<span style="font-size:12px;"  id="fn6"></span><span style="font-size:12px;color:blue;float:right"  id="fg6"></span><br>
				<span  style="font-size:12px;" id="fv6"></span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
				<div class="f7"></div>
					<iframe width="100%" height="98px" id="f7" style="border-radius:5px;"
						src="https://www.youtube.com/embed/GfWkG4qedoE"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;" id="ft7"></span><br>
				<span style="font-size:12px;"  id="fn7"></span><span style="font-size:12px;color:blue;float:right"  id="fg7"></span><br>
				<span  style="font-size:12px;" id="fv7"></span>
				</div>
				</div>
		</div>
	</div>
	</div>
	
	<!-- 	右邊載入 -->
	<br><br><br><br>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	<script>
	
// 	旁邊的推薦影片清單
	$.ajax({
		url:"/performanceSide",
		type:"POST",
		success:function(data){
			console.log(data);
			var count=1;
			var thispid = $("#thisp").val();
			$.each(data,function(index,value){
				if(value['id']!=thispid && count<=7){
					var url= value['url'].substring(32);
					$("#f" +count).attr('src','https://www.youtube.com/embed/'+url);
					$("#ft"+count).html(value['title']);
					$("#fn"+count).html(value['username']);
					$("#fg"+count).html("# " +value['performanceGerne']);
					$("#fv"+count).html(value['views']);
					count++;
				}
				
			})
		}
	})
	
// 	10秒鐘後才增加點閱率
	window.setTimeout(function(){$.ajax({
		url:"/pviewplus/"+$("#thisp").val(),
		type:"POST",
		success:function(){
			console.log("viewplus");
		}
	})},10000)
	
	</script>

</body>
</html>