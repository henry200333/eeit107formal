<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>404</title>
<style>
body{
font-family:'微軟正黑體';
}
</style>
</head>
<body>
<div style="text-align:center;margin-top:350px;">
<h1>這是404你知道的</h1>
<h4>將在<span>3</span>秒後回到JAYEE首頁...</h4>
</div>
<script>
var time=3;
window.setInterval(function(){
	if(time==0){
		window.location.href="/index";
	}else{
	time--;
	$("span").html(time);}
	
},1000)
</script>
</body>
</html>