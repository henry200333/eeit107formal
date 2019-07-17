<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	
<sec:authorize access="isAuthenticated()">
<div id='talkfield'>
	<div id="talk">
		<img src="/resources/user-bootstrap/img/index/talk.gif" class="talk">
		<img src='/resources/user-bootstrap/img/index/talkbye.gif' class='talkbye' style='display:none'>
		<div class='talkbar' style='display:none'>
			<p class='friend'>好友</p>
		</div>	
	</div>
</div>
		</sec:authorize>
		
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

				$('#friend1').click(
					function() {
						var chatbox = $('<div>').addClass('talkbar2')
							.append($('<div>').addClass('friend')
								.append($('<p>').text('Guest2'))
								.append($('<button>').addClass('talkclose').html('x'))
								)
							.append($('<div>').addClass('messages').attr('id','msgbox1')
								.append($('<ul>')
								)	
							)
							.append($('<div>').addClass('message-input').attr('id','55688')
									.append($('<input>').attr({'type':'text','id':'message-input','placeholder':'Write your message...'}))
									.append($('<button>').addClass('submit').attr('id','sendMsg')
										.append($('<i>').addClass('fa fa-paper-plane')))
									)

													
							
						$('#talkfield').append(chatbox);
						$('#msgbox1 ul').append(($('<li>').addClass('sent')
								.append($('<img>').attr('src','http://emilcarlsson.se/assets/mikeross.png'))
								.append($('<p>').text('hello'))
						))
						$('#msgbox1 ul').append(($('<li>').addClass('replies')
								.append($('<img>').attr('src','http://emilcarlsson.se/assets/mikeross.png'))
								.append($('<p>').text('what\'s up'))
						))
					})
				})
				
				
				$.ajax({
					url:'/findmyfriends',
					type:'GET',
					contentType:'application/json',
					dataType:'json',
					data:{"userAccount":"admin"},
					success:function(friendList){
						$.each(friendList,function(idx,friend){
						var tempFriend = $('<div>').addClass('row').attr('id','list'+friend.account).css('line-height','2em')
											.append($('<div>').addClass('col-3 mb-2')
													.append($('<img>').attr('src',friend.photo).addClass('friendListImg')))
											.append($('<div>').addClass('col-6 mb-2')
													.text(friend.displayName))
											.append($('<div>').addClass('col-3 mb-2')
													.html('線上'))
						$('.talkbar').append(tempFriend);
						})
						var searchElement=$('<div>').css({'text-align':'center','id':'searchPosition'})
						.append($('<input>').attr({'type':'text','placeholder':'搜尋...'}).addClass('fsearch'));
						
						$('.talkbar').append(searchElement);	
					}
					
				})
				
				
			
		</script>