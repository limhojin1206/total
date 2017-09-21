package org.estrella.app.controller;

import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test")
public class Testcontroller {

	@Autowired
	JavaMailSender sender;
	
	@RequestMapping("/basic")
	public String basicHandle() {
		return "test/basic";
	}
	
	@RequestMapping("/uuid")
	public void uuidHandle() {
		UUID u = UUID.randomUUID();	// 고유 식별자가 필요하게 될때 사용되는 클래스
		// 정해진 규칙에 의해 거의 완벽하게 중복되지 않는 고유 키를 생성해서 사용할수 있음
		// 32개의 16진수.. 
		System.out.println(Math.pow(16, 32));
		System.out.println(u.toString());
		String auth_str = u.toString().substring(0,13);
		System.out.println(auth_str);
	}
	
	@RequestMapping("/send01")
	public void send01Handle(@RequestParam(name="t") String t) {
		// 1. SimplemailMessage 객체 이용
		SimpleMailMessage msg = new SimpleMailMessage();
		try {
			msg.setTo(t);		// 받을사람 주소
			msg.setFrom("estrellatestmail@gmail.com");		// 보내는 사람 주소
				// smtp.gamil 이쪽 우회해서 전송될때, 보내는 사람 주소가, gmail 주소로 자동 변환
			String subject = "testMail";
			String text = "환영합니다.\n 항상 최선의 서비스를 제공하겠습니다.\n";
			text += "<h2>test</h2>";	// text 만 전송가능
			msg.setSubject(subject);
			msg.setText(text);
			sender.send(msg);	// 발송
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/send02")
	public void send02Handle(@RequestParam(name="t") String t) {
		// 2. MimeMessage
		try {
			MimeMessage msg = sender.createMimeMessage();
			//to
			msg.setRecipient(RecipientType.TO, new InternetAddress(t));
			//subject
			msg.setSubject("welcome");
			//text
			String text = "<h1>환영합니다</h1>";
			text += "가입을 환영합니다.";
			text += "<a href=\"http://192.168.10.72\">구경가기 </a>";
			msg.setText(text,"utf-8", "html");
			//from
			sender.send(msg);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
