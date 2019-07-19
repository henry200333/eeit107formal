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
		
		<div class="container">
	<!-- Page Content -->
		<div>

  <!-- Page Heading -->
  
  
  <div style="position: relative;">
  <h1 class="">搜尋活動頁面
  </h1><hr>
  </div>
  <form class=""  style="margin-bottom: 20px;" id='searchForm' >
  <div class="row" style='border-radius:20px'>
  <div class='col-12'>  
   <div class="input-group mb-3" style='margin-top:10px;width:300px'>
	<input type="text" class="form-control border-0 small" placeholder="搜尋活動名稱或演出者..." name="find" id='userInput' autocomplete="off">
  	<button id="searchBT" class="btn btn-info" type="button"><i class="fas fa-search fa-sm"></i></button>
  </div> 
   <button type="button" class="btn" value='all' onclick='type11(this)'>全選</button>
<button type="button" class="btn btn-primary" value='perf' onclick='type11(this)' name='表演藝術' >表演藝術</button>
<button type="button" class="btn btn-success" value='look' onclick='type11(this)' name='視覺藝術'>視覺藝術</button>
<button type="button" class="btn btn-danger" value='crea' onclick='type11(this)' name='創意藝術'>創意藝術</button>
  </div>
  </div>
   </form>
  <hr>
  <div class="row" id="dataBody">
   
  </div>
  <!-- /.row -->

  <!-- Pagination -->
  <ul class="pagination justify-content-center" id='pageList'>
   
  </ul>

</div>
<!-- /.container -->	


<script>
$("#searchBT").click(function(){
	$("#dataBody").empty();
	var data = JSON.parse($("#searchForm").serializeObject());
	$.ajax({
		url : "/user/activity/query?page=" +page,
		type : "GET",
		data :data,
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		success : function(res) {
	 			var txt6 ="";
				txt1="<div class='col-lg-6 mb-4'><div class='card h-100' style='border-radius:20px';><a href='#'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
		 		//加圖片處
		 		txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='#'>";
		 		//加活動名稱區
		 		txt3="</a></h4><p class='card-text'>";
		 		//加文章區
		 		txt4="</p></div></div></div>";
		 		$.each(res.rows,function(index,value){
		 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 + value['description'] +"   "+value['perfType']+txt4;
		 			txt6 += txt5;
		 		 })
				total= parseInt(data.total);
				$("#dataBody").append(txt6);
		}
	})
});


function type11(obj){
	$("#dataBody").empty();
	$.ajax({
		url : "/user/activity/query?page="+page,
		type : "GET",
		data : {"actType":obj.value},
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		success : function(res) {
	 			var txt6 ="";
				txt1="<div class='col-lg-6 mb-4'><div class='card h-100' style='border-radius:20px';><a href='#'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
		 		//加圖片處
		 		txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='#'>";
		 		//加活動名稱區
		 		txt3="</a></h4><p class='card-text'>";
		 		//加文章區
		 		txt4="</p></div></div></div>";
		 		$.each(res.rows,function(index,value){
		 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 + value['description'] +"   "+value['perfType']+txt4;
		 			txt6 += txt5;
		 		 })
				$("#dataBody").append(txt6);
		}
	})
	
	}


<!--按Enter搜尋 起始-->
//userInput=輸入搜尋字串的input標籤id
//searchBT=208行的function
$("#userInput").bind("keypress", keypressInBox);
function keypressInBox(e) {
var code = (e.keyCode ? e.keyCode : e.which);
if (code == 13) { //Enter keycode=13 
e.preventDefault();
$("#searchBT").click();  
}
};
<!--按Enter搜尋 尾-->

</script>
		
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
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>
<script>
var page  =1;
var total =1;

$(document).ready(function showjobs() {
	$.ajax({url : "/user/activity/query?page="+page,
		type : "GET",
		success : function(data) {
	 		var txt6 ="";
			txt1="<div class='col-lg-6 mb-4'><div class='card h-100' style='border-radius:20px';><a href='#'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
	 		//加圖片處
	 		txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='#'>";
	 		//加活動名稱區
	 		txt3="</a></h4><p class='card-text'>";
	 		//加文章區
	 		txt4="</p></div></div></div>";
	 		$.each(data.rows,function(index,value){
	 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 + value['description'] +"   "+value['perfType']+txt4;
	 			txt6 += txt5;
	 		 })
			total= parseInt(data.total);
			$("#dataBody").append(txt6);
		}
	})
})



</script>


</html>