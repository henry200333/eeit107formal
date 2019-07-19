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
			<div class="col-1"></div>
			<div class="col-5">
				<h5>
					<b>${article.articleType}</b>
				</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-6">
				<h2>
					<b>${article.name}</b>
				</h2>
			</div>
			<div class="col-2" style="text-align: right;">
				最後修改時間：
			</div>
			<div class="col-3">
				${article.announce}
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-1"></div>
			<div id="test-editormd-view" class="col-10">
				<textarea id="append-test" style="display: none;">${article.content}</textarea>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

</body>
<script src="/resources/editormd/editormd.min.js"></script>
<script src="/resources/editormd/languages/zh-tw.js"></script>
<script src="/resources/editormd/lib/marked.min.js"></script>
<script src="/resources/editormd/lib/prettify.min.js"></script>

<script src="/resources/editormd/lib/raphael.min.js"></script>
<script src="/resources/editormd/lib/underscore.min.js"></script>
<script src="/resources/editormd/lib/sequence-diagram.min.js"></script>
<script src="/resources/editormd/lib/flowchart.min.js"></script>
<script src="/resources/editormd/lib/jquery.flowchart.min.js"></script>
<script type="text/javascript">
	$(function() {
		var testEditormdView;
		testEditormdView2 = editormd.markdownToHTML("test-editormd-view", {
			htmlDecode : "style,script,iframe", // you can filter tags decode
			emoji : true,
			taskList : true,
			tex : true, // 默认不解析
			flowChart : true, // 默认不解析
			sequenceDiagram : true, // 默认不解析
		});
	});
</script>
</html>