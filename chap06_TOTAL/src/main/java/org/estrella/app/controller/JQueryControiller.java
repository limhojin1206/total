package org.estrella.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/jquery")
public class JQueryControiller {

	@RequestMapping("/01")
	public ModelAndView jquery01() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section","jquery/01");
		mav.addObject("title","jquery/01");
		return mav;
	}
	
	@RequestMapping("/02")
	public ModelAndView jquery02() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section","jquery/02");
		mav.addObject("title","jquery/02");
		return mav;
	}
	
	@RequestMapping("/03")
	public ModelAndView jquery03() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section","jquery/03");
		mav.addObject("title","jquery/03");
		return mav;
	}
	
	@RequestMapping("/qz01")
	public ModelAndView jqueryQz01() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section","jquery/qz01");
		mav.addObject("title","jquery/qz01");
		return mav;
	}
	
	@RequestMapping("/qz02")
	public ModelAndView jqueryQz02() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section","jquery/qz02");
		mav.addObject("title","jquery/qz0");
		return mav;
	}
}
