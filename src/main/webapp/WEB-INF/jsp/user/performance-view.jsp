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
									${performance.unlikes}</span>
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
							src="/resources/user-bootstrap/img/performance/${performance.partistId}.jpg"
							class="photo">
					</div>
					<div class="col-9" style="padding-top: 5px;">
						<span class="artist">${performance.username}</span><br> <span
							class="time">${time}</span><br> <span class="introduction">${performance.introduction}</span><br>
						<span>________________________________________________________</span><br>
						<span>關聯活動 ${performance.activityId}</span>
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
				<span style="font-weight:bold;font-size:15px;">陳忻玥 Vicky Chen -【入土之前】</span><br>
				<span style="font-size:12px;">桑源雅沂</span><br>
				<span  style="font-size:12px;">3000 觀看</span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
					<div class="f1"></div>
					<iframe width="100%" height="98px" id="f1" style="border-radius:5px;"
						src="https://www.youtube.com/embed/Lhel0tzHE08"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;">G.E.M.【再見 GOODBYE】鄧紫棋</span><br>
				<span style="font-size:12px;">柳川鳳</span><br>
				<span  style="font-size:12px;">160 觀看</span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
					<div class="f1"></div>
					<iframe width="100%" height="98px" id="f1" style="border-radius:5px;"
						src="https://www.youtube.com/embed/2pC8Jk2FDO4"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">
				<span style="font-weight:bold;font-size:15px;">這群人 畢業後要幹嘛</span><br>
				<span style="font-size:12px;">張添財</span><br>
				<span  style="font-size:12px;">1912 觀看</span>
				</div>
				</div>
				<div class="row">
				<div class="col-7" style="margin-top: 10px;">
					<div class="f1"></div>
					<iframe width="100%" height="98px" id="f1" style="border-radius:5px;"
						src="https://www.youtube.com/embed/TxgYs4_29KI"  frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
				</div>
				<div class="col-5" style="margin-top: 10px;padding-left:0">				
				<span style="font-weight:bold;font-size:15px;">超級可愛的柴犬</span><br>
				<span style="font-size:12px;">敏敏</span><br>
				<span  style="font-size:12px;">151100  觀看</span></div>
				</div>
			</div>
		</div>
	</div>
	<script>
	var src =$("#f1").attr('src'); 
		$(".f1").hover(function(){
			
			$("#f1").attr('src',src+"?autoplay=1");
		},function(){
			$("#f1").attr('src',src);
		})
	
	
	</script>
	
	<!-- 	右邊載入 -->
	<br><br><br><br>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

</body>
</html>