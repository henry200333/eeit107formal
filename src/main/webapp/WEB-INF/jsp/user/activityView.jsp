<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../topbar.jsp"></jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />	
<link rel="stylesheet" href="/resources/admin-bootstrap/css/jquery-ui-timepicker-addon.css">

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light static-top mb-5 shadow">
  <div class="container">
    <a class="navbar-brand" href="#" id='title'>活動詳情</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">新增活動
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">編輯此活動</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/activity/list">返回查詢頁面</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">
  <div class="card border-0 shadow my-5">
    <div class="card-body p-5">
    <div id='dataDiv'>
    
    
    <div class='row'>
    <div >
   <img src='/resources/user-bootstrap/img/activity/activity${activityParam.id}.jpg' style='height:280px;border-radius:20px;width:500px'>
   </div>
   <div style='padding-left:10px'>
   <img src='/resources/user-bootstrap/img/activity/activity1.jpg' style='height:280px;border-radius:20px;'>
   </div>
  	</div>
  
   <div style='padding-top:20px' id="塞資料處">
   <div class='row'>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="fas fa-user"></i>表演者名: </span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${activityParam.artist}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="far fa-smile-beam"></i>活動地點: </span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${locationLocationName}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="far fa-smile-beam"></i>活動名稱: </span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${activityParam.name}</span>
   </div>
   
    <div class="col-12">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="far fa-calendar-alt"></i>活動期間:</span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${beginTime} 至   ${endTime}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i class="fas fa-hat-wizard"></i>表演類型:</span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${activityParam.perfType}</span><br>
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i	class="fab fa-hotjar"></i>追蹤人數:</span>
   <span style="font-size: 20px; font-weight: bold;padding-left:15px">${activityParam.awesomeNum}</span>
   </div>
   <div class="col-6">
   <span style="font-size: 20px; border-bottom: 3px solid black; font-weight: bold;"><i	class="fab fa-hotjar"></i>地址:</span><br>
   <span style="font-size: 20px; font-weight: bold;padding-left:20px">${locationCity}${locationDistrict}${locationAddress}</span>
   </div>
   <div class="col-5" id='article'>
   
   </div>
 
   
   </div>  
   </div>
   
</div>




    </div>
  </div>
</div>







		<jsp:include page="../chat.jsp"></jsp:include>	
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

	<jsp:include page="../footer.jsp"></jsp:include>
	
		</footer>
		


</body>

<script>
$.ajax({
	url : "/activity/article/"+${activityParam.id},
	type : "GET",
	contentType : 'application/json;charset=UTF-8',
	dataType : 'json',
	success : function(res) {
// 			alert(JSON.stringify(res.data[0].name));
			if(res.type=="ERROR"){
				txt1 ="<span style='font-size: 20px; border-bottom: 3px solid black; font-weight: bold;'><i class='far fa-newspaper'></i>相關文章:<br></span>";
		 		txt2 ="<div id='"+${activityParam.id}+"'><span style='font-size: 20px; border-bottom: 1px solid black; font-weight: bold; color:red'>暫無文章</span></div>";
		 		 txt3 = txt1+txt2;
				$("#article").append(txt3);
			}else{
			txt1 ="<span style='font-size: 20px; border-bottom: 3px solid black; font-weight: bold;'><i class='far fa-newspaper'></i>相關文章:<br></span>";
	 		$.each(res.data,function(index,value){
	 			txt2 ="<div onclick='popout(this)' style='cursor:pointer;' id='"+value.id+"'><span style='font-size: 20px; border-bottom: 1px solid black; font-weight: bold; color:red'>"+value.name+"</span></div>";
	 		 	txt3 = txt1+txt2;
	 		})
		
			$("#article").append(txt3);}
	}
})

function popout(obj){
	articleUrl = "/article/"+obj.id;
	window.open (articleUrl);
}


</script>



</html>