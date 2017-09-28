package org.estrella.app.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.estrella.app.model.researchDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/research")
public class ResearchController {

	@Autowired
	ObjectMapper mapper;
	@Autowired
	researchDao rdao;
	
	@RequestMapping("/result")
	public ModelAndView resultHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "research/result");
		mav.addObject("title", "research/result");
		return mav;
	}
	
	@RequestMapping(path="/showresult",  produces="application/json;charset=utf-8")
	@ResponseBody
	public String showresultHandle() throws JsonProcessingException {
		Object[] role = new Object[] {"점수", "인원수"};
		List json = new ArrayList();
			json.add(role);
		for(int i=1;i<6;i++) {
			Map map = rdao.result_2(i);
			Object[] o = new Object[] {	i+"점", map.get("CNT")};
			json.add(o);
		}
		//System.out.println(mapper.writeValueAsString(json));
		return mapper.writeValueAsString(json);
	}

}
