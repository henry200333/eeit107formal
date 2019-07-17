<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="talk">
			<img src="/resources/user-bootstrap/img/index/talk.gif" class="talk">
			<img src='/resources/user-bootstrap/img/index/talkbye.gif' class='talkbye' style='display:none'>
			<div class='talkbar' style='display:none'>
				<p class='friend' >好友</p>
				<div class='row' style='text-align:center' id='friend1'>
				<div class='col-3'>
					<img src='/resources/user-bootstrap/img/index/article.jpg' width='80%' style='border-radius:10px;margin-left:15px;'>
				</div>
				<div class='col-4' style='line-height:40px'>
					Guest2
				</div>
				<div class='col-5' style='line-height:40px'>
					在線上
				</div>
				<input type='text' placeholder='  搜尋...' class='fsearch'>
			</div>
			</div>
			
		</div>
		<script>
		
			$(".talk").hover(
				function() {
					$(".talk").attr('src','/resources/user-bootstrap/img/index/talk2.gif')
				},
				function() {
					$(".talk").attr('src','/resources/user-bootstrap/img/index/talk.gif')
				})

			$(".talk").click(function() {
				$(".talk").hide();
				$(".talkbye").show();
				$(".talkbar").show();
				$(".fsearch").show();
				$("#talk")
						.append(
								"");
				$(".talkbye").hover(
					function() {
						$(".talkbye").attr('src','/resources/user-bootstrap/img/index/talkbye2.gif');
					},
					function() {
						$(".talkbye").attr('src','/resources/user-bootstrap/img/index/talkbye.gif');
					})

				$(".talkbye").click(function() {
					$(".talkbye").hide();
					$(".talkbar").hide();
					$(".fsearch").hide();
					$(".talk").show();
				})

				$("#friend1").click(
					function() {
						$("#talk").append("<div class='talkbar2'><p class='friend'>Guest2</p></div>");
					})
			})
		</script>>