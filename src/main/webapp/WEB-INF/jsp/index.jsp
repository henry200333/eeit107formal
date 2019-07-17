<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="bigdiv">
		<jsp:include page="topbar.jsp"></jsp:include>

		<div class="container">
			<div class="row">
				<div class="col-12" style="margin-top: 10px;">
					<span
						style="font-size: 30px; border-bottom: 3px solid black; font-weight: bold">
						<i class="fas fa-trophy"></i> 本週熱門藝人
					</span>
				</div>
			</div>

			<!-- 500:500 -->
			<div class="row" style="text-align: center; margin-top: 1em;">
				<div class="col-3" style="padding: 0 0 0 15px">
					<img src="/resources/user-bootstrap/img/index/artist1.jpg"
						width="100%" class="artist1"> <img
						src="/resources/user-bootstrap/img/index/artist3.jpg" width="100%"
						style="margin-top: 10px" class="artist1">
				</div>
				<div class="col-6" style="padding: 0 10px 0">
					<img src="/resources/user-bootstrap/img/index/artist2.gif"
						width="100%" class="artist1">
				</div>
				<div class="col-3" style="padding: 0 15px 0 0">
					<img src="/resources/user-bootstrap/img/index/artist4.jpg"
						width="100%" class="artist1"> <img
						src="/resources/user-bootstrap/img/index/artist5.jpg" width="100%"
						style="margin-top: 10px" class="artist1">
				</div>
			</div>

			<!-- <div>
            <div>
                <div id='art' style="margin-top:50px;"></div>
            </div>

        </div>


        <script>
            let nowImg = 3;

            var pic1 = $('<div>').append($('<img>').attr('src', 'article.jpg')).append($('<div>').append($('<p>').html('小哥哥<br><p>嗨</p>')));
            var pic2 = $('<div>').append($('<img>').attr('src', 'article.jpg')).append($('<p>').html('小哥哥'));
            var pic3 = $('<div>').append($('<img>').attr('src', 'article.jpg')).append($('<p>').html('被java打敗的小哥哥'));
            var pic4 = $('<div>').append($('<img>').attr('src', 'article.jpg')).append($('<p>').html('小哥哥'));
            var pic5 = $('<div>').append($('<img>').attr('src', 'article.jpg')).append($('<p>').html('被java打敗的小哥哥'));
            var itemsList = [pic1, pic2, pic3, pic4, pic5];

            $('#art').append(itemsList[0]).append(itemsList[1]).append(itemsList[2]).append(itemsList[3]);

                window.setInterval(function () {
                $($('#art').children('div')[0]).animate({ width: 'hide' }, 500, deleImgOne);
                $('#art').append(itemsList[++nowImg]);
                $($('#art').children('div')[4]).hide();
                $($('#art').children('div')[4]).animate({ width: 'show' }, 500);
                if (nowImg >= itemsList.length - 1) {
                    nowImg = -1;
                }
            },3000)
           

            function deleImgOne() {
                $($('#art').children('div')[0]).remove();
            }

        </script> -->

			<div class="slick">
				<div class="col-3">
					<img src="/resources/user-bootstrap/img/index/artist1.jpg"
						style="display: inline" width="40%"> <span
						class="artwalls1">artist1</span>
					<br> <span class="artwalls2">500,000人追蹤</span>
				</div>

				<div class="col-3">
					<img src="/resources/user-bootstrap/img/index/artist2.gif"
						style="display: inline" width="40%"> <span
						class="artwalls1">artist2</span>
					<br> <span class="artwalls2">700,000人追蹤</span>

				</div>
				<div class="col-3">
					<img src="/resources/user-bootstrap/img/index/artist3.jpg"
						style="display: inline" width="40%"> <span
						class="artwalls1">artist3</span>
					<br> <span class="artwalls2">100,000人追蹤</span>

				</div>
				<div class="col-3">
					<img src="/resources/user-bootstrap/img/index/artist4.jpg"
						style="display: inline" width="40%"> <span
						class="artwalls1">artist4</span>
					<br> <span class="artwalls2">200,000人追蹤</span>

				</div>
				<div class="col-3">
					<img src="/resources/user-bootstrap/img/index/artist5.jpg"
						style="display: inline" width="40%"> <span
						class="artwalls1">artist5</span>
					<br> <span class="artwalls2">500,000人追蹤</span>

				</div>
			</div>
			<script>
				$('.slick').slick({
					slidesToShow : 4,
					slidesToScroll : 1,
					arrows : false,
					autoplay : true,
					autoplaySpeed : 4000,
				});
			</script>

			<div class="row">
				<div class="col-8" style="margin-top: 40px;">
					<span
						style="font-size: 30px; border-bottom: 3px solid black; font-weight: bold;"><i
						class="fab fa-hotjar"></i>熱門活動</span>
				</div>

				<div class="col-4" style="margin-top: 40px; padding-left: 0;">
					<span
						style="font-size: 30px; border-bottom: 3px solid black; font-weight: bold"><i class="fas fa-star"></i>熱門文章</span>
				</div>
			</div>

			<!-- 300:1000 -->
			<div class="row">
				<div class="col-8" style="margin-top: 20px;">
					<div style="position: relative; padding-right: 15px; padding-top: 12px;" id="activity">
					<figure class="snip1543">
  		<img src="/resources/user-bootstrap/img/index/act1.gif" style='border-top-right-radius:20px;border-bottom-right-radius:20px;' alt="sample108" />
				  <figcaption>
   				 <h3 id='acth1'></h3>
    		<p id='actp1'></p>
  					</figcaption>
 					 <a href="#"></a>
					</figure>
					</div>
					<div style="position: relative; padding-right: 15px; padding-top: 12px;" id="activity">
						<figure class="snip1543">
  		<img src="/resources/user-bootstrap/img/index/act1.gif" style='border-top-right-radius:20px;border-bottom-right-radius:20px;' alt="sample108" />
				  <figcaption>
   				 <h3 id='acth2'></h3>
    		<p id='actp2'></p>
  					</figcaption>
 					 <a href="#"></a>
					</figure>
					</div>
					<div style="position: relative; padding-right: 15px; padding-top: 12px;" id="activity">
						<figure class="snip1543">
  		<img src="/resources/user-bootstrap/img/index/act1.gif" style='border-top-right-radius:20px;border-bottom-right-radius:20px;' alt="sample108" />
				  <figcaption>
   				 <h3 id='acth3'></h3>
    		<p id='actp3'></p>
  					</figcaption>
 					 <a href="#"></a>
					</figure>
					</div>
				</div>
				<script>
					$("#act1").hover(function() {
						$("#acts1").fadeToggle(300)
					})
					$("#act2").hover(function() {
						$("#acts2").fadeToggle(300)
					})
					$("#act3").hover(function() {
						$("#acts3").fadeToggle(300)
					})
					$(".hover").mouseleave(
  				function() {
    				$(this).removeClass("hover");
  					}
				);
				</script>
				<div class="col-4" style="height: 700px; margin-top: 28px;">
					<div class="row" style="height: 120px; border: 1px,black,solid;">
						<div id="articleImg1" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px;">
							<p id="articleTop1" style="font-size: 19px"></p>
							<span style="font-size: 14px"><i class="far fa-comment-dots"></i>  1750    </span><span style="font-size: 14px;margin-left:15px"><i class="fas fa-heart" style="margin-left:15px;"></i>   45123</span>
						</div>
					</div>
					<div class="row" style="height: 120px;">
						<div id="articleImg2" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px;">
							<p id="articleTop2" style="font-size: 19px"></p>
							<span style="font-size: 14px"><i class="far fa-comment-dots"></i>  315    </span><span style="font-size: 14px;margin-left:15px"><i class="fas fa-heart" style="margin-left:15px;"></i>   7701</span>
						</div>
					</div>
					<div class="row" style="height: 120px;">
						<div id="articleImg3" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px;">
							<p id="articleTop3" style="font-size: 19px"></p>
							<p style="font-size: 14px"><i class="far fa-comment-dots"></i>  189    <i class="fas fa-heart" style="margin-left:15px;"></i>   512</p>
						</div>
					</div>
					<div class="row" style="height: 120px;">
						<div id="articleImg4" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px;"
							style="margin-top:10px;">
							<p id="articleTop4" style="font-size: 19px"></p>
							<span style="font-size: 14px"><i class="far fa-comment-dots"></i>  115    </span><span style="font-size: 14px;margin-left:15px"><i class="fas fa-heart" style="margin-left:15px;"></i>   189</span>
						</div>
					</div>
					<div class="row" style="height: 120px;">
						<div id="articleImg5" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px;">
							<p id="articleTop5" style="font-size: 19px"></p>
							<span style="font-size: 14px"><i class="far fa-comment-dots"></i>  1    </span><span style="font-size: 14px;margin-left:15px"><i class="fas fa-heart" style="margin-left:15px;"></i>   10</span>
						</div>
					</div>
					<div class="row" style="height: 120px;">
						<div id="articleImg6" class="col-4" style="margin-top: 12px; padding-left: 15px; padding-right: 15px; border-radius: 10px; background-image:url('https://i.imgur.com/31rorUq.jpg'); background-size: cover; background-position: center;">
						</div>
						<div class="col-8" style="margin-top: 10px;">
							<p id="articleTop6" style="font-size: 19px"></p>
							<span style="font-size: 14px"><i class="far fa-comment-dots"></i>  125    </span><span style="font-size: 14px;margin-left:15px"><i class="fas fa-heart" style="margin-left:15px;"></i>   33</span>
							<a class="btn btn-primary" href="" style="float: right">看更多</a>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12" style="margin-top: 40px;">
					<span
						style="border-bottom: 3px solid black; font-size: 30px; font-weight: bold;"><i class="fab fa-youtube"></i>本週熱門表演</span>
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
				<div class="col-4" style="position: relative;">
				<div class="per1"></div>
					<iframe width="100%" height="240px;" id="url1"
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0" 
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen style="position: relative;"></iframe>
					<div style="margin-top: 10px;" id="performance1">
						<p style="line-height: 10px;" id='p1'></p>
						<p style="line-height: 10px;" id='p2'></p>
						<p style="line-height: 10px;" id='p3'></p>
					</div>
				</div>
				<div class="col-4"  style="position: relative;">
				<div class="per2"></div>
					<iframe width="100%" height="240px" id="url2"
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div style="margin-top: 10px;" id="performance2">
						<p style="line-height: 10px;" id='p1'></p>
						<p style="line-height: 10px;" id='p2'></p>
						<p style="line-height: 10px;" id='p3'></p>
					</div>
				</div>
				<div class="col-4"  style="position: relative;">
				<div class="per3"></div>
					<iframe width="100%" height="240px" id="url3"
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div style="margin-top: 10px;" id="performance3">
						<p style="line-height: 10px;" id='p1'></p>
						<p style="line-height: 10px;" id='p2'></p>
						<p style="line-height: 10px;" id='p3'></p>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="chat.jsp"></jsp:include>	
		<!-- Footer -->

		<footer class="page-footer font-small blue" style="margin-top: 30px;">

			<div style="background-color: black; text-align: center">
				<div class="container">
					<div class="row">
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">訂閱街藝</span>
							<br> <br> <input type="email" size="26"
								placeholder="Email@" style="line-height: 30px;">
							<button type="button" class="btn btn-danger">訂閱</button>
						</div>
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">最新消息</span>
							<div class="row"
								style="border-bottom: 1px solid white; padding: 20px 0px;">
								<div class="col-4" style="text-align: right">
									<img src="/resources/user-bootstrap/img/index/artist2.gif"
										width="80%" style="border-radius: 15px;"> <br>
								</div>
								<div class="col-8" style="text-align: left">
									<a href="" class="btn btn-primary" style="font-size: 10px;">藝人</a>
									<br> <br> <span style="color: white">藝人標題</span> <br>
								</div>
							</div>
							<div class="row"
								style="border-bottom: 1px solid white; padding: 20px 0px;">
								<div class="col-4" style="text-align: right">
									<img src="/resources/user-bootstrap/img/index/artist3.jpg"
										width="80%" style="border-radius: 15px;"> <br>
								</div>
								<div class="col-8" style="text-align: left">
									<a href="" class="btn btn-danger" style="font-size: 10px;">文章</a>
									<br> <br> <span style="color: white">文章標題</span> <br>
								</div>
							</div>
							<div class="row" style="padding: 20px 0px;">
								<div class="col-4" style="text-align: right">
									<img src="/resources/user-bootstrap/img/index/artist6.jpg"
										width="80%" style="border-radius: 15px;"> <br>
								</div>
								<div class="col-8" style="text-align: left">
									<a href="" class="btn btn-success" style="font-size: 10px;">表演</a>
									<br> <br> <span style="color: white">表演標題</span> <br>
								</div>
							</div>
						</div>
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">最近瀏覽</span>
						</div>
					</div>
				</div>
			</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
		</footer>
	</div>
	<script>
	$.ajax({
		url:"/index/performancetop",
		type:"POST",
		success: function(data){
			$.each(data,function(index,value){
				var p = index;
				var time = Date.parse(value['updateTime']);
				var today = new Date();
				var timehaha = today-time;
				var timeresult  = timehaha/60/60/24/1000;
				var count = value['url'].indexOf("=");
				var url = value['url'].substring(count+1);
				$("#url"+(p+1)).attr('src','https://www.youtube.com/embed/'+url);
				$(".per"+(p+1)).click(function(){
					window.location.href="/index/performanceview/"+value['id'];
				});
				$("#performance"+(p+1)).children("#p1").html(value['title']);
				$("#performance"+(p+1)).children("#p2").html(value['username']);
				$("#performance"+(p+1)).children("#p3").html(value['views']+"觀看，"+parseInt(timeresult)+"前發布");
				
			})
		},
		error:function(){
			alert("error");
		}
	})
	$.ajax({
		url:"/index/activityTop3",
		type:"GET",
		success: function(data){
			txt1="<div style='position: relative' id='activity'><div style='position: absolute; margin-left: 280px; z-index: 2; top: 20px; display: none; border-left: 180px solid transparent; width: 450px; height: 0; border-bottom: 219px solid #ff7575' id='acts1'><span style='color: white'>"; 
			txt2="<img src='/resources/user-bootstrap/img/index/act1.gif' width='100%' style='position: absolute; top: 20px;' id='act1'></div>";
			$.each(data,function(index,value){
				pictureNum = value['id'];
				txt3 = "<br>發布人："+value['artist']+"<br>時間："+value['beginTime']+" 至 <br>　　　"+value['endTime']+"<br>參加人數："+value['awesomeNum'];
				$("#acth"+(index+1)).append(value['name']);
				$("#actp"+(index+1)).append(txt3);
// 				<br> <br>活動名稱 <br>發布人
// 				<br>時間 <br>參加人數
				
			})
		},
		error:function(){
			alert("error");
		}
	})
	
	//獲取articleTop6並放入對應的DIV及IMG
	$.ajax({
		url:"/index/articleTop6",
		type:"GET",
		success: function(res){
			if(res.type == "SUCCESS"){
				var data = res.data;
				var articleTop = "#articleTop";
				var articleImg = "#articleImg";
				for(var i = 0; i < data.length; i++){
					var content = data[i].content;
					$(articleTop + (i + 1)).append(data[i].name);
					$(articleTop + (i + 1)).attr('id', 'article' + data[i].id);
					var start = content.indexOf('](http');
					var end = content.indexOf('.jpg');
					var endpng = content.indexOf('.png');
					var endgif = content.indexOf('.gif');
					if(end != -1 && endpng != -1){
						if(end > endpng){
							end = endpng;
						}
					}else if(end == -1 && endpng != -1){
						end = endpng;
					}
					if(end != -1 && endgif != -1){
						if(end > endgif){
							end = endgif;
						}
					}else if(end == -1 && endgif != -1){
						end = endgif;
					}
					if(start != -1 && end != -1){
						var url = content.substring(start + 2, end + 4);
						$(articleImg + (i + 1)).attr('style', "margin-top: 12px; padding-left: 15px; padding-right: 15px; border-radius: 15px; background-image:url('" + url + "'); background-size: cover; background-position: center; cursor: pointer;");
					} else {
						$(articleImg + (i + 1)).attr('style', "margin-top: 12px; padding-left: 15px; padding-right: 15px; border-radius: 15px; background-image:url('/resources/user-bootstrap/img/index/article.jpg'); background-size: cover; background-position: center; cursor: pointer;");
					}
				}
			}
		}
	})
	
	</script>
</body>
</html>