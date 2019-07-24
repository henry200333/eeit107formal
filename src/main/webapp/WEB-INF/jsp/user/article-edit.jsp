<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<jsp:include page="../header.jsp"></jsp:include>
<!-- <link rel="stylesheet" -->
<link rel="stylesheet" href="/resources/editormd/css/editormd.css" />

<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<div class="container">
		<div class="row"></div>
		<div class="row">
			<div class="col-6">
				<h2>
					<b>修改文章</b>
				</h2>
			</div>
		</div>
		<form id="form1">
			<div class="form-group row">
				<div class="col-10">
					<label for="name">文章標題：</label> <input id="name" name="name"
						class="form-control" maxlength="30" placeholder="請輸入文章標題..." value="${articleParam.name}" />
					<small class="form-text text-muted">文章標題(最少2個字，最多30個字)</small>
				</div>
			</div>
			<hr>
			<div class="form-group row">
				<div class="col-12">
					<label for="append-test">文章內容(支援Markdown語法)：</label> <small
						class="form-text text-muted">文章內容最多10000個字元</small>
					<div id="test-editor">
						<textarea id="content" name="content" style="display: none;">${articleParam.content}</textarea>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<input id="id" name="id"
						class="form-control" style="display: none;" value="${articleParam.id}" />
				<input id="articleType" name="articleType"
						class="form-control" style="display: none;" value="${articleParam.articleType}" />
				<input id="refId" name="refId"
						class="form-control" style="display: none;" value="${articleParam.refId}" />
			</div>
		<hr>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-3">
				<button type="button" id="goToEdit"
					class="btn btn-warning btn-block">
					<span class="icon text-white-50"> <i
						class="fas fa-file-import"></i>
					</span> <span class="text-white"> 修改文章</span>
				</button>
			</div>
			<div class="col-3">
				<button type="reset" id="resetEdit"
					class="btn btn-danger btn-user btn-block">
					<span class="icon text-white-50"> <i
						class="fas fa-file-excel"></i>
					</span> <span class="text"> 重置欄位</span>
				</button>
			</div>
		</div>
		</form>
		
		<br>
	</div>
	<!-- 	footer開始，包含聊天 -->
		<jsp:include page="../chat.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	<!-- 	footer結束 -->
</body>
<!-- 			load markdown editor.md -->
<script src="/resources/editormd/editormd.js"></script>
<script src="/resources/editormd/languages/zh-tw.js"></script>
<script type="text/javascript">
	$(function() {
		var editor = editormd("test-editor", {
			width : "100%",
			height : "700",
			path : "/resources/editormd/lib/"
		});
	});
</script>
<!-- Ajax SerializeObject Function -->
<script>
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
<!-- Ajax SerializeObject Function -->
<!-- insert文章按鈕 -->
<script>
$("#goToEdit").click(function(){
	if($("#name").val().length >= 2 && $("#name").val().length <= 30){
		$.ajax({
			url:"/article/edit",
			type:"PUT",
			contentType : 'application/json;charset=UTF-8',
			dataType : 'json',
			data : $("#form1").serializeObject(),
			success: function(res){
				if(res.type == "SUCCESS"){
					alert("您成功修改文章名稱：\n" + res.data.name);
					$(location).attr('href', '/article/' + res.data.id);
				} else {
					alert("連線逾時！\n請重新登入！");
				}
			}
		});
	}else{
		alert('文章標題格式不正確');
	}
});
</script>
<!-- insert文章按鈕 -->
<!-- 驗證name欄位是否符合限定 -->
<script>
$("#name").blur(function(){
	var input = $(this).val();
	if(input.length >= 2 && input.length <= 30){
		$(this).attr("class", "form-control is-valid");
	} else {
		$(this).attr("class", "form-control is-invalid");
	}
})
</script>
<!-- 驗證name欄位是否符合限定 -->

</html>