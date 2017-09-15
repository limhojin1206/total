package org.estrella.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.estrella.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class LoginController {

	@Autowired
	MemberDao mdao;
	
	@GetMapping("/login")
	public ModelAndView loginHandle(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("title", "LOGIN");
		mav.addObject("section", "member/login");
		return mav;
	}
	
	@PostMapping("/login")
	public String loginHandle(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest request) {
		Map lmap = mdao.login(map);
		if(lmap !=null) {
			System.out.println("로그인 성공 : " + lmap.toString());
			session.setAttribute("auth", lmap);
			if(request.getAttribute("pagemove")!=null) {
				System.out.println("pagemove 있음 ");
				return "redirect:"+request.getAttribute("pagemove");
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
