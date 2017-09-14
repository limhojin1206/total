package org.estrella.app.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.estrella.app.model.MarketDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/market")
public class MarketController {

	@Autowired
	MarketDao mdao;
	@Autowired
	ObjectMapper mapper;
	
	@GetMapping("/add")
	public String addGetHandle(Map map) {
		map.put("section", "add");
		return "t_m_expre";
	}
	
	@PostMapping("/add")
	public String addPostHandle(@RequestParam Map param) throws JsonParseException, JsonMappingException, IOException {
		System.out.println(param);
		int res = mdao.add(param);
		if(res == 1) {
			System.out.println("등록성공");
		}else {
			System.out.println("등록실패");
		}
		return "redirect:list"; 
	
	}
	@RequestMapping(path = "/list")
	public ModelAndView listHandle(HttpSession session) {
		if(session.getAttribute("auth") != null) {
			ModelAndView mav = new ModelAndView("t_m_expre");
			mav.addObject("list", mdao.readAll());
			mav.addObject("data", mdao.getAll());
			mav.addObject("section", "list");
			return mav;
		}
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "member/login");
		mav.addObject("title", "LOGIN");
		mav.addObject("pagemove", "/market/list");
		System.out.println("pagemove 생성");
		return mav;
		
	}
	
	/*
	@RequestMapping(path = "/list")
	public String listHandle(Map map, HttpServletRequest request) {
		request.setAttribute("list", mdao.readAll());
		request.setAttribute("data", mdao.getAll());
		map.put("section", "list");
		return "t_m_expre";
	}
	*/
	
	
	@RequestMapping("/search")
	public String searchHandle(@RequestParam Map param, HttpServletRequest request, Map map) {
		System.out.println(param);
		request.setAttribute("list", mdao.readAll());
		request.setAttribute("search", mdao.search(param));
		System.out.println(mdao.search(param).toString());
		map.put("section", "list");
		return "t_m_expre";
	}
	
	@RequestMapping("/tender/{num}")
	public String tenderHandle(@PathVariable String num, HttpServletRequest request, Map map) {
		System.out.println("NUM = " + num);
		request.setAttribute("item", mdao.readOne(num));
		System.out.println(mdao.readOne(num).toString());
		map.put("section", "tender");
		return "t_m_expre";
	}
}