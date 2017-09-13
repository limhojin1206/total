package org.estrella.app.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.estrella.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberDao mdao;
	@Autowired
	ObjectMapper mapper;
	
	@GetMapping("/join")
	public String joinGetHandle() {
		return "t_join";
	}
	
	@PostMapping("/join")
	public String joinPostHandle(@RequestParam Map map, HttpServletRequest request) throws ClassNotFoundException, SQLException, JsonParseException, JsonMappingException, IOException {
		int r = mdao.join(map);
		System.out.println("r : " + r);
		if(r == 2) {
			System.out.println("���Լ���");
			return "redirect:joinres"; 
		}
		System.out.println("���Խ���");
		return "redirect:join"; 
	}
	
	@PostMapping(path="/signup_check/{mode}", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String signupHandle(@PathVariable String mode, @RequestBody(required=false) String body) throws JsonParseException, JsonMappingException, IOException {
		String msg="";
		Map map = mapper.readValue(body, Map.class);
		
		if(mode.equals("id")) {
			List list = mdao.getDetail(map);
			if(list.size() == 0) {
				msg = "<span style=\"color:blue\"><b>��밡���� ���̵��Դϴ�.</b></span>";
			}else {
				msg = "<span style=\"color:red\"><b>����Ҽ� ���� ���̵��Դϴ�.</b></span>";
			}
		}
		
		if(mode.equals("email")) {
			List list = mdao.emailcheck(map);
			if(list.size() == 0) {
				msg = "<span style=\"color:blue\"><b>��밡���� �̸����Դϴ�.</b></span>";
			}else {
				msg = "<span style=\"color:red\"><b>����Ҽ� ���� �̸����Դϴ�.</b></span>";
			}
		}
		return msg;
			
	}
	
	@RequestMapping("/joinres")
	public void joinres() {
	}
	
	@RequestMapping("/session")
	public String session() {
		return "t_index";
	}
	
	@GetMapping("/login")
	public String loginHandle() {
		return "t_login";
	}

	@PostMapping("/login")
	public String loginHandle(@RequestParam Map map, HttpSession session) {
		Map lmap = mdao.login(map);
		if(lmap !=null) {
			System.out.println("�α��� ����");
			System.out.println(lmap.toString());
			session.setAttribute("auth", lmap);
			
			return "redirect:session"; 
		}
		System.out.println("�α��� ����");
		session.setAttribute("temp", "fail");
		return "redirect:login"; 
	}
	
	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session) {
		if(session.getAttribute("auth") != null) {
			session.removeAttribute("auth");
			System.out.println("�α׾ƿ� ����");
		}else {
			System.out.println("�߸��� �����Դϴ�.");
		}
		return "t_index";
	}
}
