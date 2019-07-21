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
	transition-property: border-bottom;
	transition-duration: 0.5s;
	border-bottom: 3px solid #2894ff;
}

.dislikediv:hover {
	cursor: pointer;
	transition-property: border-bottom;
	transition-duration: 0.5s;
	border-bottom: 3px solid #ff5151;
}

.likedivclick:hover {
	cursor: pointer;

}

.dislikedivclick:hover {
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



.likedivclick {
	margin-top: 80px;
	display: inline;
	border-bottom: 3px solid #2894ff;
	padding: 5px;
	text-align: center;
}

.likedivclick span{
	color: #2894ff;
}

.dislikedivclick {
	margin-top: 80px;
	display: inline;
	border-bottom: 3px solid #ff5151;
	padding: 5px;
	text-align: center;
	margin-left: 10px;
}

.dislikedivclick span{
	color: #ff5151;
}

.introduction {
	margin-top: 5px;
	font-size: 14px;
}

.pside {
	position: absolute;
	top: 0;
	left: 0;
	content: "";
	background-color: white;
	opacity: 0;
	z-index: 1;
	width: 170%;
	height: 95%;
}

#f1 {
	-webkit-user-select: none;
}

.act {
	width: 100%;
	border-radius: 50%;
	border-radius: 50%;
	border: 1px solid white;
}

