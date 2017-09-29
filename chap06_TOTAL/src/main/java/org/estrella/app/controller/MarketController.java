package org.estrella.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.estrella.app.model.MarketDao;
import org.estrella.app.model.MarketLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
	MarketLogDao mldao;
	
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
	public ModelAndView listHandle(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("t_m_expre");
		mav.addObject("list", mdao.readAll());
		mav.addObject("data", mdao.getAll());
		mav.addObject("section", "list");
		// request.setAttribute("pagemove", "/market/list");
		// System.out.println("pagemove 생성 ");
		return mav;
	}
	
	@RequestMapping("/search")
	public String searchHandle(@RequestParam Map param, HttpServletRequest request, Map map) {
		System.out.println(param);
		request.setAttribute("list", mdao.readAll());
		request.setAttribute("search", mdao.search(param));
		System.out.println(mdao.search(param).toString());
		map.put("section", "list");
		return "t_m_expre";
	}
	
	@GetMapping("/tender/{num}")
	public String tenderGetHandle(@PathVariable String num, HttpServletRequest request, Map map) {
		System.out.println("NUM = " + num);
		request.setAttribute("item", mdao.readOne(num));
		System.out.println(mdao.readOne(num).toString());
		map.put("section", "tender");
		return "t_m_expre";
	}
	
	@PostMapping("/tender/{num}")
	@ResponseBody
	public void tenderPostHandle(@PathVariable String num, @RequestParam Map map) {
		System.out.println(map.toString());
		int r = mldao.tender(map);
		if(r == 1) {
			System.out.println("입찰 성공");
			mldao.updatetender(map);
		}
		
	}
	
	@RequestMapping("/tenderlist")
	@ResponseBody
	public List tenderlistHandle(@RequestParam Map map, HttpServletRequest request ) {
		System.out.println("tanderlist의 맵: " + map.toString());
		request.setAttribute("item", mdao.readOne((String)map.get("itemnum")));
		return mldao.tenderlist(map);
	}
	
	
}