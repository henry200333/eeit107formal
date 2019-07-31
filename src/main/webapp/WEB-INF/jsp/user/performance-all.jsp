<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<style>
.pp{
font-size:14px;
}
.more{
font-size:19px;
color:black;
}
.more:hover{
    transition-property: padding-left;
    transition-duration: 0.5s;
    padding-left: 20px;
    cursor: pointer;
}

.p1{
    position: absolute;
    top: 0;
    left: 0;
    content: "";
    background-color: white;
    opacity: 0;
    z-index: 1;
    width: 100%;
    height: 100%;
        cursor: pointer;
}

.per{
    position: absolute;
    top: 0;
    left: 0;
    content: "";
    background-color: white;
    opacity: 0;
    z-index: 1;
    width: 300%;
    height: 100%;
    cursor: pointer;
}

.title{
	padding-top:5px;
	font-size:20px;
	font-weight:bold;
}

.username{
	padding-top:20px;
	line-height:40px;
	font-size:16px;
}

.viewandtime{
	font-size:16px;
}

.int{
	padding-top:5px;
	font-size:13px;
}

.type{
	padding-left:20px;
	color:blue;
	font-size:16px;
}
</style>
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
<div class="container">

<!-- 	搜尋 -->
	<div class="row" style="text-align:center;padding:10px;">
		<div class="input-group">
		<button class="btn btn-info" id="newp" style="margin-right:310px;border-radius:50px;"><i class="fas fa-plus"></i>  新增影片</button>
  <input type="text" class="form-control"  id="keywords"  placeholder="   搜尋表演..."     />
  <div class="input-group-append" >
  	<button class="btn btn-primary" type="button" id="type1"><i class="fas fa-music" ></i> 表演藝術</button>
    <button class="btn btn-primary" type="button" id="type2"><i class="fas fa-eye" ></i> 視覺藝術</button>
    <button class="btn btn-primary" type="button" id="type3"><i class="fas fa-puzzle-piece" ></i> 創意藝術</button>
    <button class="btn btn-danger" type="button" id="searchbtn"><i class="fas fa-search"></i></button>
    
  </div>
