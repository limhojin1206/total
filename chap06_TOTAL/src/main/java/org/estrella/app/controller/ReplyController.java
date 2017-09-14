package org.estrella.app.controller;

import java.awt.event.WindowStateListener;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.estrella.app.model.ReplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/board")
public class ReplyController {
	
	@Autowired
	ObjectMapper mapper;
	@Autowired
	ReplyDao replyDao;
	
	@PostMapping("/reply")
	@ResponseBody
	public String replyAddHandle(@RequestBody(required=false) String body, @CookieValue(name="cantReply", required=false) String cookies,HttpServletResponse response) throws Exception {
		if(cookies != null) {
			System.out.println("도배 금지");
			return "-1";
		}
		
		System.out.println("Body : "+ body);
		Map map = mapper.readValue(body, Map.class);
		int rst = replyDao.createOne(map);
		System.out.println(rst);
		if(rst == 1) {
			System.out.println("쿠키생성");
			Cookie c = new Cookie("cantReply",(String) map.get("writer"));
			c.setPath("/");
			c.setMaxAge(30);
			response.addCookie(c);
		}
		String str = mapper.writeValueAsString(map);
		System.out.println(str);
		return "1";
	}
	
	@RequestMapping(path="/replylist", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String replyListHandle(@RequestBody(required=false) String body) throws Exception {
		//System.out.println("Body : "+ body);
		Map map = mapper.readValue(body, Map.class);
		List list = replyDao.readSome(map);
		String str = mapper.writeValueAsString(list);
		//System.out.println(str);
		return str;
	}
	
	@RequestMapping(path="/replydel", produces="text/html;charset=UTF-8")
	public String replyDelHandle(@RequestBody(required=false) String body) throws Exception{
		Map map = mapper.readValue(body, Map.class);
		int rst = replyDao.delOne(map);
		if(rst != 1) {
			System.out.println("삭제 실패");
		}else {
			System.out.println("삭제 성공");
		}
		return "redirect:view";
	}
	

}
