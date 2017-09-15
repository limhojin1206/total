package org.estrella.app.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.estrella.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	MemberDao mdao;
	@Autowired
	ServletContext application;
	@Autowired
	SimpleDateFormat sdf;
	
	@GetMapping("/info")
	public String infoGetHandle(Map map, HttpSession session) {
		System.out.println(session.getAttribute("auth").toString());
		Map dm = (Map)session.getAttribute("auth");
		Map dmap = mdao.getDetail(dm);
		if(((Map)session.getAttribute("auth")).containsKey("uri")) {
			System.out.println(mdao.prePic(dm).toString());
			String uri = (String)((Map)mdao.prePic(dm)).get("uri");
			dmap.put("uri", uri);
		}
		session.setAttribute("auth", dmap);
		
		map.put("title", "내정보");
		map.put("section", "/my/info");
		return "t_expr";
	}
	
	@PostMapping("/info")
	public String infoPostHandle() {
		return "t_expr";
	}
	
	@GetMapping("/profile")
	public ModelAndView profileGetHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("title", "프로필 관리");
		mav.addObject("section", "/my/profile");
		return mav;
	}
	
	@PostMapping("/profile")
	public ModelAndView profilePostHandle(@RequestParam Map param, @RequestParam(name="profile") MultipartFile f, HttpSession session) throws InterruptedException {
		//System.out.println(request.getParameter("nick"));
		System.out.println(application.getRealPath("/profiles"));
		
		ModelAndView mav = new ModelAndView("t_expr");
		System.out.println("파일정보==================");
		System.out.println(f.toString());
		System.out.println(f.isEmpty());
		System.out.println(f.getContentType());
		System.out.println(f.getName());
		System.out.println(f.getOriginalFilename());
		System.out.println(f.getSize());
		//transferTo(File f) .. 실제 업로드. getInputStream()
		String fileName = ((Map)session.getAttribute("auth")).get("ID")+"_"+sdf.format(System.currentTimeMillis());
		File dst = new File(application.getRealPath("/profiles"), fileName);
		try {
			f.transferTo(dst);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map picMap = new HashMap();
			picMap.put("id", ((Map)session.getAttribute("auth")).get("ID"));
			picMap.put("uri", "/profiles/"+ fileName);
			int r = mdao.addPic(picMap);
		System.out.println("R : " + r);
		
		mav.addObject("title", "프로필 관리");
		mav.addObject("section", "/my/info");
		return mav;
	}
	
}
