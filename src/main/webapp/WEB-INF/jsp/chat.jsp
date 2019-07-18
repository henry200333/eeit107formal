<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	
<sec:authorize access="isAuthenticated()">
<input type='hidden' value="<sec:authentication property='principal.account' />" id='userAccount'>
<input type='hidden' value="<sec:authentication property='principal.displayName' />" id='userDisplayName'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
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
		
		var userAccount = $('#userAccount').val();
		var userDisplayName = $('#userDisplayName').val();
		
		//登入後抓朋友
			$.ajax({
					url:'/findmyfriends',
					type:'GET',
					contentType:'application/json',
					dataType:'json',
					data:{"userAccount":userAccount},
					success:function(friendList){
						//產生列表
						$.each(friendList,function(idx,friend){
							var tempFriend = $('<div>').addClass('row friendListItem').css('line-height','2em')
											.attr({'id':'list'+friend.account,'name':friend.displayName})
												.append($('<div>').addClass('col-3 mb-2')
														.append($('<img>').attr('src',friend.photo).addClass('friendListImg')
																)
														)
												.append($('<div>').addClass('col-6 mb-2')
														.text(friend.displayName)
														)
												.append($('<div>').addClass('col-3 mb-2 displayName').html('線上')
														);
							$('.talkbar').append(tempFriend);
						})
						//產生搜尋區
						var searchElement=$('<div>').css({'text-align':'center','id':'searchPosition'})
						.append($('<input>').attr({'type':'text','placeholder':'搜尋...'}).addClass('fsearch'));
						$('.talkbar').append(searchElement);	
						
						//列表綁事件-列表點擊
						$('.friendListItem').click(produceChatBox);												
					}				
				})
				
		function produceChatBox(){
			var nowId = $(this).attr('id').substring(4);
			var chatBoxExist = document.getElementById(nowId);
			if(chatBoxExist) return false;
			var chatbox = $('<div>').addClass('talkbar2')
				.append($('<div>').addClass('friend')
					.append($('<p>').text($(this).attr('name')))
					.append($('<button>').addClass('talkclose').html('x'))
					)
				.append($('<div>').addClass('messages').attr('id','show'+$(this).attr('id').substring(4))
					.append($('<ul>')
					)	
				)
				//這邊的id是使用者帳號
				.append($('<div>').addClass('message-input')
						.append($('<input>').attr({'type':'text','placeholder':'Write your message...'}))
						.append($('<button>').addClass('sendMessage').attr({'id':$(this).attr('id').substring(4),'type':'button'})
							.append($('<i>').addClass('fa fa-paper-plane')))
				);
							
				$('#talkfield').append(chatbox);					
				$('.sendMessage').click(sendMessage);
		}
		function produceChatBox2(account,friendName,messageContent){
			var chatBoxExist = document.getElementById(account);
			if(!chatBoxExist){
				var chatbox = $('<div>').addClass('talkbar2')
					.append($('<div>').addClass('friend')
						.append($('<p>').text(friendName))
						.append($('<button>').addClass('talkclose').html('x'))
						)
					.append($('<div>').addClass('messages').attr('id','show'+account)
						.append($('<ul>')
						)	
					)
					//這邊的id是使用者帳號
					.append($('<div>').addClass('message-input')
							.append($('<input>').attr({'type':'text','placeholder':'Write your message...'}))
							.append($('<button>').addClass('sendMessage').attr({'id':account,'type':'button'})
								.append($('<i>').addClass('fa fa-paper-plane')))
					);
								
					$('#talkfield').append(chatbox);					
					$('.sendMessage').click(sendMessage);
			}	
			showChatMessage(account,messageContent);			
		}
		
		function showChatMessage(account,messageContent){
			$('#show'+account+' ul').append($('<li>').addClass('replies').html('<p>'+messageContent+'</p>'));
		}
		//STOMP連線、註冊
		
		var socket = new SockJS('/ilovejayee');
	   	stompClient = Stomp.over(socket);
	   	stompClient.connect({}, function (frame) {
  	    	console.log('Connected: ' + frame);
        //註冊私訊路徑
	        stompClient.subscribe('/app/chat/single/'+userAccount, function (data) {
	            msgObj = JSON.parse(data.body);
	            produceChatBox2(msgObj.from,msgObj.userDisplayName,msgObj.content)
	   
        	});
    	});
		
				
		function sendMessage(){	
			if(stompClient){
				var receiver = $(this).attr('id')
				var messageContent = $(this).prev().val();
				var messageFrame = {'to':receiver,'from':userAccount,'content':messageContent,'userDisplayName':userDisplayName}; 
				stompClient.send('/app/secured/room',{},JSON.stringify(messageFrame));
			}
		}

			
		//JS畫面事件處理
		$(".talk").hover(
		function() {
			$(".talk").attr('src','/resources/user-bootstrap/img/index/talk2.gif')
		},
		function() {
			$(".talk").attr('src','/resources/user-bootstrap/img/index/talk.gif')
		})
				
		$(".talkbye").hover(
			function() {
				$(".talkbye").attr('src','/resources/user-bootstrap/img/index/talkbye2.gif');
			},
			function() {
				$(".talkbye").attr('src','/resources/user-bootstrap/img/index/talkbye.gif');
			});

		$(".talk").click(function() {
			$(".talk").hide();
			$(".talkbye").show();
			$(".talkbar").show();
			$(".fsearch").show();
		});
			
		
		$(".talkbye").click(function() {
			$(".talkbye").hide();
			$(".talkbar").hide();
			$(".fsearch").hide();
			$(".talk").show();
		});
		

//				$('#msgbox1 ul').append(($('<li>').addClass('sent')
//						.append($('<img>').attr('src','http://emilcarlsson.se/assets/mikeross.png'))
//						.append($('<p>').text('hello'))
//				))
//				$('#msgbox1 ul').append(($('<li>').addClass('replies')
//						.append($('<img>').attr('src','http://emilcarlsson.se/assets/mikeross.png'))
//						.append($('<p>').text('what\'s up'))
//				))
//			})
			
		</script>