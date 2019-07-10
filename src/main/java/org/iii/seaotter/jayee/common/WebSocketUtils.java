package org.iii.seaotter.jayee.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.RemoteEndpoint;
import javax.websocket.Session;

public class WebSocketUtils {

	public static final Map<String, Session> ONLINE_USER_SESSIONS = new ConcurrentHashMap<>();

	public static void sendMessageAll(String message) {
		ONLINE_USER_SESSIONS.forEach((userAccount, session) -> sendMessage(session, message));
	}

	public static void sendMessage(Session session, String message) {
		if (session == null) {
			return;
		}
		final RemoteEndpoint.Basic basic = session.getBasicRemote();
		if (basic == null) {
			return;
		}
		try {
			basic.sendText(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void notifyOnlineFriends(String userAccount) {
		List<String> friends = new ArrayList<String>();
		//好友列表
		friends.add("apple");
		
		//向在線好友發送訊息
		ONLINE_USER_SESSIONS.forEach((onlineAccount, session) ->sendToFriend(friends,onlineAccount,session));

	}

	public static void sendToFriend(List<String> friends, String onlineAccount,javax.websocket.Session session) {
		String msg = "我上線了";
		if (friends.contains(onlineAccount)) {
			sendMessage(session,msg);
		}
		;
	}
}