</div>
	</div>
		<input type="hidden" value="<sec:authentication property='name' />" id="thisuser">
	<script>
	
	$("#newp").click(function(){
		var user = $("#thisuser").val();
		if(user=="anonymousUser"){
			var login = confirm("請先登入");
			if(login==true){window.location.href="/login";}
		}else{
			window.location.href="/user/performance/select";
		}
		
	})
	
	var gerne = "all";
	
	$(".btn-primary").click(function(){
		if($(this).attr('class')=="btn-danger btn"){
			$(this).attr('class','btn-primary');
			$(this).addClass("btn");
			gerne="all";
		}else{
			$("#type1").attr('class','btn btn-primary');
			$("#type1").addClass("btn");
			$("#type2").attr('class','btn-primary');
			$("#type2").addClass("btn");
			$("#type3").attr('class','btn-primary');
			$("#type3").addClass("btn");
			
			$(this).attr('class','btn-danger');
			$(this).addClass("btn");
				gerne="all";
				if($(this).attr('id')=="type1"){
					gerne="perf";
				}
				if($(this).attr('id')=="type2"){
					gerne="look";
				}
				if($(this).attr('id')=="type3"){
					gerne="crea";
				}
		}
	})

	
	$("#searchbtn").click(function(){
		var keyword = $("#keywords").val();
		$.ajax({
			url:"/psearch",
			data:{
				"page":1,
				"performanceGerne": gerne,
				"keyword":keyword			
			},
		type:"POST",
		success:function(data){
				$("#pdiv").empty();
				$.each(data.rows,function(index,value){
					var txt="";
					var time = Date.parse(value['updateTime']);
					var today = new Date();
					var timehaha = today-time;
					var timeresult  = timehaha/60/60/24/1000;
					var url = value['url'].substring(32);
					txt+="<div class='row'>"
					txt+="<div class='col-4' style='position: relative'>";
					txt+="<div class='per' id='"+value['id']+"'></div>";
					txt+="<iframe width='100%' height='190px' src='https://www.youtube.com/embed/"+url+"' 	frameborder='0'		allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'		allowfullscreen></iframe>";
					txt+="</div>";
					txt+="<div class='col-8'><p class='title'>"+value['title']+"</p><img src='/resources/profile_image/"+value['account'] +".jpg' width='40px' style='border-radius:50%;padding-top:20px'><br><span class='username'>"+value['displayName']+"</span><span class='type'>#"+value['performanceGerne']+"</span><p class='viewandtime'>"+value['views']+" 觀看，"+parseInt(timeresult)+"天前發布</p><p class='int'>"+value['introduction']+"</p></div></div>";
						$("#pdiv").append(txt);
						$("#"+value['id']).click(function(){
							window.location.href="/performanceview/"+value['id'];
						});
				})
				
			}
		})
	})
	
	

	</script>
	<!-- 	搜尋結束 -->
	<div class="row"  style="padding-top:30px;">
		<div class="col-12" id="pdiv">
			<h4><i class="fas fa-music" ></i>  表演藝術</h4>
			<div class="row" style="padding-top:10px;"> 
				<div class="col-3" style="position: relative;padding:5px;" id="perf1">
					<div class="p1" id="perfd1"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="position: relative;padding:5px;" id="perf2">
					<div class="p1" id="perfd2"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="position: relative;padding:5px;" id="perf3">
					<div class="p1" id="perfd3"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="margin-top:160px;">
				<span  class="more" id="perfmore"><i class="fas fa-chevron-circle-right" ></i> 看更多</span>
				</div>
			</div>
			<h4><i class="fas fa-eye" style="margin-top:30px;"></i>  視覺藝術</h4>
			<div class="row" style="padding-top:10px;"> 
				<div class="col-3" style="position: relative;padding:5px;" id="look1">
					<div class="p1" id="lookd1"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
						
				</div> 
				<div class="col-3" style="position: relative;padding:5px;" id="look2">
					<div class="p1" id="lookd2"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="position: relative;padding:5px;" id="look3">
					<div class="p1" id="lookd3"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="margin-top:160px;">
				<span  class="more" id="lookmore"><i class="fas fa-chevron-circle-right" ></i> 看更多</span>
				</div>
			</div>
			<h4><i class="fas fa-puzzle-piece" style="margin-top:30px;"></i>  創意藝術</h4>
			<div class="row" style="padding-top:10px;"> 
				<div class="col-3" style="position: relative;padding:5px;" id="crea1">
					<div class="p1" id="cread1"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="position: relative;padding:5px;" id="crea2">
					<div class="p1" id="cread2"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="position: relative;padding:5px;" id="crea3">
					<div class="p1" id="cread3"></div>
					<iframe width="100%" height="190px" 
						src="https://www.youtube.com/embed/VVDsJKzbYcM" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
						<p style="font-weight:bold" id="pt">影片標題</p>
						<p style="margin-top:5px;" class="pp" id="pu">發布者</p> 
						<p  class="pp" id="pv">觀看人數，發布時間</p>
				</div>
				<div class="col-3" style="margin-top:160px;">
				<span  class="more" id="creamore"><i class="fas fa-chevron-circle-right" ></i> 看更多</span>
				</div>
			</div>
		</div>
	</div>
	<script>
		$.ajax({
			url:"/performanceall",
			type:"POST",
			success:function(data){
				var perf=1;
				var look=1;
				var crea=1;
				$.each(data,function(index,value){
					var type = value['performanceGerne'];
					var url = value['url'].substring(32);
					if(type=="表演藝術" && perf<=3){
						$("#perf"+perf+" iframe").attr('src','https://www.youtube.com/embed/'+url);
						$("#perf"+perf+" #pt").html(value['title']);
						$("#perf"+perf+" #pu").html(value['pdisplayName']);
						$("#perf"+perf+" #pv").html(value['views']+"觀看· "+value['updateTime']);
						$("#perfd"+perf).click(function(){
							window.location.href="/performanceview/"+value['id'];
						});
						perf++;
					}
					if(type=="視覺藝術" && look<=3){
						$("#look"+look+" iframe").attr('src','https://www.youtube.com/embed/'+url);
						$("#look"+look+" #pt").html(value['title']);
						$("#look"+look+" #pu").html(value['username']);
						$("#look"+look+" #pv").html(value['views']+"觀看· "+value['updateTime']);
						$("#lookd"+look).click(function(){
							window.location.href="/performanceview/"+value['id'];
						});
						look++;
					}
					if(type=="創意藝術" && crea<=3){
						$("#crea"+crea+" iframe").attr('src','https://www.youtube.com/embed/'+url);
						$("#crea"+crea+" #pt").html(value['title']);
						$("#crea"+crea+" #pu").html(value['username']);
						$("#crea"+crea+" #pv").html(value['views']+"觀看· "+value['updateTime']);
						$("#cread"+crea).click(function(){
							window.location.href="/performanceview/"+value['id'];
						});
						crea++;
					}
				})
			}
		})
		
			$("#perfmore").click(function(){
		$.ajax({
			url:"/psearch",
			data:{
				"page":1,
				"performanceGerne": "perf",
				"keyword":""			
			},
		type:"POST",
		success:function(data){
				$("#pdiv").empty();
				$.each(data.rows,function(index,value){
					var txt="";
					var time = Date.parse(value['updateTime']);
					var today = new Date();
					var timehaha = today-time;
					var timeresult  = timehaha/60/60/24/1000;
					var url = value['url'].substring(32);
					txt+="<div class='row'>"
					txt+="<div class='col-4' style='position: relative'>";
					txt+="<div class='per' id='"+value['id']+"'></div>";
					txt+="<iframe width='100%' height='190px' src='https://www.youtube.com/embed/"+url+"' 	frameborder='0'		allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'		allowfullscreen></iframe>";
					txt+="</div>";
					txt+="<div class='col-8'><p class='title'>"+value['title']+"</p><img src='/resources/profile_image/"+value['username'] +".jpg' width='40px' style='border-radius:50%;padding-top:20px'><br><span class='username'>"+value['pdisplayName']+"</span><span class='type'>#"+value['performanceGerne']+"</span><p class='viewandtime'>"+value['views']+" 觀看，"+parseInt(timeresult)+"天前發布</p><p class='int'>"+value['introduction']+"</p></div></div>";
						$("#pdiv").append(txt);
						$("#"+value['id']).click(function(){
							window.location.href="/performanceview/"+value['id'];
						});
				})
				
			}
		})
	})
	
		$("#lookmore").click(function(){
		$.ajax({
			url:"/psearch",
			data:{
				"page":1,
				"performanceGerne": "look",
				"keyword":""			
			},
		type:"POST",
		success:function(data){
				$("#pdiv").empty();
				$.each(data.rows,function(index,value){
					var txt="";
					var time = Date.parse(value['updateTime']);
					var today = new Date();
					var timehaha = today-time;
					var timeresult  = timehaha/60/60/24/1000;
					var url = value['url'].substring(32);
					txt+="<div class='row'>"
					txt+="<div class='col-4' style='position: relative'>";
					txt+="<div class='per' id='"+value['id']+"'></div>";
					txt+="<iframe width='100%' height='190px' src='https://www.youtube.com/embed/"+url+"' 	frameborder='0'		allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'		allowfullscreen></iframe>";
					txt+="</div>";
					txt+="<div class='col-8'><p class='title'>"+value['title']+"</p><img src='/resources/profile_image/"+value['username'] +".jpg' width='40px' style='border-radius:50%;padding-top:20px'><br><span class='username'>"+value['pdisplayName']+ "</span><span class='type'>#"+value['performanceGerne']+"</span><p class='viewandtime'>"+value['views']+" 觀看，"+parseInt(timeresult)+"天前發布</p><p class='int'>"+value['introduction']+"</p></div></div>";
						$("#pdiv").append(txt);
						$("#"+value['id']).click(function(){
							window.location.href="/performanceview/"+value['id'];
						});
				})
				
			}
		})
	})
	
		$("#creamore").click(function(){
		$.ajax({
			url:"/psearch",
			data:{
				"page":1,
				"performanceGerne": "crea",
				"keyword":""			
			},
		type:"POST",
		success:function(data){
				$("#pdiv").empty();
				$.each(data.rows,function(index,value){
					var txt="";
					var time = Date.parse(value['updateTime']);
					var today = new Date();
					var timehaha = today-time;
					var timeresult  = timehaha/60/60/24/1000;
					var url = value['url'].substring(32);
					txt+="<div class='row'>"
					txt+="<div class='col-4' style='position: relative'>";
					txt+="<div class='per' id='"+value['id']+"'></div>";
					txt+="<iframe width='100%' height='190px' src='https://www.youtube.com/embed/"+url+"' 	frameborder='0'		allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'		allowfullscreen></iframe>";
					txt+="</div>";
					txt+="<div class='col-8'><p class='title'>"+value['title']+"</p><img src='/resources/user-bootstrap/img/performance/"+value['userpId'] +".jpg' width='40px' style='border-radius:50%;padding-top:20px'><br><span class='username'>"+value['pdisplayName']+"</span><span class='type'>#"+value['performanceGerne']+"</span><p class='viewandtime'>"+value['views']+" 觀看，"+parseInt(timeresult)+"天前發布</p><p class='int'>"+value['introduction']+"</p></div></div>";
						$("#pdiv").append(txt);
						$("#"+value['id']).click(function(){
							window.location.href="/performanceview/"+value['id'];
						});
				})
				
			}
		})
	})
	</script>
</div>
<br><br><br>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>