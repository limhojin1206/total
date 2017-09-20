package org.estrella.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.estrella.app.controller.ws.MemoWSHandler;
import org.estrella.app.model.MemoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/memo")
public class MemoController {

	@Autowired
	MemoDao mdao;
	@Autowired
	MemoWSHandler memows;
	
	@GetMapping("/send")
	public String sendGetHandle(Map map) {
		map.put("title", "MEMO");
		map.put("section", "memo/send");
		return "t_expr";
	}
	
	@PostMapping("/send")
	public String sendPostHandle(@RequestParam Map map) {
		int rst = mdao.send(map);
		if(rst == 1) {
			System.out.println("쪽지 전송 성공");
			memows.sendMessage(map);
		}else{
			System.out.println("쪽지 전송 실패");
		}
		return "redirect:/memo/list";
	}
	
	@RequestMapping("/list")
	public String listHandle(Map map, HttpSession session, HttpServletRequest request, @RequestParam(name="page", defaultValue="1") int page ) {
		String id = (String)((Map)session.getAttribute("auth")).get("ID");
		List<Map> memoAllList = mdao.readAll(id);
		request.setAttribute("memolist", memoAllList);
		
		int pagecontroll = 0;
		if(memoAllList.size()%5.0 == 0) {
			pagecontroll = memoAllList.size()/5;
		}else {
			pagecontroll = (memoAllList.size()/5)+1;
		}
		
		if(page < 1) {
			page = 1;
		}else if(page > pagecontroll) {
			
			page = pagecontroll;
		}
		
		Map bmap = new HashMap<>();
			bmap.put("receiver", id);
		if(page==1) {
			bmap.put("START", 1);
			bmap.put("END", 5);
		}else {
			bmap.put("START", ((page-1)*5)+1);
			bmap.put("END", ((page-1)*5)+5);
		}
		request.setAttribute("memoBlist", mdao.readBlist(bmap));
		
		map.put("title", "MEMOLIST");
		map.put("section", "memo/list");
		return "t_expr";
	}
}
