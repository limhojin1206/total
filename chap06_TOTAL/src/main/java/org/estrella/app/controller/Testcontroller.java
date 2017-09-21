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
		UUID u = UUID.randomUUID();	// ���� �ĺ��ڰ� �ʿ��ϰ� �ɶ� ���Ǵ� Ŭ����
		// ������ ��Ģ�� ���� ���� �Ϻ��ϰ� �ߺ����� �ʴ� ���� Ű�� �����ؼ� ����Ҽ� ����
		// 32���� 16����.. 
		System.out.println(Math.pow(16, 32));
		System.out.println(u.toString());
		String auth_str = u.toString().substring(0,13);
		System.out.println(auth_str);
	}
	
	@RequestMapping("/send01")
	public void send01Handle(@RequestParam(name="t") String t) {
		// 1. SimplemailMessage ��ü �̿�
		SimpleMailMessage msg = new SimpleMailMessage();
		try {
			msg.setTo(t);		// ������� �ּ�
			msg.setFrom("estrellatestmail@gmail.com");		// ������ ��� �ּ�
				// smtp.gamil ���� ��ȸ�ؼ� ���۵ɶ�, ������ ��� �ּҰ�, gmail �ּҷ� �ڵ� ��ȯ
			String subject = "testMail";
			String text = "ȯ���մϴ�.\n �׻� �ּ��� ���񽺸� �����ϰڽ��ϴ�.\n";
			text += "<h2>test</h2>";	// text �� ���۰���
			msg.setSubject(subject);
			msg.setText(text);
			sender.send(msg);	// �߼�
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
			String text = "<h1>ȯ���մϴ�</h1>";
			text += "������ ȯ���մϴ�.";
			text += "<a href=\"http://192.168.10.72\">���氡�� </a>";
			msg.setText(text,"utf-8", "html");
			//from
			sender.send(msg);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
