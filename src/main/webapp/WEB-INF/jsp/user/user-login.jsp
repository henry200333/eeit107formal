<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Bootstrap Flat Modal Login Modal Form</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Knewave|Pacifico&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	        html {
            height: 100%;
        }

        body {
            background-image: url(/resources/user-bootstrap/img/bgimg.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }

    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-login .modal-header {
		border-bottom: none;
        position: relative;
		justify-content: center;
	}
	.modal-login .close {
        position: absolute;
		top: -10px;
		right: -10px;
	}
	.modal-login h4 {
		color: #636363;
		text-align: center;
		font-size: 26px;
		margin-top: 0;
	}
	.modal-login .modal-content {
		color: #999;
		border-radius: 1px;
    	margin-bottom: 15px;
        background: #fff;
		border: 1px solid #f3f3f3;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 25px;
    }
	.modal-login .form-group {
		margin-bottom: 20px;
	}
	.modal-login label {
		font-weight: normal;
		font-size: 13px;
	}
	.modal-login .form-control {
		min-height: 38px;
		padding-left: 5px;
		box-shadow: none !important;
		border-width: 0 0 1px 0;
		border-radius: 0;
	}
	.modal-login .form-control:focus {
		border-color: #ccc;
	}
	.modal-login .input-group-addon {
		max-width: 42px;
		text-align: center;
		background: none;
		border-width: 0 0 1px 0;
		padding-left: 5px;
		border-radius: 0;
	}
    .modal-login .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #19aa8d;
        border-radius: 3px;
		border: none;
		min-width: 140px;
        outline: none !important;
    }
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #179b81;
	}
	.modal-login .hint-text {
		text-align: center;
		padding-top: 5px;
		font-size: 13px;
	}
	.modal-login .modal-footer {
		color: #999;
		border-color: #dee4e7;
		text-align: center;
		margin: 0 -25px -25px;
		font-size: 13px;
		justify-content: center;
	}
	.modal-login a {
		color: #fff;
		text-decoration: underline;
	}
	.modal-login a:hover {
		text-decoration: none;
	}
	.modal-login a {
		color: #19aa8d;
		text-decoration: none;
	}	
	.modal-login a:hover {
		text-decoration: underline;
	}
	.modal-login .fa {
		font-size: 21px;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
	
	.btnnew{
/* 		background-color:#FF8888; */
/* 		border:10px solid #FF8888; */
		border-radius:20px;
		font-size:30px;
		color:white;
		padding:15px;
	font-family: 'Knewave', cursive;
	}
	.jayee{
	font-size:250px;
	color:white;
	font-family: 'Pacifico', cursive;
	margin-top:180px;
	}
	
	.btnnew:hover{
		text-decoration:none;
		color:white;
		opacity:0.7;
	}
	
	.btnnew:visited{
	color:white;
	}
</style>
</head>
<body>
<div class="text-center">
	<!-- Button HTML (to Trigger Modal) -->
	<p class="jayee">Jayee</p><br><br><br><br><br><br>
	<a href="#myModal" class="btnnew" data-toggle="modal">LETS GO</a>
</div>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">Sign In</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="/user/index" method="post">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" class="form-control" name="username" placeholder="Username" required="required">
							<p>使用帳號SeaOtter進入後台</p>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="text" class="form-control" name="password" placeholder="Password" required="required">
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-lg">Sign In</button>
					</div>
					<p class="hint-text"><a href="#">Forgot Password?</a></p>
				</form>
			</div>
			<div class="modal-footer">Don't have an account? <a href="#">Create one</a></div>
		</div>
	</div>
</div>     
</body>
</html>                            