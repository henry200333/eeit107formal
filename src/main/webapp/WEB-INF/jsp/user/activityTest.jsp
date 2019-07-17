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
  <div class="input-group">
<input type="text" class="form-control border-0 small" placeholder="搜尋活動..." aria-label="Search" aria-describedby="basic-addon2">
  <button id="searchBT" class="btn btn-primary" type="button">
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
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" aria-label="Previous" id="left">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
    </li>
   <li class="" id="page1">
      <a class="page-link"  id="now">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" aria-label="Next" id="right">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
    </li>
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
// $.ajax({
// 	url:"/user/activity/query",
// 	type:"GET",
// 	success: function(data){
// 		txt1="<div class='card h-100'><a href='#'><img class='card-img-top' src='/resources/user-bootstrap/img/activity/activity";
// 		//加圖片處
// 		txt2=".jpg' alt='' style='height:300px;width:550px;border-radius:20px'></a><div class='card-body'><h4 class='card-title'><a href='#'>";
// 		//加活動名稱區
// 		txt3="</a></h4><p class='card-text'>";
// 		//加文章區
// 		txt4="</p></div></div>";
// 		$.each(data,function(index,value){
// 			txt5 = txt1 + value.id + txt2 + value.name + txt3 + "放文章處" +txt4;
// 			$("#data0"+(index+1)).append(txt5);
// 		})
// 	},
// 	error:function(){
// 		alert("error");
// 	}
// })


var num=6;//每页显示多少条数据，暂定设为6.
var page;//总页数
var now_page=1;//当前页数

$.ajax({
	url:"/user/activity/query",
	type:"GET",
	success: function(data){
		if(data.length%num==0){
            page=data.length/num;
            /*数据长度是6的倍数，直接取商作为总页数*/
        }
        else{
            page=Math.ceil(data.length/num);
            /*数据长度不是6的倍数，用ceil()函数向上取整*/
        }  
		
		for(var p=2;p<page+1;p++){
			txt1 = "<li id='page"+p+"'><a class='page-link' href='#' id='now'>"+p+"</a></li>";
		}
		
		$("#page1").after(txt1);
		
		 var index=num;
		 dataDisplay(data,0,index);
		 $("#right").click(function(){
	            now_page++; /*每次点击下一页，页数+1*/
	            $("#page").text(now_page);/*改变分页按钮上显示的页数*/
	            if(now_page+1>page){
	                $("#right").removeAttr("disabled");
	                /*如果是最后一页，就禁用a标签*/
	            }
	            else{
	                $("#right").attr('disabled',"true");
	                 /*如果不是最后一页，就重新启用a标签*/
	            }

	            if(now_page-1<1){ 
	                $("#left").removeAttr("disabled");
	                /*如果是第一页，就禁用a标签*/
	            }
	            else{
	                $("#left").attr('disabled',"true");
	                /*如果不是第一页，就重新启用a标签*/
	            }
	            $("#dataBody").empty();/*清空上一页显示的数据*/
	            dataDisplay(data,index,index=index+num);
	            /*显示新一页的数据，*/
	        });
		 $("#left").click(function(){
	            now_page--;/*每次点击上一页，页数-1*/
	            $("#page").text(now_page);  //改变分页按钮上显示的页数
	            if(now_page-1<1){
	                $("#left").removeAttr("disabled");
	                /*如果是第一页，就禁用a标签*/
	            }
	            else{
	                $("#left").attr('disabled',"true");
	                /*如果不是第一页，就重新启用a标签*/
	            }

	            if(now_page+1>page){
	                $("#right").removeAttr("disabled");
	                /*如果是最后一页，就禁用a标签*/
	            } 
	            else{
	                $("#right").attr('disabled',"true");
	                /*如果不是最后一页，就重新启用a标签*/
	            }
	            $("#dataBody").empty();/*清空上一页显示的数据*/
	            dataDisplay(data,index=index-2*num,index=index+num);
	            /*显示新一页的数据，*/                   
	        });
	      
	},
	error:function(){
		alert("error");
	}
})

function dataDisplay(data,begin,end){
		txt1="<div class='col-lg-6 mb-4'><div class='card h-100'><a href='#'><img class='card-img-top' src='/resources/user-bootstrap/img/activity/activity";
		//加圖片處
		txt2=".jpg' alt='' style='height:300px;width:550px;border-radius:20px'></a><div class='card-body'><h4 class='card-title'><a href='#'>";
		//加活動名稱區
		txt3="</a></h4><p class='card-text'>";
		//加文章區
		txt4="</p></div></div><div>";
		 for(var i=begin;i<end;i++){
			txt5 = txt1 + data[i].id + txt2 + data[i].name + txt3 + "放文章處" +txt4;
			$("#dataBody").append(txt5);
		 }
}




</script>


</html>