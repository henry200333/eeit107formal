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
			<div class="row" style="text-align: center; margin-top: 1em;" id="artists">
				<div class="col-3" style="padding: 0 0 0 15px">
					<a id="artistlink1" href=""><img src=""
						width="100%" class="artist1"></a> <a id="artistlink3" href=""><img
						src="" width="100%"
						style="margin-top: 10px" class="artist3"></a>
				</div>
				<div class="col-6" style="padding: 0 10px 0">
					<a id="artistlink2" href=""><img src=""
						width="100%" class="artist2"></a>
				</div>
				<div class="col-3" style="padding: 0 15px 0 0">
					<a id="artistlink4" href=""><img src=""
						width="100%" class="artist4"></a> <a id="artistlink5" href=""><img
						src="" width="100%"
						style="margin-top: 10px" class="artist5"></a>
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
					<img src=""
						style="display: inline" width="40%" class="artistPic1"> <span
						class="artwalls1 artname1" ></span>
					<br> <span class="artwalls2 follow1" ></span>
				</div>

				<div class="col-3">
					<img src=""
						style="display: inline" width="40%" class="artistPic2"> <span
						class="artwalls1 artname2"></span>
					<br> <span class="artwalls2 follow2"></span>

				</div>
				<div class="col-3">
					<img src=""
						style="display: inline" width="40%" class="artistPic3"><span
						class="artwalls1 artname3" ></span>
					<br> <span class="artwalls2 follow3" ></span>

				</div>
				<div class="col-3">
					<img src=""
						style="display: inline" width="40%" class="artistPic4"><span
						class="artwalls1 artname4"></span>
					<br> <span class="artwalls2 follow4"></span>

				</div>
				<div class="col-3">
					<img src=""
						style="display: inline" width="40%" class="artistPic5"><span
						class="artwalls1 artname5" ></span>
					<br> <span class="artwalls2 follow5"></span>

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
					<div style="position: relative; padding-right: 15px; padding-top: 12px; height:235px" id="activity1">
					
					</div>
					<div style="position: relative; padding-right: 15px; padding-top: 12px; height:235px" id="activity2">
						
					</div>
					<div style="position: relative; padding-right: 15px; padding-top: 12px; height:235px" id="activity3">
						
					</div>
				</div>
				<script>
