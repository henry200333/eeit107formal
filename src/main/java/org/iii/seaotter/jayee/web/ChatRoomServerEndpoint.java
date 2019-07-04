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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import static org.iii.seaotter.jayee.common.WebSocketUtils.ONLINE_USER_SESSIONS;
import static org.iii.seaotter.jayee.common.WebSocketUtils.sendMessage;
import static org.iii.seaotter.jayee.common.WebSocketUtils.sendMessageAll;

@RestController
@ServerEndpoint("/chat-room/{username}")
public class ChatRoomServerEndpoint {
	 private static final Logger log = LoggerFactory.getLogger(ChatRoomServerEndpoint.class);

	    @OnOpen
	    public void openSession(@PathParam("username") String username, Session session) {
	    	ONLINE_USER_SESSIONS.put(username, session);
	        String message = username + " 加入聊天室！";
	        log.info(message);
	        sendMessageAll(message);

	    }

	    @OnMessage
	    public void onMessage(@PathParam("username") String username, String message) {
	        log.info(message);
	        System.out.println(message);
	        sendMessageAll(username + " : " + message);
	    }

	    @OnClose
	    public void onClose(@PathParam("username") String username, Session session) {
	        //当前的Session 移除
	    	ONLINE_USER_SESSIONS.remove(username);
	        //并且通知其他人当前用户已经离开聊天室了
	        sendMessageAll("用户[" + username + "] 已经离开聊天室了！");
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


	    @GetMapping("/chat-room/{sender}/to/{receive}")
	    public void onMessage(@PathVariable("sender") String sender, @PathVariable("receive") String receive, String message) {
	        sendMessage(ONLINE_USER_SESSIONS.get(receive), "[" + sender + "]" + "-> [" + receive + "] : " + message);
	    }
}
