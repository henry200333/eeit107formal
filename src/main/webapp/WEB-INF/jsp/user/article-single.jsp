<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet"
	href="/resources/editormd/css/editormd.preview.min.css" />
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-11" style="text-align: right;">
				<a href="/article" class="btn btn-info btn-icon-split articleblock">
				 <span class="icon text-white-50"> <i class="fas fa-reply"></i></span> 
				 <span class="text">回文章列表</span>
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-5">
				<h5>
					<b id="articletype">${article.articleType}</b>
				</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-11">
				<h2>
					<b>${article.name}</b>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-11" style="text-align: right;">最後修改時間：
				${article.announce}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-1"></div>
			<div id="test-editormd-view" class="col-10">
				<textarea id="append-test" style="display: none;">${article.content}</textarea>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3"><h3><b>留言</b></h3></div>
		</div>
		<div id="forunContainer1" class="row">
			<div class="col-1"></div>
			<div id="forumName1" class="col-2" style="text-align: right;"><b>HenryLeo</b></div>
			<div id="forumContent1" class="col-7">頭香</div>
		</div>
		<div id="forunContainer2" class="row">
			<div class="col-1"></div>
			<div id="forumName2" class="col-2" style="text-align: right;"><b>K.Z.</b></div>
			<div id="forumContent2" class="col-7">3樓要請大家吃雞排</div>
		</div>
		<div id="forunContainer3" class="row">
			<div class="col-1"></div>
			<div id="forumName3" class="col-2" style="text-align: right;"><b>口鳥先生</b></div>
			<div id="forumContent1" class="col-7">頭香</div>
		</div>
		
		<!-- 回文章列表按鈕 -->
		<div class="row">
			<div class="col-11" style="text-align: right;">
				<a href="/article" class="btn btn-info btn-icon-split articleblock">
				 <span class="icon text-white-50"> <i class="fas fa-reply"></i></span> 
				 <span class="text">回文章列表</span>
				</a>
			</div>
		</div>
		<!-- 回文章列表按鈕 -->
		<br>
	</div>
	<!-- 	footer開始，包含聊天 -->
	<jsp:include page="../chat.jsp"></jsp:include>
	<footer>
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
	<!-- 	footer結束 -->
</body>
<!-- 引入markdown語法轉換為HTML元件輸出需要的JS -->
<script src="/resources/editormd/editormd.min.js"></script>
<script src="/resources/editormd/languages/zh-tw.js"></script>
<script src="/resources/editormd/lib/marked.min.js"></script>
<script src="/resources/editormd/lib/prettify.min.js"></script>

<script src="/resources/editormd/lib/raphael.min.js"></script>
<script src="/resources/editormd/lib/underscore.min.js"></script>
<script src="/resources/editormd/lib/sequence-diagram.min.js"></script>
<script src="/resources/editormd/lib/flowchart.min.js"></script>
<script src="/resources/editormd/lib/jquery.flowchart.min.js"></script>
<!-- 引入markdown語法轉換為HTML元件輸出需要的JS -->
<!-- 讀取markdown語法所在的DIV並重新以HTML元件寫出 -->
<script type="text/javascript">
	$(function() {
		var testEditormdView;
		testEditormdView2 = editormd.markdownToHTML("test-editormd-view", {
			htmlDecode : "style,script,iframe", // you can filter tags decode
			emoji : true,
			taskList : true,
			tex : true, //預設不解析
			flowChart : true, //預設不解析
			sequenceDiagram : true, //預設不解析
		});
	});
</script>
<!-- 讀取markdown語法所在的DIV並重新以HTML元件寫出 -->
<!-- 讀取英文文章類別轉換成中文 -->
<script type="text/javascript">
	var entype = $("#articletype").html();
	switch(entype){
	case 'Artist':
		$("#articletype").html("文章類型： <i class='fas fa-street-view'></i>藝人");
		break;
	case 'Activity':
		$("#articletype").html("文章類型： <i class='fas fa-glass-cheers'></i>活動");
		break;
	case 'Performance':
		$("#articletype").html("文章類型： <i class='fab fa-youtube'></i>表演");
		break;
	case 'Vender':
		$("#articletype").html("文章類型： <i class='fas fa-hands-helping'></i>廠商");
		break;
	case 'Other':
		$("#articletype").html("文章類型： <i class='fas fa-question'></i>其他");
		break;
	}
</script>
<!-- 讀取英文文章類別轉換成中文 -->
</html>