package org.estrella.app.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.estrella.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@Autowired
	MemberDao mdao;
	@Autowired
	ObjectMapper mapper;
	
	@RequestMapping("/01")
	public ModelAndView chart01Handle() {
		ModelAndView mav = new ModelAndView("t_expr");
			List<Map> list = mdao.countByGender();
			System.out.println(list);
			mav.addObject("list",list);
			mav.addObject("title","chart/01");
			mav.addObject("section","chart/01");
		return mav;
	}
	
	@RequestMapping("/02")
	public ModelAndView chart02Handle() throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("title","chart/02");
			mav.addObject("section","chart/02");
			List<Map> list = mdao.countByGender();
			mav.addObject("list",list);
			List json = new ArrayList<>();
			for(Map m : list) {
				Object[] ar = new Object[] {m.get("GENDER"),m.get("CNT")};
				json.add(ar);
			}
			String str = mapper.writeValueAsString(json);
			mav.addObject("str", str);
			System.out.println(str);
			
		return mav;
	}
	
	@RequestMapping("/03")
	public ModelAndView chart03Handle() {
		ModelAndView mav = new ModelAndView("t_expr");
			mav.addObject("title","chart/03");
			mav.addObject("section","chart/03");
		return mav;
	}
	
	
	@RequestMapping(path="/piedata", produces="application/json;charset=utf-8")
	@ResponseBody
	public String piedataJSONHandle(HttpSession session) throws JsonProcessingException {
		List<Map> list = mdao.countByGender();
		session.setAttribute("list", list);
		List json = new ArrayList<>();
		for(Map m : list) {
			Object[] ar = new Object[] {m.get("GENDER"),m.get("CNT")};
			json.add(ar);
		}
		return mapper.writeValueAsString(json);
	}
	
	
	
}
