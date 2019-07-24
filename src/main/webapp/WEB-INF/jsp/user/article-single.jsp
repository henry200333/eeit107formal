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
				<a id="EditBtAnchor" href="/article" class="btn btn-info btn-icon-split articleblock">
					<span class="icon text-white-50"><i class="fas fa-reply-all"></i></span>
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
			<div class="col-11" style="text-align: right;">發布時間：
				${createdDate}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-1"></div>
			<div id="test-editormd-view" class="col-10">
				<textarea id="append-test" style="display: none;">${article.content}</textarea>
			</div>
		</div>
		<hr>
		<div class='row'>
			<div class="col-8">
				<!-- 				留言輸入 -->
				<div class="row" style="margin-top: 40px; margin-left: 50px;">
					<div class="col-10">
						<div class="col-3">
							<h3>
								<b>留言</b>
							</h3>
						</div>
						<textarea id='firstLayerComment' cols="68" rows="3"
							style="resize: none"></textarea>
					</div>
					<div class="col-1" style="padding-top: 80px;">
						<button id='firstLayerButton' type="button"
							class="btn btn-primary">
							<i class="fas fa-share"></i>
						</button>
					</div>
				</div>
				<!-- 				留言開始 -->
					<sec:authorize access="isAuthenticated()">
	<input type='hidden' value="<sec:authentication property='principal.account'/>" id='userAccount'>
	<input type='hidden' value="<sec:authentication property='principal.displayName'/>" id='userDisplayName'>
	<input type='hidden' value="<sec:authentication property='principal.photo'/>" id='userPhoto'>
	</sec:authorize>
<script>
var thisBoard = 'Article';
var thisThemeId = ${article.id};
</script>
				<script src='/resources/user-bootstrap/js/commentLoader.js'></script>
				<div id='commentAppend' style="margin-top: 20px;"></div>
			</div>
		</div>
		<!-- 				留言結束 -->

		<!-- 回文章列表按鈕 -->
		<div class="row">
			<div class="col-11" style="text-align: right;">
				<a href="/article" class="btn btn-info btn-icon-split articleblock">
					<span class="icon text-white-50"><i class="fas fa-reply-all"></i></span>
					<span class="text">回文章列表</span>
				</a>
			</div>
		</div>
		<!-- 回文章列表按鈕 -->
		<br>
	</div>
	<!-- 	footer開始，包含聊天 -->
	<jsp:include page="../chat.jsp"></jsp:include>
	<jsp:include page="../footer.jsp"></jsp:include>
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
	switch (entype) {
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
		$("#articletype").html(
				"文章類型： <i class='fas fa-exclamation-triangle'></i>系統公告");
		break;
	}
</script>
<!-- 讀取英文文章類別轉換成中文 -->
<!-- 使用者與文章擁有者一致時寫出編輯按鈕 -->
<script>
	$.ajax({
		url:"/article/articleEditBT",
		type:"GET",
		success: function(res){
			if(res.type == "SUCCESS"){
				$("#EditBtAnchor").before('<a href="/article/edit/' + res.data + '" class="btn btn-warning btn-icon-split articleblock"><span class="icon text-white-50"><i class="fas fa-edit"></i></span><span class="text-white">修改文章</span></a>');
			}
		}
	});
</script>
<!-- 使用者與文章擁有者一致時寫出編輯按鈕 -->
</html>