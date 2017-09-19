package org.estrella.app.controller.ws;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/* ws protocol ó���� ��Ʈ�ѷ���
 * 		AbstractWebSocketHandler Ȥ��
 * 		TextWebSockethandler ���߿� �ϳ��� ��ӹް� ����ø� �Ǵµ�, 
*/
public class BasicWSHandler extends TextWebSocketHandler{
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//super.afterConnectionEstablished(session);
		// Ŭ���̾�Ʈ������ ������ �߻��Ͽ�����
		System.out.println("afterConnectionEstablished..");
		String msg = "ȯ���մϴ�";
		session.sendMessage(new TextMessage(msg));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//super.afterConnectionClosed(session, status);
		// Ŭ���̾�Ʈ�����κ��� ������ ���� �Ǿ�����
		System.out.println("afterConnectionClosed..");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//super.handleTextMessage(session, message);
		// Ŭ���̾�Ʈ�����κ��� �����͸� ���۹޾�����
		System.out.println("handleTextMessage..");
		String msg = message.getPayload();
		System.out.println("���ŵ� ���� : [" + msg + "]");
	}
}
