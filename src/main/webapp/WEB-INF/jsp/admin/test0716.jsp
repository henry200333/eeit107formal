<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Hello WebSocket</title>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
</head>
<body>
<button type="button" id='happy'>happy</button>

<script type="text/javascript">

var socket = new SockJS("/portfolio");
var stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame) {
	console.log('frame內容 : '+frame);
	stompClient.subscribe('/topic/greetings',function(frame){
		console.log('來自/topic/greetings的：'+frame);
		
	})
	stompClient.subscribe('/app/chat/single/apple',function(frame){
		console.log('來自/topic/greetings的：'+frame);		
	})
// 	stompClient.subscribe('/user/queue/updates',function(frame){
// 		console.log('來自/topic/greetings的：'+frame);		
// 	})
// 	stompClient.subscribe("/user/queue/reply", function(message) {
//             alert("Message " + message.body);
//         });
	
// 	 stompClient.send("/app/chat", {}, 
//              JSON.stringify({'from':'from', 'text':'text'}));

})




$('#happy').click(function(){
	
	stompClient.send("/app/secured/room", {}, JSON.stringify({'content': 'hello', 'to':'banana', 'from':'apple'}));
})

</script>

</body>
</html>