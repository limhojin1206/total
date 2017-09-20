package org.estrella.app.controller.ws;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component("cws")
public class ChatWSHandler extends TextWebSocketHandler{
	@Autowired
	ObjectMapper mapper;
	
	List<WebSocketSession> list;
	
	@PostConstruct	// 빈 설정 init-method
	public void chatWSInit() {
		System.out.println("ChatWSHandler..chatWSInit()");
		list = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		String json = String.format("{\"mode\":\"join\", \"cnt\":%d, \"sender\":\"%s\"  }", list.size(), "사용자_"+session.getId());
		//System.out.println(json +" at afterConnectionEstablished." );
		for(WebSocketSession wss : list) {
			if(wss.getId() != session.getId()) {
				wss.sendMessage(new TextMessage(json));
				
			}else{
				json = String.format("{\"mode\":\"my\", \"cnt\":%d}", list.size());
				wss.sendMessage(new TextMessage(json));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
		Map map = new HashMap<>();
			map.put("mode", "out");
			map.put("cnt", list.size());
			map.put("sender", "사용자_"+session.getId());
		String json = mapper.writeValueAsString(map);
		//String json = String.format("{\"mode\":\"out\", \"cnt\":%d, \"sender\":%s  }", list.size(), "사용자_"+session.getId());
		for(WebSocketSession wss : list) {
			wss.sendMessage(new TextMessage(json));
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage..");
		Map map = new HashMap<>();
		for(WebSocketSession wss : list) {
			if(wss.getId() != session.getId()) {
				map.put("mode", "send");
				map.put("sender", "사용자_"+session.getId());
				map.put("msg", message.getPayload());
				map.put("cnt", list.size());
				String json = mapper.writeValueAsString(map);
				wss.sendMessage(new TextMessage(json));
				
			}else{
				map.put("mode", "mysend");
				map.put("sender", "사용자_"+session.getId());
				map.put("msg", message.getPayload());
				map.put("cnt", list.size());
				String json = mapper.writeValueAsString(map);
				wss.sendMessage(new TextMessage(json));
			}
		}
	}
}
