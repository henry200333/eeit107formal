<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../topbar.jsp"></jsp:include>
<body>
		
		<div class="container">
	<!-- Page Content -->
		<div>

  <!-- Page Heading -->
  
  <form class=""  style=" margin-bottom: 20px;">
  <div style="position: absolute;">
  <h1 class="">活動頁面
   
  </h1>
  </div>
  <div style="margin-left: 800px;">
  <div class="input-group" style='margin-top:10px'>
<input type="text" class="form-control border-0 small" placeholder="搜尋活動...">
  <button id="searchBT" class="btn btn-info" type="button">
					                  <i class="fas fa-search fa-sm"></i>
					                </button>
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
var page  =1;
var total =1;
function showjobs() {
				$.ajax({url : "/user/activity/query?page=" + page,
							type : "GET",
							success : function(data) {
						 		var txt6 ="";
								txt1="<div class='col-lg-6 mb-4'><div class='card h-100' style='border-radius:20px';><a href='#'><img class='artist1' src='/resources/user-bootstrap/img/activity/activity";
						 		//加圖片處
						 		txt2=".jpg' style='height:100%;width:100%;border-radius:20px;'></a><div class='card-body'><h4 class='card-title'><a href='#'>";
						 		//加活動名稱區
						 		txt3="</a></h4><p class='card-text'>";
						 		//加文章區
						 		txt4="</p></div></div></div>";
						 		$.each(data.rows,function(index,value){
						 			txt5 = txt1 + value['id'] + txt2 + value['name'] + txt3 + "放文章處" +txt4;
						 			txt6 += txt5;
						 		 })
								total= parseInt(data.total);
								$("#dataBody").append(txt6);
								showPageList();
							}
						})
			}

function pageSearch(object){
	if(object.value>0&&object.value<=total){
	page=object.value;
	showjobs();}
	else{
		alert("錯誤頁碼")
	}
}
function prevPage() {
	if (page == 1) {
		alert("已經第一頁了")
	} else {
		page = page-1;
		$("#dataBody").empty();
		showjobs();
	}
//		alert(page)
}
function nextPage() {
	
	if (page == total) {
		alert("這是最後一頁了")
	} else {
		page = page + 1;
		$("#dataBody").empty();
		showjobs();
	}
//		alert(page)
}
function changePage(object) {
//		alert(object.title);
	$("#dataBody").empty();
	page = parseInt(object.title);
	showjobs();
}


function showPageList(){
	$("#pageList").empty();
	txt="";
	txtLeft = "<li class='page-item'><a class='page-link' aria-label='Previous' id='left' onclick='prevPage()'><span aria-hidden='true'>&laquo;</span></a></li>";
	txtRight = "<li class='page-item'><a class='page-link' aria-label='Next' id='right' onclick='nextPage()'><span aria-hidden='true'>&raquo;</span></a></li>";
	if(total<=7){
		for(i=1; i<=total;i++){
			txt +="<li><a class='page-link'  id='now' onclick='changePage(this)' title='"+i+"'>"+i+"</a></li>";
		}
	}else{
		var count=0;
		var start;
		var end;
		if((page-3)<1){
		start= parseInt(1);
		end=parseInt(7);
		}else if((page+3)>total){
			start= parseInt(total-7);
			end=parseInt(total);
		}else{
			start= parseInt(page-3);
			end=parseInt(page+3);
		}
		if((page-3)>1){
			txt += "<li><a class='page-link'  id='now' onclick='changePage(this)' title='"+1+"'>"+1+"</a></li>...";		
		}
		for(i=start;i<=end;i++){
			txt += "<li><a class='page-link'  id='now' onclick='changePage(this)' title='"+i+"'>"+i+"</a></li>";		
		}
		if(page+3<total){
			txt += "...<li><a class='page-link'  id='now' onclick='changePage(this)' title='"+total+"'>"+total+"</a></li>";		
		}
	}
	txtResult = txtLeft + txt + txtRight;
		$("#pageList").append(txtResult);
}

showjobs();


</script>


</html>