.act:hover {
	transition-property: border;
	transition-duration: 0.5s;
	border: 1px solid black;
}
</style>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<input type="hidden" value="${performance.id}" id="thisp">
	<input type="hidden" value="<sec:authentication property='name' />" id="thisuser">
	<sec:authorize access="isAuthenticated()">
	<input type='hidden' value="<sec:authentication property='principal.account'/>" id='userAccount'>
	
	</sec:authorize>
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
							<div class="col-4 likediv" id="ld">
								<span id="like"><i class="fas fa-heart like"></i><span id="likeshow" style="padding-left:5px;">${performance.likes} </span>
									</span>
							</div>
							<div class="col-4 dislikediv" id="dd">
								<span id="dislike"><i class="fas fa-heart-broken dislike"></i><span id="dislikeshow" style="padding-left:5px;">${performance.dislikes} </span>
									</span>
							</div>
						</div>
						<!-- 						喜歡的JS -->
						<script>
							
				// 點擊喜歡不喜歡
							$(".likediv").click(function() {
								var user = $("#thisuser").val();
								if(user=="anonymousUser"){
									var login = confirm("請先登入");
									if(login==true){window.location.href="/login";}
								}else{
									var pid = $("#thisp").val();
									var dislikeType= 0;
									var dislike= $("#dd").attr("class");
									var like =  $("#ld").attr("class");
									if(dislike=="col-4 dislikedivclick"){
										dislikeType=1;
									}
									if(like=="col-4 likedivclick"){
										dislikeType=2;
									}
									$.ajax({
										url:"/user/performance/like",
										type:"POST",
										data:{"id":pid,
											"username":user,
											"dislikeType":dislikeType	
										},
										success:function(data){
											$("#likeshow").html(data.likes);
											$("#dislikeshow").html(data.dislikes);
											if(dislikeType==0){
											$("#ld").attr('class','col-4 likedivclick');
											}
											if(dislikeType==1){
												$("#dd").attr('class','col-4 dislikediv');
												$("#ld").attr('class','col-4 likedivclick');
											}
											if(dislikeType==2){
												$("#ld").attr('class','col-4 likediv');	
											}
										}
									})
								}
							})

							$(".dislikediv").click(function() {
								var user = $("#thisuser").val();
								if(user=="anonymousUser"){
									var login = confirm("請先登入");
									if(login==true){window.location.href="/login";}
								}else{
									var pid = $("#thisp").val();
									var likeType= 0;
									var like= $("#ld").attr("class");
									var dislike=$("#dd").attr("class");
									if(like=="col-4 likedivclick"){
										likeType=1;
									}
									if(dislike=="col-4 dislikedivclick"){
										likeType=2;
									}
									
										$.ajax({
											url:"/user/performance/dislike",
											type:"POST",
											data:{"id":pid,
												"username":user,
												"likeType":likeType	
											},
											success:function(data){
												$("#likeshow").html(data.likes);
												$("#dislikeshow").html(data.dislikes);
												if(likeType==0){
													$("#dd").attr('class','col-4 dislikedivclick');	
												}												
												if(likeType==1){
													$("#ld").attr('class','col-4 likediv');
													$("#dd").attr('class','col-4 dislikedivclick');
												}
												if(likeType==2){
													$("#dd").attr('class','col-4 dislikediv');	
												}
											}
										})
									
								}
								
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
						<div class="row" style="margin-top: 15px;">
							<div class="col-2">
								<img src="/resources/user-bootstrap/img/performance/dog.jpg"
									class="act">
							</div>
							<div class="col-10" style="margin-top: 10px; padding-left: 0">
								<span style="font-size: 16px; font-weight: bold;">${activity.name}</span><br>
								<span style="line-height: 10px; font-size: 12px;">${begin}
									- ${end}</span>
							</div>

						</div>
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-danger" id="sub">
							<i class="fas fa-plus" style="color: white" id="subpic"></i><span id="subhtml">訂閱</span>
						</button>
					</div>
					<script>
					$("#sub").click(function(){
						var user = $("#thisuser").val();
						if(user=="anonymousUser"){
							var login = confirm("請先登入");
							if(login==true){window.open("/login")+(location.href).substring(7);}
						}else{
							//新增好友
							var thispid = $("#thisp").val();
// 							$.ajax({
// 								url:'/user/performance/addfriend',
// 								data:{"id":thispid,
// 									"username":user									
// 								},
// 								success:function(data){
									
// 								}
// 							})
							
							var username = $(".artist").html();
							alert("訂閱使用者"+username);
							$("#sub").attr('class','btn btn-success');
							$("#subpic").attr('class','fas fa-star');
							$("#subhtml").html("已訂閱");
							
							
						}
						
					})
					</script>
				</div>
				<div class="row">
					<div class="col-6"></div>
				</div>
<!-- 				留言輸入 -->
				<div class="row" style="margin-top:20px;margin-left:50px;">
				<div class="col-10" >
					<textarea cols="68" rows="3" placeholder="   留言..."  style="resize:none"></textarea>
				</div>
				<div class="col-1" style="padding-top:40px;">
				 <button type="button" class="btn btn-primary" ><i class="fas fa-share"></i></button>
				</div>
				</div>
<!-- 				留言開始 -->
<script src='/resources/user-bootstrap/js/commentLoader.js'></script>
				<div id='commentAppend' style="margin-top:20px;">
					<div class='row'>
						<div class='col-12'>留言們</div>
					</div>
					<div class='row'>
						<div class='col-1'>照片</div>
						<div class='col-11' id='commentId'>
							<div class='row'>
								<div class='col-3'>吳帆祥</div>
								<div class='col-9'></div>
							</div>
							<div>
								<div class='col-2'></div>
								<div class='col-10'>
									<p>內容在這兒內容在這兒內容在這兒內容在這兒內容在這兒內容在這兒
								</div>
							</div>
							<div class='row'>
								<div class='col-5'></div>
								<div class='col-4'>1992-11-28 13:15:21</div>
								<div class='col-3'>
									<i class="far fa-thumbs-up"></i><span>讚數</span>
								</div>
							</div> 
							<div class='row'>
						<div class='col-1'>照片</div>
						<div class='col-11' id='commentId'>
							<div class='row'>
								<div class='col-3'>吳帆祥</div>
								<div class='col-9'></div>
							</div>
							<div>
								<div class='col-2'></div>
								<div class='col-10'>
									<p>內容在這兒內容在這兒內容在這兒內容在這兒內容在這兒內容在這兒
								</div>
							</div>
							<div class='row'>
								<div class='col-5'></div>
								<div class='col-4'>1992-11-28 13:15:21</div>
								<div class='col-3'>喜歡 不喜歡</div>
							</div>
						</div>	
									
					</div>
						</div>	
									
					</div>
				</div>
				<!-- 				留言結束 -->

			</div>
			<!-- 			影片右邊塊(右邊) -->
			<div class="col-4">
				<div class="row">
					<div class="col-7" style="margin-top: 50px;">
						<div class="pside" id="pside1"></div>
						<iframe width="100%" height="98px" id="f1"
							style="border-radius: 5px;"
							src="https://www.youtube.com/embed/GfWkG4qedoE" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="col-5" style="margin-top: 50px; padding-left: 0">
						<span style="font-weight: bold; font-size: 15px;" id="ft1"></span><br>
						<span style="font-size: 12px;" id="fn1"></span><span
							style="font-size: 12px; color: blue; float: right" id="fg1"></span><br>
						<span style="font-size: 12px;" id="fv1"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-7" style="margin-top: 10px;">
						<div class="pside" id="pside2"></div>
						<iframe width="100%" height="98px" id="f2"
							style="border-radius: 5px;"
							src="https://www.youtube.com/embed/GfWkG4qedoE" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="col-5" style="margin-top: 10px; padding-left: 0">
						<span style="font-weight: bold; font-size: 15px;" id="ft2"></span><br>
						<span style="font-size: 12px;" id="fn2"></span><span
							style="font-size: 12px; color: blue; float: right" id="fg2"></span><br>
						<span style="font-size: 12px;" id="fv2"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-7" style="margin-top: 10px;">
						<div class="pside" id="pside3"></div>
						<iframe width="100%" height="98px" id="f3"
							style="border-radius: 5px;"
							src="https://www.youtube.com/embed/GfWkG4qedoE" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="col-5" style="margin-top: 10px; padding-left: 0">
						<span style="font-weight: bold; font-size: 15px;" id="ft3"></span><br>
						<span style="font-size: 12px;" id="fn3"></span><span
							style="font-size: 12px; color: blue; float: right" id="fg3"></span><br>
						<span style="font-size: 12px;" id="fv3"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-7" style="margin-top: 10px;">
						<div class="pside" id="pside4"></div>
						<iframe width="100%" height="98px" id="f4"
							style="border-radius: 5px;"
							src="https://www.youtube.com/embed/GfWkG4qedoE" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="col-5" style="margin-top: 10px; padding-left: 0">
						<span style="font-weight: bold; font-size: 15px;" id="ft4"></span><br>
						<span style="font-size: 12px;" id="fn4"></span><span
							style="font-size: 12px; color: blue; float: right" id="fg4"></span><br>
						<span style="font-size: 12px;" id="fv4"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-7" style="margin-top: 10px;">
						<div class="pside" id="pside5"></div>
						<iframe width="100%" height="98px" id="f5"
							style="border-radius: 5px;"
							src="https://www.youtube.com/embed/GfWkG4qedoE" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="col-5" style="margin-top: 10px; padding-left: 0">
						<span style="font-weight: bold; font-size: 15px;" id="ft5"></span><br>
						<span style="font-size: 12px;" id="fn5"></span><span
							style="font-size: 12px; color: blue; float: right" id="fg5"></span><br>
						<span style="font-size: 12px;" id="fv5"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-7" style="margin-top: 10px;">
						<div class="pside" id="pside6"></div>
						<iframe width="100%" height="98px" id="f6"
							style="border-radius: 5px;"
							src="https://www.youtube.com/embed/GfWkG4qedoE" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="col-5" style="margin-top: 10px; padding-left: 0">
						<span style="font-weight: bold; font-size: 15px;" id="ft6"></span><br>
						<span style="font-size: 12px;" id="fn6"></span><span
							style="font-size: 12px; color: blue; float: right" id="fg6"></span><br>
						<span style="font-size: 12px;" id="fv6"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-7" style="margin-top: 10px;">
						<div class="pside" id="pside7"></div>
						<iframe width="100%" height="98px" id="f7"
							style="border-radius: 5px;"
							src="https://www.youtube.com/embed/GfWkG4qedoE" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="col-5" style="margin-top: 10px; padding-left: 0">
						<span style="font-weight: bold; font-size: 15px;" id="ft7"></span><br>
						<span style="font-size: 12px;" id="fn7"></span><span
							style="font-size: 12px; color: blue; float: right" id="fg7"></span><br>
						<span style="font-size: 12px;" id="fv7"></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	右邊載入 -->
	<br>
	<br>
	<br>
	<br>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	<script>
		// 	旁邊的推薦影片清單
		$
				.ajax({
					url : "/performanceSide",
					type : "POST",
					success : function(data) {
						var count = 1;
						var thispid = $("#thisp").val();
						$
								.each(
										data,
										function(index, value) {
											if (value['id'] != thispid
													&& count <= 7) {
												var url = value['url']
														.substring(32);
												$("#f" + count).attr(
														'src',
														'https://www.youtube.com/embed/'
																+ url);
												$("#ft" + count).html(
														value['title']);
												$("#fn" + count).html(
														value['username']);
												$("#fg" + count)
														.html(
																"# "
																		+ value['performanceGerne']);
												$("#fv" + count).html(
														value['views']);
												$("#pside"+count).click(function(){
													window.location.href="/performanceview/"+value['id'];
												})
												count++;
											}

										})
					}
				})

		// 	10秒鐘後才增加點閱率
		window.setTimeout(function() {
			$.ajax({
				url : "/pviewplus/" + $("#thisp").val(),
				type : "POST",
				success : function() {
					console.log("viewplus");
				}
			})
		}, 10000)
		</script>
		
		<sec:authorize access="isAuthenticated()">
		<script>
// 		檢查是否點過喜歡不喜歡
		var user = $("#thisuser").val();
		var pid = $("#thisp").val();
		$.ajax({
			url:'/user/performance/likeordislike',
			data:{
				"username":user,
				"id":pid
			},
			type:'POST',
			success:function(data){
				console.log(data);
				if(data==1){
					$("#ld").attr('class','col-4 likedivclick');
				}else if(data==2){
					$("#dd").attr('class','col-4 dislikedivclick');
				}
			}
		})
	</script>
</sec:authorize>
</body>
</html>