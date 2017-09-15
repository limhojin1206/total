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
			System.out.println("�α��� ���� : " + lmap.toString());
			session.setAttribute("auth", lmap);
			if(request.getAttribute("pagemove")!=null) {
				System.out.println("pagemove ���� ");
				return "redirect:"+request.getAttribute("pagemove");
			}
			return "redirect:/"; 
		}else {
			System.out.println("�α��� ����");
			model.addAttribute("section", "/member/login");
			model.addAttribute("title","�α��� ����");
			model.addAttribute("temp", "fail");
		}
		return "t_expr"; 
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
