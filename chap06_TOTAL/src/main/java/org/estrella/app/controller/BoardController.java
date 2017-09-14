package org.estrella.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.estrella.app.model.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardDao bdao;
	
	
	@RequestMapping(path = "/list")
	public String listHandle(Map map, HttpServletRequest request) {
		request.setAttribute("list", bdao.readAll());
		System.out.println(bdao.readAll());
		map.put("section", "board/list");
		map.put("title", "글목록");
		return "t_expr";
	}

	@GetMapping(path = "/add")
	public String handleGet(Map map) {
		map.put("section", "board/add");
		map.put("title", "글쓰기");
		return "t_expr";
	}

	@PostMapping(path = "/add")
	public String handlePost(@RequestParam Map map, HttpServletRequest request) {
		int rst = bdao.write(map);
		request.setAttribute("rst", rst);
		return "redirect:/board/list";
	}

	@RequestMapping(path = "/view/{num}")
	public String viewHandle(@PathVariable String num, HttpServletRequest request, Map map) {
		//System.out.println("NUM = " + num);
		int cntb = bdao.updateCount(num);
		//System.out.println(cntb);
		Map t = bdao.readOne(num);
		request.setAttribute("t", t);
		map.put("section", "board/view");
		map.put("title", num+ "번째 글");
		return "t_expr";
	}
}
