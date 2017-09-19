package org.estrella.app.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@RequestMapping("/main")
	public String ChatHandle() {
		
		return "chat/chatMain";
	}
}
