package org.estrella.app.controller.ws;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/* ws protocol 처리용 컨트롤러는
 * 		AbstractWebSocketHandler 혹은
 * 		TextWebSockethandler 둘중에 하나를 상속받고 만드시면 되는데, 
*/
public class BasicWSHandler extends TextWebSocketHandler{
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//super.afterConnectionEstablished(session);
		// 클라이언트측에서 연결이 발생하였을때
		System.out.println("afterConnectionEstablished..");
		String msg = "환영합니다";
		session.sendMessage(new TextMessage(msg));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//super.afterConnectionClosed(session, status);
		// 클라이언트측으로부터 연결이 해제 되었을때
		System.out.println("afterConnectionClosed..");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//super.handleTextMessage(session, message);
		// 클라이언트측으로부터 데이터를 전송받았을때
		System.out.println("handleTextMessage..");
		String msg = message.getPayload();
		System.out.println("수신된 내용 : [" + msg + "]");
	}
}
