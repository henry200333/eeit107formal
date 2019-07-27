<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header>
<input hidden="hidden" name="userName" value="<sec:authentication property="name" />" id="username">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="headernav">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand" href="/index">Jayee</a>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="/index"
					style="float: right">街藝</a></li>
			</ul>
			<!-- 				未登入狀態 -->
			<sec:authorize access="!isAuthenticated()">
				<a href="/login"><button class="btn btn-primary my-2 my-sm-0"
						type="submit" style="margin-right: 15px;">登入</button></a>
				<a href="/register"><button class="btn btn-success my-2 my-sm-0"
						type="submit">註冊</button></a>
			</sec:authorize>
			<!-- 			登入狀態 -->
			<sec:authorize access="isAuthenticated()">
				<div style="  position: relative">
					<div
						style="font-size:15px;display: none; position: absolute; border: solid 1px black; background-color: white; top: 50px;; left: 0; width: 400px; opacity: 0.9"
						id="notice">
						
					</div>
					<button type="button" class="btn btn-dark"
					style="margin-right: 20px;" id="toggleNotcie">
					通知 <span class="badge badge-warning" id="noticeSize"></span> 
				</button>
				</div>
				<img src="/resources/profile_image/<sec:authentication		property="name" />.jpg" width="45px">
				<span style="color: white; margin-right: 40px; margin-left: 20px"><sec:authentication
						property="name" /></span>
			<sec:authorize access="hasAnyRole('USER', 'ARTIST')">
<%-- 			<input id="account" hidden="hidden" name="account" value="<sec:authentication property="name" />"> --%>
			<button class="btn btn-info" id="<sec:authentication property='name' />" type="button" onclick="userpage(this)">個人頁面</button>
				<button class="btn btn-info"  style="margin-left:20px" id="<sec:authentication property='name' />" type="button" onclick="edit(this)">帳號設定</button>
				<a href="/logout"><button class="btn btn-danger my-2 my-sm-0"
						type="submit"  style="margin-left:20px">登出</button></a>
			<script>
			function userpage(Object) {
				window.location.href = '/' + Object.id;
			}
			function edit(Object) {
				window.location.href = '/settings/profile';
			}
			
			$.ajax({
				url :"/venderselfpage/"+$("#username").val(),
				type :"GET",
				success : function(data) {
					$("#venderselfpage").attr("href","/job/vender/"+data.venderId)
				}
			});
			
			$("#toggleNotcie").click(function(){
				$("#notice").toggle();
				$.ajax({
					url :"/readNotice/"+$("#username").val(),
					type :"GET",
					success : function(data) {
						 notice();
					}
				});	
			});
			function response(object){
				console.log(object.value);
				console.log($(object).parent().attr('id'));
				$.ajax({
					url :"/notice/response/"+object.value+"/"+$(object).parent().attr('id'),
					type :"GET",
					success : function(data) {
						 notice();
					}
				});	
				
			}
			
			
		function notice(){
			$.ajax({
				url :"/findNotice/"+$("#username").val(),
				type :"GET",
				success : function(data) {
					var txt="<div style='height:40px;background-color:black'><span style='color:white;line-height:40px;font-weight:bold;margin-left:10px;'>通知</span></div>";
					$("#noticeSize").text(data.size);
					$.each(data.notices,function(key, obj){
						
						if(obj.friendstatus=="申請中"){
							txt+="<div style='height:50px;border-bottom:solid 1px silver;padding-left:5px' id='";
							txt+=obj.id;
							txt+="'><a href='";
							txt+=obj.url;
							txt+="'>";
							txt+="<span style='line-height:50px;margin-left:5px;'>"+obj.content+"</span>"
							txt+="</a><button onclick='response(this)' class='btn btn-danger my-2 my-sm-0'  style='float: right' value='reject'>拒絕</button><button onclick='response(this)' class='btn btn-primary my-2 my-sm-0' value='accept' style='float: right' value='accept'>接受</button></div>";
						}else if(obj.friendstatus!=null){
							txt+="<div style='height:50px;border-bottom:solid 1px silver;padding-left:5px;'' id='";
							txt+=obj.id;
							txt+="'><a href='";
							txt+=obj.url;
							txt+="'>";
							txt+="<span style='line-height:50px;margin-left:5px;'>"+obj.content+"</span>"
							txt+="</a><p style='float:right;font-color:silver;line-height:50px;padding-left:10px;'>";
							txt+=obj.friendstatus;
							txt+="<p></div>";
						
						}else{
						txt+="<a  href='";
						txt+=obj.url;
						txt+="'><div style='height:50px;border-bottom:solid 1px silver;padding-left:5px;height=30px'>";
						txt+="<span style='line-height:50px;margin-left:5px;'>"+obj.content+"</span>";
						txt+="</div></a>"
						}
					})
					$("#notice").html(txt)
				}
			});	}
		 notice();
			</script>
			</sec:authorize>	
			<sec:authorize access="hasRole('ADMIN')">
    		<a href="/admin/securityUser/list" class="btn btn-warning"><i class="fas fa-cog"></i></a>
			</sec:authorize>
			
			</sec:authorize>
		</div>

	</nav>
	
</header>