// 					$("#act1").hover(function() {
// 						$("#acts1").fadeToggle(300)
// 					})
// 					$("#act2").hover(function() {
// 						$("#acts2").fadeToggle(300)
// 					})
// 					$("#act3").hover(function() {
// 						$("#acts3").fadeToggle(300)
// 					})
// 					$(".hover").mouseleave(
//   				function() {
//     				$(this).removeClass("hover");
//   					}
// 				);
				</script>
				<div class="col-4" style="height: 700px; margin-top: 28px;">
					<div class="row articleblock" style="height: 120px; cursor: pointer;" onclick="goToArticle(this);">
						<div id="articleImg1" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px; position:relative;">
							<p id="articleTop1" style="font-size: 19px; position: absolute; top: 5px""></p>
							<span style="font-size: 14px; position: absolute; bottom: 5px;"><i class="far fa-comment-dots"></i><i id="articleView1" class="fas fa-eye" style="margin-left:15px;"></i></span>
						</div>
					</div>
					<div class="row articleblock" style="height: 120px; cursor: pointer;" onclick="goToArticle(this);">
						<div id="articleImg2" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px; position:relative;">
							<p id="articleTop2" style="font-size: 19px; position: absolute; top: 5px""></p>
							<span style="font-size: 14px; position: absolute; bottom: 5px;"><i class="far fa-comment-dots"></i><i id="articleView2" class="fas fa-eye" style="margin-left:15px;"></i></span>
						</div>
					</div>
					<div class="row articleblock" style="height: 120px; cursor: pointer;" onclick="goToArticle(this);">
						<div id="articleImg3" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px; position:relative;">
							<p id="articleTop3" style="font-size: 19px; position: absolute; top: 5px""></p>
							<span style="font-size: 14px; position: absolute; bottom: 5px;"><i class="far fa-comment-dots"></i><i id="articleView3" class="fas fa-eye" style="margin-left:15px;"></i></span>
						</div>
					</div>
					<div class="row articleblock" style="height: 120px; cursor: pointer;" onclick="goToArticle(this);">
						<div id="articleImg4" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px; position:relative;"
							style="margin-top:10px;">
							<p id="articleTop4" style="font-size: 19px; position: absolute; top: 5px""></p>
							<span style="font-size: 14px; position: absolute; bottom: 5px;"><i class="far fa-comment-dots"></i><i id="articleView4" class="fas fa-eye" style="margin-left:15px;"></i></span>
						</div>
					</div>
					<div class="row articleblock" style="height: 120px; cursor: pointer;" onclick="goToArticle(this);">
						<div id="articleImg5" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px; position:relative;">
							<p id="articleTop5" style="font-size: 19px; position: absolute; top: 5px""></p>
							<span style="font-size: 14px;  position: absolute; bottom: 5px;"><i class="far fa-comment-dots"></i><i id="articleView5" class="fas fa-eye" style="margin-left:15px;"></i></span>
						</div>
					</div>
					<div class="row articleblock" style="height: 120px; cursor: pointer;" onclick="goToArticle(this);">
						<div id="articleImg6" class="col-4">
						</div>
						<div class="col-8" style="margin-top: 10px; position:relative;">
							<p id="articleTop6" style="font-size: 19px; position: absolute; top: 5px"></p>
							<span style="font-size: 14px;  position: absolute; bottom: 5px;"><i class="far fa-comment-dots"></i><i id="articleView6" class="fas fa-eye" style="margin-left:15px;"></i></span>
							<a class="btn btn-primary" href="/article" style="position: absolute; bottom: 0; margin-left: 170px;">看更多</a>
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
				<div class="per" id="per1"></div>
					<iframe width="100%" height="240px;" id="url1"
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0" 
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen style="position: relative;"></iframe>
					<div style="margin-top: 10px;" id="performance1">
						<p style="line-height: 30px;font-weight:bold " id='p1'></p>
						<p style="line-height: 20px;font-size:14px" id='p2'></p>
						<p style="line-height: 20px;font-size:14px" id='p3'></p>
						<p style="line-height: 20px;font-size:14px;float:right" id='p4'></p>
					</div>
				</div>
				<div class="col-4"  style="position: relative;">
				<div class="per"  id="per2"></div>
					<iframe width="100%" height="240px" id="url2"
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div style="margin-top: 10px;" id="performance2">
						<p style="line-height: 30px;font-weight:bold " id='p1'></p>
						<p style="line-height: 20px;font-size:14px" id='p2'></p>
						<p style="line-height: 20px;font-size:14px" id='p3'></p>
						<p style="line-height: 20px;font-size:14px;float:right" id='p4'></p>
					</div>
				</div>
				<div class="col-4"  style="position: relative;">
				<div class="per"  id="per3"></div>
					<iframe width="100%" height="240px" id="url3"
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div style="margin-top: 10px;" id="performance3">
						<p style="line-height: 30px;font-weight:bold" id='p1'></p>
						<p style="line-height: 20px;font-size:14px" id='p2'></p>
						<p style="line-height: 20px;font-size:14px" id='p3'></p>
						<p style="line-height: 20px;font-size:14px;float:right" id='p4'></p>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="chat.jsp"></jsp:include>	
		<!-- Footer -->

		
	<jsp:include page="footer.jsp"></jsp:include>
	
		
	</div>
	<script>
	$.ajax({
		url:"/performancetop",
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
				$("#per"+(p+1)).click(function(){
					window.location.href="/performanceview/"+value['id'];
				});
				$("#performance"+(p+1)).children("#p1").html(value['title']);
				$("#performance"+(p+1)).children("#p2").html(value['username']);
				$("#performance"+(p+1)).children("#p3").html(value['views']+"觀看");
				$("#performance"+(p+1)).children("#p4").html(parseInt(timeresult)+"  天前發布");
				
			})
		},
		error:function(){
			alert("error");
		}
	})
	$.ajax({
		url:"/activityTop3",
		type:"GET",
		success: function(data){
			$.each(data,function(index,value){
// 				pictureNum = value['id'];
// 				txt3 = "<br>發布人："+value['artist']+"<br>時間："+value['beginTime']+" 至 <br>　　　"+value['endTime']+"<br>參加人數："+value['awesomeNum'];
// 				txt4 = "<figure class='snip1543'><img src='/resources/user-bootstrap/img/activity/activity"+value['id']+".jpg' style='border-top-right-radius:20px;border-bottom-right-radius:20px;'/><figcaption>;"
// 				txt5 = "</figcaption><a href='/activity/view/"+value['id']+"'></a></figure>";
// 				$("#activity"+(index+1)).prepend(txt4);
// 				$("#acth"+(index+1)).append(value['name']);
// 				$("#actp"+(index+1)).append(txt3);
// 				$("#actp"+(index+1)).after(txt5);
// 				<br> <br>活動名稱 <br>發布人
// 				<br>時間 <br>參加人數
				txt1 = "<figure class='snip1543'><img src='/resources/user-bootstrap/img/activity/activity"+value['id']+".jpg' style='border-top-right-radius:20px;border-bottom-right-radius:20px;height:232px;width:755px'/><figcaption>";
		   		txt2 = "<h3 id='acth1'>"+value['name']+"</h3>";
		    	txt3 = "<p id='actp1'><br>發布人："+value['artist']+"<br>時間："+value['beginTime']+" 至 <br>　　　"+value['endTime']+"<br>參加人數："+value['awesomeNum']+"</p></figcaption><a href='/activity/view/"+value['id']+"'></a></figure>";
				txt4 = txt1+txt2+txt3;
				$("#activity"+(index+1)).append(txt4);
				
				
				
				
				
				
				
			})
		},
		error:function(){
			alert("error");
		}
	})
	
	//獲取articleTop6並放入對應的DIV及IMG
	$.ajax({
		url:"/articleTop6",
		type:"GET",
		success: function(res){
			if(res.type == "SUCCESS"){
				var data = res.data;
				var articleTop = "#articleTop";
				var articleImg = "#articleImg";
				var articleView = "#articleView";
				for(var i = 0; i < data.length; i++){
					var content = data[i].content;
					$(articleTop + (i + 1)).append(data[i].name); //加入文章名稱
					$(articleView + (i + 1)).after(" " + data[i].count); //加入文章觀看次數
					$(articleTop + (i + 1)).parent().parent().attr('id', 'article' + data[i].id); //修改div的id為文章id
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
						$(articleImg + (i + 1)).attr('style', "margin-top: 12px; padding-left: 15px; padding-right: 15px; border-radius: 15px; background-image:url('" + url + "'); background-size: cover; background-position: center;");
					} else {
						$(articleImg + (i + 1)).attr('style', "margin-top: 12px; padding-left: 15px; padding-right: 15px; border-radius: 15px; background-image:url('/resources/user-bootstrap/img/index/article.jpg'); background-size: cover; background-position: center;");
					}
				}
			}
		}
	});
	//獲取forum數量填入熱門文章TOP6的指定位置
	$.ajax({
		url:"/articleTop6ForumNum",
		type:"GET",
		success: function(res){
			if(res.type == "SUCCESS"){
				var data = res.data;
				var articleView = "#articleView";
				for(var i = 0; i < data.length; i++){
					$(articleView + (i + 1)).before(" " + data[i]); //加入文章觀看次數
				}
			}
		}
	});
	//獲取forum數量填入熱門文章TOP6的指定位置
	//前往指定id的article頁面開始
	function goToArticle(obj){
		$(location).attr('href', '/article/' + obj.id.substring(7));
	};
	//前往指定id的article頁面結束
	$.ajax({
		url:"/artistTop5",
		type:"GET",
		success: function(data){
			$.each(data,function(index,value){
				var count = index+1;
				$(".artist"+count).attr('src',value['photo']);
				$(".artistPic"+count).attr('src',value['photo']);
				$("#artistlink"+count).attr('href',"/"+value['account']);
				$(".artistPic"+count).click(function(){
					window.location.href="/"+value['account'];
				});
				$(".artname"+count).html(value['displayName']);
				$(".follow"+count).html(value['followers']+"人追蹤");
			})
		}
	});
	
	</script>
</body>
</html>