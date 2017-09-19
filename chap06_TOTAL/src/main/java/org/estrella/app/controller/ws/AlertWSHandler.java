package org.estrella.app.controller.ws;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("aws")
public class AlertWSHandler extends TextWebSocketHandler{
	List<WebSocketSession> list;
	
	// 이 Handler 객체를 통해서 연결되어있는 모든 WebSocketSession에 메세지를 보낼수 있는
	// 메서드를 하나 추가해두시고, 
	public void sendMessage(String message) {
		for(WebSocketSession s : list) {
			try {
				s.sendMessage(new TextMessage(message));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@PostConstruct	// 빈 설정 init-method
	public void chatWSInit() {
		System.out.println("ChatWSHandler..chatWSInit()");
		list = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
	}
	

}
