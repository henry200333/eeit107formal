<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="bigdiv">
		<jsp:include page="../topbar.jsp"></jsp:include>

		<div class="container"></div>
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
		
		</div>

</body>
</html>