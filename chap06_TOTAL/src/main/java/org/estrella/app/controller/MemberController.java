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
			return "redirect:session"; 
		}
		System.out.println("가입실패");
		return "redirect:join"; 
	}
	
	@PostMapping(path="/signup_check/{mode}", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String signupHandle(@PathVariable String mode, @RequestBody(required=false) String body) throws JsonParseException, JsonMappingException, IOException {
		String msg="";
		Map map = mapper.readValue(body, Map.class);
		
		if(mode.equals("id")) {
			Map dmap = mdao.getDetail(map);
			if(dmap.size() == 0) {
				msg = "<span style=\"color:blue\"><b>사용가능한 아이디입니다.</b></span>";
			}else {
				msg = "<span style=\"color:red\"><b>사용할수 없는 아이디입니다.</b></span>";
			}
		}
		
		if(mode.equals("email")) {
			List list = mdao.emailcheck(map);
			if(list.size() == 0) {
				msg = "<span style=\"color:blue\"><b>사용가능한 이메일입니다.</b></span>";
			}else {
				msg = "<span style=\"color:red\"><b>사용할수 없는 이메일입니다.</b></span>";
			}
		}
		return msg;
			
	}
	
	

	
	@GetMapping("/login")
	public ModelAndView loginHandle(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("title", "LOGIN");
		mav.addObject("section", "member/login");
		return mav;
	}

	@PostMapping("/login")
	public String loginHandle(@RequestParam Map map, HttpSession session, Model model) {
		Map lmap = mdao.login(map);
		if(lmap !=null) {
			System.out.println("로그인 성공");
			session.setAttribute("auth", lmap);
			if(session.getAttribute("pagemove") != null) {
				System.out.println("pagemove 있음 : " +  session.getAttribute("pagemove"));
				return "redirect:"+session.getAttribute("pagemove");
			}
			return "redirect:/"; 
		}else {
			System.out.println("로그인 실패");
			model.addAttribute("section", "/member/login");
			model.addAttribute("title","로그인 실패");
			model.addAttribute("temp", "fail");
		}
		return "t_expr"; 
	}
	
	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session) {
		if(session.getAttribute("auth") != null) {
			session.removeAttribute("auth");
			System.out.println("로그아웃 성공");
		}else {
			System.out.println("잘못된 접근입니다.");
		}
		return "t_index";
	}
}
