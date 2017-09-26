package org.estrella.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class SearchController {

	@GetMapping("/search")
	public ModelAndView searchIdHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section","member/search");
		mav.addObject("title","member/search");
		return mav;
	}
}
