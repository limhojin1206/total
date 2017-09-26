package org.estrella.app.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.estrella.app.controller.ws.AlertWSHandler;
import org.estrella.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@Autowired
	SimpleDateFormat sdf;
	@Autowired
	AlertWSHandler aws;
	@Autowired
	JavaMailSender sender;
	
	@GetMapping("/join")
	public String joinGetHandle(Map map) {
		map.put("title", "JOIN");
		map.put("section", "member/join");
		return "t_expr";
	}
	
	@PostMapping("/join")
	public String joinPostHandle(@RequestParam Map map, HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException, JsonParseException, JsonMappingException, IOException {
		int r = mdao.join(map);
		System.out.println("r : " + r);
		if(r == 2) {
			System.out.println("가입성공");
			map.put("ids", map.get("id"));
			Map lmap = mdao.login(map);
			System.out.println(lmap.toString());
			session.setAttribute("auth", lmap);
			/*
			 *	AlertWSHandler를 통해서 , 메세지를 보내보자.
			 */
			aws.sendMessage("누군가 가입하였습니다");
			
			return "redirect:/"; 
		}
		System.out.println("가입실패");
		return "redirect:join"; 
	}
	
	@PostMapping(path="/emailck", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String confirm(@RequestBody(required=false) String body, HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		Map map = mapper.readValue(body, Map.class);
		System.out.println("body : "+ body);
		System.out.println(map.get("email"));
		String email = (String)map.get("email");
		String ckmsg = "";
		UUID u = UUID.randomUUID();
		String auth_str = u.toString().substring(0,13);
		session.setAttribute("confirmck", auth_str);
		try {
			MimeMessage msg = sender.createMimeMessage();
			//to
			msg.setRecipient(RecipientType.TO, new InternetAddress(email));
			//subject
			msg.setSubject("welcome");
			//text
			String text = "<h1>환영합니다</h1>";
			text += "가입을 환영합니다.";
			text += "인증번호는 [ " + auth_str +" ] 입니다.";
			msg.setText(text,"utf-8", "html");
			//from
			sender.send(msg);
			ckmsg += "전송완료";
		}catch(Exception e) {
			e.printStackTrace();
			ckmsg += "전송실패";
		}
		
		return ckmsg;
	}
	
	@PostMapping(path="/confirmEmail", produces= "text/html;charset=UTF-8")
	@ResponseBody
	public String confirmEmail(@RequestBody(required=false) String body, HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		Map map = mapper.readValue(body, Map.class);
		System.out.println("body : "+ body);
		System.out.println(map.get("ck"));
		String ck = (String)map.get("ck");
		String confirmck = (String)session.getAttribute("confirmck");
		System.out.println("confirmck : "+ confirmck);
		String ckmsg = "";
		if(ck.equals(confirmck)) {
			ckmsg = "true";
			session.setAttribute("confirm", "true");
		}else {
			ckmsg = "false";
		}
		return ckmsg;
	}
	
	
	@PostMapping(path="/signup_check/{mode}", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String signupHandle(@PathVariable String mode, @RequestBody(required=false) String body) throws JsonParseException, JsonMappingException, IOException {
		String msg="";
		Map map = mapper.readValue(body, Map.class);
		
		if(mode.equals("id")) {
			List list = mdao.idcheck(map);
			if(list.size() == 0) {
				msg = "true";
			}else {
				msg = "false";
			}
		}
		
		if(mode.equals("email")) {
			List list = mdao.emailcheck(map);
			if(list.size() == 0) {
				msg = "true";
			}else {
				msg = "false";
			}
		}
		return msg;
	}
	
	@RequestMapping("/all")
	public String memberListHandle(Map map, HttpSession session) {
		List<Map> list = mdao.readAll();
		System.out.println(list.toString());
		System.out.println(list.size());
		session.setAttribute("memberlist", list);
		map.put("title", "MEMBERLIST");
		map.put("section", "member/all");
		return "t_expr";
	}
	
	@RequestMapping("/mlist")
	public String mlistHandle(@RequestParam(name="page", defaultValue="1") int page, HttpSession session, Map map) {
		List<Map> allList = mdao.readAll();
		int pagecontroll = 0;
		if(allList.size()%5.0 == 0) {
			pagecontroll = allList.size()/5;
		}else {
			pagecontroll = (allList.size()/5)+1;
		}
		
		if(page < 1) {
			page = 1;
		}else if(page > pagecontroll) {
			page = pagecontroll;
		}
		
		Map mlist = new HashMap<>();
		if(page==1) {
			mlist.put("START", 1);
			mlist.put("END", 5);
		}else {
			mlist.put("START", ((page-1)*5)+1);
			mlist.put("END", ((page-1)*5)+5);
		}
		List<Map> list = mdao.readMlist(mlist);
		session.setAttribute("memberlist", list);
		session.setAttribute("memberAllList", allList);
		map.put("title", "MEMBERLIST " + page + " page");
		map.put("section", "member/all");
		map.put("page", page);
		return "t_expr";
	}
	
	@PostMapping("/findfriend")
	@ResponseBody
	public String findFriendPostHandle(@RequestParam Map map, HttpSession session) {
		List<Map> friendList = mdao.friendList(map);
		session.setAttribute("friendList", friendList);
		return "완료";
	}
}
