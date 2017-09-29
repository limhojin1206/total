package org.estrella.app.controller.ws;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component("marketws")
public class MarketWSHandler extends TextWebSocketHandler{

	@Autowired
	ObjectMapper mapper;
	
	Map<String, WebSocketSession> users = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> hs = session.getAttributes();
		String id = (String)((Map)hs.get("auth")).get("ID");
		users.put(id, session);
	}
	
	public void tenderPrice(Map map) {
		if(users.containsKey(map.get("receiver"))) {
			try {
				Map m = new HashMap<>();
					m.put("mode", "memo");
					m.put("send",map.get("sender"));
					m.put("msg","¿‘¬˚«‘");
				String json = mapper.writeValueAsString(m);
				users.get(map.get("receiver")).sendMessage(new TextMessage(json));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
