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
<input type="hidden" value="${activityParam.id}" id="thisp">
	<input type="hidden" value="<sec:authentication property='name' />" id="thisuser">
	<sec:authorize access="isAuthenticated()">
	<input type='hidden' value="<sec:authentication property='principal.account'/>" id='userAccount'>
	<input type='hidden' value="<sec:authentication property='principal.displayName'/>" id='userDisplayName'>
	<input type='hidden' value="<sec:authentication property='principal.photo'/>" id='userPhoto'>
	</sec:authorize>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light static-top mb-5 shadow">
  <div class="container">
    <a class="navbar-brand" href="#" id='title'>搜尋活動頁面...</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <button class="btn btn-primary" id='newActivity'>新增活動</button>
        </li>
        <li class="nav-item  active">
          <button class="btn btn-muted" >查詢頁面
          	<span class="sr-only"></span>
          </button>
        </li>
      </ul>
    </div>
  </div>
</nav>
		
		<div class="container">
	<!-- Page Content -->
		<div>

  <!-- Page Heading -->
  
  
  
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

$("#searchBT").click(function searchBT(){
	find=$("#userInput").val();
	page=1;
	totalPage=0;
	$("#dataBody").empty();
	var aa = JSON.parse($("#searchForm").serializeObject());
	var bb = {'page':page,'rows':rows};
	var data =Object.assign(aa,bb);
	$.ajax({
		url : "/activity/query",
		type : "GET",
		data :data,
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		success : function(res) {
	 			var txt6 ="";
		 		$.each(res.rows,function(index,value){
		 			if(value['activityStatus']==0){
		 				txt3="</a></h4><div style='text-decoration: underline'><i class='fab fa-hotjar' style='color:Orange'></i>活動進行中！</div><p class='card-text'>";
			 			txt4="</p></div></div></div>";
			 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
			 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
			 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
			 			txt6 += txt5;
		 			}else if(value['activityStatus']==1){
		 				txt3="</a></h4><div style='text-decoration: underline'><i class='far fa-clock' style='color:LimeGreen'></i>活動尚未舉辦...</div><p class='card-text'>";
			 			txt4="</p></div></div></div>";
			 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
			 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
			 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
			 			txt6 += txt5;
		 			}else if(value['activityStatus']==2){
		 				txt3="</a></h4><div style='text-decoration: underline'><i class='fas fa-bed' style='color:RoyalBlue'></i>活動已結束！</div><p class='card-text'>";
			 			txt4="</p></div></div></div>";
			 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
			 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
			 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
			 			txt6 += txt5;
		 			}
		 		 })
				$("#dataBody").append(txt6);
		}
	})
	page++;
});

var actType =null;

