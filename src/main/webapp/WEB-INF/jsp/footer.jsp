<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<footer class="page-footer font-small blue" style="margin-top: 30px;">

			<div style="background-color: black; text-align: center">
				<div class="container">
					<div class="row">
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">訂閱街藝</span>
							<br> <br> <input type="email" size="26"
								placeholder="Email@" style="line-height: 30px;margin-top:40px;">
							<button type="button" class="btn btn-danger" style="vertical-align:baseline;border-radius:0">訂閱</button>
							<br><br><span style="color:white">訂閱jayee街藝</span><br>
							<span style="color:white">獲取第一手最新消息</span><br>
						</div>
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">最新消息</span>
						</div>
						<div class="col-4" style="margin-top: 20px">
							<span
								style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">關於街藝</span>
								<br><br><span style="color:white">________________________</span>
								<br><span style="color:white;margin-right:86px;">|</span><span style="color:white;margin-left:86px;">|</span><br>
								<span style="color:white">|<span style="margin-left:40px;margin-right:40px;">資策會107級</span>|</span><br>
								<span style="color:white">|________________________|</span><br><br>
								<span style="color:white">Team</span><br>
								<span style="color:white">______________</span><br><br>
								<span style="color:white">劉長軒</span><br>
								<span style="color:white">彭璿哲</span><br> 
								<span style="color:white">陳品堯</span><br>
								<span style="color:white">李承宇</span><br>
								<span style="color:white">吳帆祥</span><br>
								<span style="color:white">李宜鳴</span><br>
						</div>
					</div>
				</div>
			</div>
</footer>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	
	<div class="collapse navbar-collapse" id="navbarTogglerDemo01"
		style="text-align: center">
		<a class="navbar-brand" href="#"
			style="margin: auto; font-size: 15px;">© 2019 Copyright Jayee.com</a>
	</div>
	<script >
	 $.fn.serializeObject = function() {
	        var o = {};
	        var a = this.serializeArray();
	        $.each(a, function() {
	            if (o[this.name]) {
	                if (!o[this.name].push) {
	                    o[this.name] = [o[this.name]];
	                }
	                o[this.name].push(this.value || '');
	            } else {
	                o[this.name] = this.value || '';
	            }
	        });
	        return JSON.stringify(o);
	    };
	</script>
	
</nav>