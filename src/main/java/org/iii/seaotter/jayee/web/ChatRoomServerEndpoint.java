package org.iii.seaotter.jayee.web;
import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import static org.iii.seaotter.jayee.common.WebSocketUtils.ONLINE_USER_SESSIONS;
import static org.iii.seaotter.jayee.common.WebSocketUtils.sendMessage;
import static org.iii.seaotter.jayee.common.WebSocketUtils.notifyOnlineFriends;

@RestController
@ServerEndpoint("/chat-room/{userAccount}")
public class ChatRoomServerEndpoint {

	    @OnOpen
	    public void openSession(@PathParam("userAccount") String userAccount, Session session) {
	    	//紀錄session與帳號
	    	ONLINE_USER_SESSIONS.put(userAccount, session);
	    	//通知上線的好友    	
	    	notifyOnlineFriends(userAccount);
	    }
	    	    
	    @GetMapping("/chat-room/{userAccount}/to/{receiverAccount}")
	    public void onMessage(@PathVariable("userAccount") String sender, @PathVariable("receiverAccount") String receiverAccount, String message) {
	        sendMessage(ONLINE_USER_SESSIONS.get(receiverAccount), message);
	    }
	    

//	    @OnMessage
//	    public void onMessage(@PathParam("username") String username, String message) {
//	        log.info(message);
//	        System.out.println(message);
//	        sendMessageAll(username + " : " + message);
//	    }

	    @OnClose
	    public void onClose(@PathParam("userAccount") String username, Session session) {
	        //Session移除
	    	ONLINE_USER_SESSIONS.remove(username);
	    	
	    	//通知上線的好友
	    	//notifyOnlineFriends()
	    	
	        try {
	            session.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    @OnError
	    public void onError(Session session, Throwable throwable) {
	        try {
	            session.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        throwable.printStackTrace();
	    }
	  
}
