package org.estrella.app.controller;

import java.util.List;
import java.util.Map;

import org.estrella.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class SearchController {

	@Autowired
	MemberDao mdao;
	
	@RequestMapping("/search")
	public ModelAndView searchIdHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section","member/search");
		mav.addObject("title","member/search");
		return mav;
	}
	
	@RequestMapping("/searchAjax")
	@ResponseBody
	public List<Map> searchIdAjaxHandle(@RequestParam String id) {
		return mdao.friendList(id+"%");
	}
	
	
	/*
	@RequestMapping("/searchAjaxx")
	public ModelAndView searchIdAjaxxHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView("member/searchresult");
		mav.addObject("data", memberDao.searchById(id+"%"));
		
		return mav;
	}
	 */
}
