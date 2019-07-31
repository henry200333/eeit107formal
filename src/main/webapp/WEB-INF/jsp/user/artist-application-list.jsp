<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>


</head>
	<!-- Topbar -->
<jsp:include page="../topbar.jsp"></jsp:include>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


	
			

				<!-- Begin Page Content -->
				<div class="container">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">已申請工作</h1>
						<a href="/job/list"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" ><i
							class="fas fa-reply fa-sm text-white-50"></i>返回工作頁</a>
					</div>
			
					
				<input hidden="hidden" value="<sec:authentication property="name" />" id="username">
					
					
					<div id="applicationlist" class="row"></div>
					
					<div id="page" style='text-align: center'>
<!-- 						<label class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' -->
<!-- 							onclick='prevPage()' > << </label> -->
<!-- 							 <label class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' -->
<!-- 							onclick='changePage(this)' title='1'>1</label>  -->
<!-- 							<label class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' -->
<!-- 							onclick='changePage(this)' title='2'>2</label> -->
<!-- 							 <label class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' -->
<!-- 							onclick='nextPage()' > >> </label> -->
					</div>
					<div style='text-align: center'>
					<p>搜尋頁數
					<input id="pageSearch" style="width:2%;text-align:center" value="" onchange="pageSearch(this)"></p>
					</div>

				</div>
				<!-- /.container -->

			
<%-- 			<jsp:include page="../admin/footer.jsp"></jsp:include> --%>



	</div>
	<!-- End of Page Wrapper -->

<script>

var page = 1;
var total = 1;



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
		showjobs();
	}
//		alert(page)
}
function nextPage() {
	if (page == total) {
		alert("這是最後一頁了")
	} else {
		page = page + 1;
		showjobs();
	}
//		alert(page)
}
function changePage(object) {
//		alert(object.title);
	page = parseInt( object.title);
	showjobs();
}



function showPageList(){
	
	var txt="";
	$("#page").html(txt);
	txt += "<label class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' onclick='prevPage()' > << </label>"
	
		var count=0;
		var start;
		var end;
		if(total<=5){
		start= parseInt(1);
		end= parseInt(total);
		}else if((page-2)<1){
		start= parseInt(1);
		end=parseInt(5);
		}else if((page+2)>total){
			start= parseInt(total-5);
			end=parseInt(total);
		}else{
			start= parseInt(page-2);
			end=parseInt(page+2);
		}
		if((page-2)>1){
			txt += "<label class='d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm' onclick='changePage(this)' title='"+1+"'>"+1+"</label>";		
		}
		for(i=start;i<=end;i++){
			if(page==i)
				txt += "<label class='d-none d-sm-inline-block btn btn-sm btn-success shadow-sm' onclick='changePage(this)' title='"+i+"'>"+i+"</label>";			
			else
			txt += "<label class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' onclick='changePage(this)' title='"+i+"'>"+i+"</label>";		
		}
		if(page+2<total){
			txt += "<label class='d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm' onclick='changePage(this)' title='"+total+"'>"+total+"</label>";		
		}
	
		
	
	
	
	
	txt += "<label class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' onclick='nextPage()' > >> </label>"
		$("#page").html(txt);
}



function cancel(object) {

	$.ajax({
		url : "/job/cancelapplication?jobid=" + object.id
				+ "&username=" + $("#username").val(),
		type : "GET",
		success : function(data) {
			alert(data.mes);
			showjobs();
		}
	});
};


function showjobs() {

	$.ajax({
				url : "/job/finduserapplication/"+$("#username").val()+"?page="+page,
				type : "GET",
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					var txt = "";
					
					if(data==""){
						 txt += "<h4 class='col-sm-12 mb-0 mb-sm-0' style='text-align:center'>你沒有任何工作申請</h4>";	
					}
					$.each(data.rows,function(key, obj) {
						console.log(obj.job)
							txt += "<form class='col-sm-4 mb-0 mb-sm-0' style='padding: 5px;background:white'><div style='border-radius:20px;border: solid;background:#DDDDDD'><div class='col-sm-12 mb-3 mb-sm-3'><h2 class=' h3 mb-0 text-gray-800'>"
							txt += obj.job.name;
							txt += "</h2></div><div class='col-sm-12 mb-3 mb-sm-3'><label class=' h4 mb-0 text-gray-800'>店家:</label><br><a href='/job/vender/";
							txt += obj.job.vender.id;
							txt += "'class=' h4 mb-0 text-gray-800'>";
							txt += obj.job.venderName;
							txt += "</a></div><div class='col-sm-12 mb-3 mb-sm-3'><div class='row'><div class='col-sm-6 mb-6 mb-sm-3'><label class=' h4 mb-0 text-gray-800'>類別:</label><h2 class=' h4 mb-0 text-gray-800'>";
							txt += obj.job.jobType;
							txt += "</h2></div><div class='col-sm-6 mb-3 mb-sm-3'><label class=' h4 mb-0 text-gray-800'>薪資:</label><h4 class=' h4 mb-0 text-gray-800'>";
							txt += obj.job.reward;
							txt += "</h4></div></div></div><div class='col-sm-9 mb-3 mb-sm-6'><label class=' h4 mb-0 text-gray-800'>詳細內容:</label><textarea class='form-control' name='description'style='resize: none' readonly>";
							txt += obj.job.detal;
							txt += "</textarea></div><div class='col-sm-0 mb-3 mb-sm-6' style='text-align:right;margin-right:5%'><h2 class=' h4 mb-0 text-gray-800'>表演時間:"
							txt += obj.job.jobTime;
							txt += "</h2></div><div style='text-align:center'><input class='btn btn-primary btn-sm' id='";
							txt += obj.job.id;
							if(obj.job.status=="已應聘")
							txt += "'value='對方已接受' readonly></div></div></form>";
							else
							txt += "'onclick='cancel(this)' value='取消' readonly></div></div></form>";

						
					})
					total= parseInt(data.total);
					$("#applicationlist").html(txt);
				}
			})
			window.setTimeout(function() {
				showPageList()
		}, 100);
			
}
  

showjobs();
</script>
</body>
</html>