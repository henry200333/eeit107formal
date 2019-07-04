<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert the Performance</title>
<link rel=stylesheet type="text/css"
	href="/resources/user-bootstrap/csstest/insertP.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container">
		<div class="row" id="first">

			<div class="col-md-4" id="1" >
				<form id='form1'>
					<div id="contact-form" class="form-container" data-form-container style='border-radius:15px;'>
						<div class="row">
							<div class="form-title">
								<span style='margin-left:70px;'>Performance 1</span>
							</div>
						</div>
						<div class="input-container">
							<div class="row">
								<span class="req-input"> <span class="input-status"
									data-toggle="tooltip" data-placement="top"
									title="Input The Title Of Performance."> </span> <input
									type="text" data-min-length="8" placeholder="Title">
								</span>
							</div>
							<div class="row">
								<span class="req-input message-box"><span
									class="input-status" data-toggle="tooltip" data-placement="top"
									title="Include The Introduction Of Performance."> </span> <textarea
										type="textarea" data-min-length="10" placeholder="Introduction"></textarea>
							</div>
							<div class="row">
								<span class="req-input"> <span class="input-status"
									data-toggle="tooltip" data-placement="top"
									title="Input The YoutubeURL Of Performance."> </span> <input
									type="text" data-min-length="8" placeholder="URL">
								</span>
							</div>
							<div class="row">
								<span class="req-input"> <span class="input-status"
									data-toggle="tooltip" data-placement="top"
									title="Select The Associated Activity."> </span> <input
									type="text" placeholder="Activity">
								</span>
							</div>							
							
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4" id="btns">
			<img src='/resources/user-bootstrap/img/performance/add.jpg' class='buttonadd' id='add'>
			<img src='/resources/user-bootstrap/img/performance/remove.jpg' class='buttonremove' id='remove'>
			<img src='/resources/user-bootstrap/img/performance/insert.jpg' class='buttoninsert' id='insert'>
			<img src='/resources/user-bootstrap/img/performance/sidetitle.gif' class='sidetitle'>
			</div>
		</div>
	</div>
<script>
$("#add").click(function(){
	var count = $("form").size();
	var newForm = "";
	newForm+= "<div class='col-md-4' id="+(count+1)+"><form id='form"+(count+1)+"'><div id='contact-form' class='form-container' data-form-container style='border-radius:15px;'><div class='row'><div class='form-title'><span style='margin-left:70px;'>Performance "+(count+1)+"</span></div></div><div class='input-container'><div class='row'><span class='req-input'><span class='input-status' data-toggle='tooltip' data-placement='top'	title='Input The Title Of Performance.'></span><input	type='text' data-min-length='8' placeholder='Title'></span></div>";
	newForm+="<div class='row'><span class='req-input message-box'><span	class='input-status' data-toggle='tooltip' data-placement='top'	title='Include The Introduction Of Performance.'></span><textarea	type='textarea' data-min-length='10' placeholder='Introduction'></textarea></div>";
	newForm+="<div class='row'><span class='req-input'><span class='input-status' data-toggle='tooltip' data-placement='top' title='Input The YoutubeURL Of Performance.'></span><input	type='text' data-min-length='8' placeholder='URL'></span></div>";
	newForm+="<div class='row'><span class='req-input'><span class='input-status' data-toggle='tooltip' data-placement='top' title='Select The Associated Activity.'> </span> <input	type='text' placeholder='Activity'></span></div></div></div></form></div>";			
	console.log(newForm);
	$("#btns").before(newForm);
})

$("#remove").click(function(){
	var count = $("form").size();
	if(count==1)alert("無法少於一個");
	else $("#"+count).remove();
})


</script>
</body>
</html>