function type11(obj){
	actType=obj.value;
	page=1;
	totalPage=0;
	$("#dataBody").empty();
	$.ajax({
		url : "/activity/query",
		type : "GET",
		data : {"actType":obj.value,"page":page,"rows":rows},
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		success : function(res) {
	 			var txt6 ="";
		 		$.each(res.rows,function(index,value){	
		 			if(value['activityStatus']==0){
		 				txt3="</a></h4><div style='text-decoration: underline'><i class='fab fa-hotjar' style='color:Orange'></i>活動進行中！</div><p class='card-text'>";
			 			txt4="</p></div></div></div>";
			 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
			 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
			 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
			 			txt6 += txt5;
		 			}else if(value['activityStatus']==1){
		 				txt3="</a></h4><div style='text-decoration: underline'><i class='far fa-clock' style='color:LimeGreen'></i>活動尚未舉辦...</div><p class='card-text'>";
			 			txt4="</p></div></div></div>";
			 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
			 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
			 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
			 			txt6 += txt5;
		 			}else if(value['activityStatus']==2){
		 				txt3="</a></h4><div style='text-decoration: underline'><i class='fas fa-bed' style='color:RoyalBlue'></i>活動已結束！</div><p class='card-text'>";
			 			txt4="</p></div></div></div>";
			 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
			 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
			 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
			 			txt6 += txt5;
		 			}
		 		 })
				$("#dataBody").append(txt6);
		 		totalPage = res.total;
		}
	})
	page++;
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

		

	<jsp:include page="../footer.jsp"></jsp:include>
	
		
		
	

</body>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/admin-bootstrap/js/jquery-ui-timepicker-addon.js"></script>
<script>
var page = 2;
var rows = 6;
var totalPage=10;
$(document).ready(showjobs(page-1));
function showjobs(page) {	
	
	$.ajax({url : "/activity/query",
		type : "GET",
		data:{'page':page,'rows':rows},
		success : function(data) {
	 		var txt6 ="";
	 		$.each(data.rows,function(index,value){
	 			if(value['activityStatus']==0){
	 				txt3="</a></h4><div style='text-decoration: underline'><i class='fab fa-hotjar' style='color:Orange'></i>活動進行中！</div><p class='card-text'>";
		 			txt4="</p></div></div></div>";
		 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
		 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
		 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
		 			txt6 += txt5;
	 			}else if(value['activityStatus']==1){
	 				txt3="</a></h4><div style='text-decoration: underline'><i class='far fa-clock' style='color:LimeGreen'></i>活動尚未舉辦...</div><p class='card-text'>";
		 			txt4="</p></div></div></div>";
		 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
		 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
		 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
		 			txt6 += txt5;
	 			}else if(value['activityStatus']==2){
	 				txt3="</a></h4><div style='text-decoration: underline'><i class='fas fa-bed' style='color:RoyalBlue'></i>活動已結束！</div><p class='card-text'>";
		 			txt4="</p></div></div></div>";
		 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
		 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
		 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
		 			txt6 += txt5;
	 			}
	 		 })
			$("#dataBody").append(txt6);
// 	 		page++;
		}
	})
}

var timer
var find = $('#userInput').val();
$(window).scroll(function(){	
	window.clearTimeout(timer);
	timer = window.setTimeout(
			function(){
				 // Returns height of browser viewport
				  var window_height = $( window ).height()*1.3;
				  var window_scrollTop = $(window).scrollTop();
				  // Returns height of HTML document
				  var document_height = $( document ).height();
// 				  alert(window_height);
// 				  alert(window_scrollTop);
// 				  alert(document_height);
				   if(window_height + window_scrollTop >= document_height){
					   if(page>totalPage){
						   return;
					   }else{
						$.ajax({url : "/activity/query",
							type : "GET",
							data:{'page':page,'rows':rows,'actType':actType,'find':find},
							success : function(data) {
						 		var txt6 ="";
						 		$.each(data.rows,function(index,value){
						 			if(value['activityStatus']==0){
						 				txt3="</a></h4><div style='text-decoration: underline'><i class='fab fa-hotjar' style='color:Orange'></i>活動進行中！</div><p class='card-text'>";
							 			txt4="</p></div></div></div>";
							 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
							 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
							 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
							 			txt6 += txt5;
						 			}else if(value['activityStatus']==1){
						 				txt3="</a></h4><div style='text-decoration: underline'><i class='far fa-clock' style='color:LimeGreen'></i>活動尚未舉辦...</div><p class='card-text'>";
							 			txt4="</p></div></div></div>";
							 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
							 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
							 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
							 			txt6 += txt5;
						 			}else if(value['activityStatus']==2){
						 				txt3="</a></h4><div style='text-decoration: underline'><i class='fas fa-bed' style='color:RoyalBlue'></i>活動已結束！</div><p class='card-text'>";
							 			txt4="</p></div></div></div>";
							 			txt2=".jpg' style='height:280px;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='/activity/view/"+value['id']+"'>";
							 			txt1="<div class='col-lg-4 mb-4'><div class='card h-100' style='border-radius:20px';><a href='/activity/view/"+value['id']+"'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
							 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 +"<div style='font-weight:bold;'><span style='color:red'>表演描述：</span>"+ value['description'] +"</div>"+"<br><div style='font-weight:bold;'><span style='color:red'>表演類型：</span>"+value['perfType']+"</div>"+txt4;
							 			txt6 += txt5;
						 			}
						 		 })
								$("#dataBody").append(txt6);
						 		totalPage = data.total;
							}
						})//ajax尾	
						page++;
// 						alert(page+" "+totalPage);
				   } } //if尾
			},300)
}
);

$("#newActivity").click(function(){
	var user = $("#thisuser").val();
	if(user=="anonymousUser"){
		var login = confirm("請先登入");
		if(login==true){window.open("/login")+(location.href).substring(7);}
	}else{
		window.location.assign("/activity/add");
	}
})




</script>


</html>