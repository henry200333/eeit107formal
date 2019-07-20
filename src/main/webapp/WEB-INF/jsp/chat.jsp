<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	
<sec:authorize access="isAuthenticated()">
<input type='hidden' value="<sec:authentication property='principal.account' />" id='userAccount'>
<input type='hidden' value="<sec:authentication property='principal.displayName' />" id='userDisplayName'>
<input type='hidden' value="<sec:authentication property='principal.photo' />" id='userPhoto'>
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

		
<script>		
		var userAccount = $('#userAccount').val();
		var userDisplayName = $('#userDisplayName').val();
		var userPhoto = $('#userPhoto').val();
		
	var friendListStock;	
		
		//登入後抓朋友
			$.ajax({
					url:'/findmyfriends',
					type:'GET',
					contentType:'application/json',
					dataType:'json',
					data:{"userAccount":userAccount},
					success:function(friendList){
						friendListStock = friendList;					
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
			if(chatBoxExist) {
				$('#'+nowId).parent().parent().show();
				return false;
			}
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
				$(".talkclose").click(function(){
					$(this).parent().parent().hide();					
				})
				$('.messages').scroll(function(event){

					if(event.target.scrollTop==0){	
						event.target.scrollTop=1;
						loadHistoryMessage1(event.target.id.substring(4),userAccount);					
						console.log(event.target.scrollTop);
					}			
				})
				
				loadHistoryMessage1($(this).attr('id').substring(4),userAccount);
				$(".messages").animate({ scrollTop: $(".messages")[0].scrollHeight}, "fast");
		}
		
		function receiveMessage(msgObj){
			var sender = msgObj.sender;
			var receiver = msgObj.receiver;
			var content = msgObj.content;
			var friendName = msgObj.userDisplayName;
			if(userAccount==sender){
				showChatMessage1(receiver,content);	
				$("#show"+receiver).animate({ scrollTop: $(".messages")[0].scrollHeight}, "fast");
			}else{
				var chatBoxExist = document.getElementById(sender);
				if(!chatBoxExist){
					var chatbox = $('<div>').addClass('talkbar2')
						.append($('<div>').addClass('friend')
							.append($('<p>').text(friendName))
							.append($('<button>').addClass('talkclose').html('x'))
							)
						.append($('<div>').addClass('messages').attr('id','show'+sender)
							.append($('<ul>')
							)	
						)
						//這邊的id是使用者帳號
						.append($('<div>').addClass('message-input')
								.append($('<input>').attr({'type':'text','placeholder':'Write your message...'}))
								.append($('<button>').addClass('sendMessage').attr({'id':sender,'type':'button'})
									.append($('<i>').addClass('fa fa-paper-plane')))
						);
								
					$('#talkfield').append(chatbox);					
					$('.sendMessage').click(sendMessage);
					$(".talkclose").click(function(){
						$(this).parent().parent().hide();						
					})
					loadHistoryMessage1(sender,receiver);
				}

				showChatMessage2(sender,content);
				$("#show"+sender).animate({ scrollTop: $(".messages")[0].scrollHeight}, "fast");
			}
			
		}
		
		function prependHistory(msgObj){
			var sender = msgObj.sender;
			var receiver = msgObj.receiver;
			var content = msgObj.content;
			var friendName = msgObj.userDisplayName;
			if(userAccount==sender){
				showChatMessage3(receiver,content);
				
			}else{
				var chatBoxExist = document.getElementById(sender);
				showChatMessage4(sender,content);
				
			}
		}
		
		function showChatMessage1(account,messageContent){	
			$('#show'+account+' ul').append($('<li>').addClass('sent')
					.append($('<img>').attr('src',userPhoto)).append($('<p>').text(messageContent)));
		}
		function showChatMessage2(account,messageContent){
			var imgOne;
			$.each(friendListStock,function(idx,friendone){
				if(friendone.account==account){
					imgOne = friendone.photo;
					alert(123);
				}
			})
			$('#show'+account+' ul').append($('<li>').addClass('replies').append($('<img>').attr('src',imgOne)).append($('<p>').text(messageContent)));
		}
		
		function showChatMessage3(account,messageContent){
			$('#show'+account+' ul').prepend($('<li>').addClass('sent')
					.append($('<img>').attr('src',userPhoto)).append($('<p>').text(messageContent)));
		}
		function showChatMessage4(account,messageContent){
			var imgOne;
			$.each(friendListStock,function(idx,friendone){
				if(friendone.account==account){
					imgOne = friendone.photo;
				}
			})
			$('#show'+account+' ul').prepend($('<li>').addClass('replies').append($('<img>').attr('src',imgOne)).append($('<p>').text(messageContent)));
		}
		//STOMP連線、註冊
		
		var socket = new SockJS('/ilovejayee');
	   	stompClient = Stomp.over(socket);
	   	stompClient.connect({}, function (frame) {
  	    	console.log('Connected: ' + frame);
  	    	stompClient.send('/app/imonline',{},JSON.stringify({'userAccount':userAccount}));
        //註冊私訊路徑
	        stompClient.subscribe('/app/chat/single/'+userAccount, function (data) {
	            msgObj = JSON.parse(data.body);
	            receiveMessage(msgObj)
	   
        	});
    	});
		
				
		function sendMessage(){	
			if(stompClient){
				var receiver = $(this).attr('id')
				var messageContent = $(this).prev().val();
				var messageFrame = {'receiver':receiver,'sender':userAccount,'content':messageContent,'userDisplayName':userDisplayName}; 
				stompClient.send('/app/secured/room',{},JSON.stringify(messageFrame));
				$(this).prev().val('');
			}
		}

	var page = 1;
	var rows = 10;
		
	function loadHistoryMessage1(sender,receiver){
		$.ajax({
			url:'/getNewMessages',
			type:'get',
			data:{'page':page,'rows':rows,'sender':sender,'receiver':receiver},
			success:function(data){
				var historyMessages = data.rows;
				console.log(historyMessages);
				$.each(historyMessages,function(idx,historyMessage){
					prependHistory(historyMessage);
				})
				page++;
			}				
		})
	}
	
	//滾至頂端讀取
	
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
		
			</sec:authorize>