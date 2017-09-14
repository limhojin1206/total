package org.estrella.app.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.estrella.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	MemberDao mdao;
	
	@GetMapping("/info")
	public String infoGetHandle(Map map, HttpSession session) {
		map.put("title", "³»Á¤º¸");
		map.put("section", "/my/info");
		Map myinfo = mdao.getDetail((Map)session.getAttribute("auth"));
		session.setAttribute("auth", myinfo);
		System.out.println(session.getAttribute("auth").toString());
		
		return "t_expr";
	}
	
	@PostMapping("/info")
	public String infoPostHandle() {
		return "t_expr";
	}
	
}
