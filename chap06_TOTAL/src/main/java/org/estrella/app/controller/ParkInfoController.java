package org.estrella.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/parkinfo")
public class ParkInfoController {

	@Autowired
	ObjectMapper mapper;
	
	@RequestMapping("/parkinfolist")
	public ModelAndView listGetHandle(Map map, HttpServletRequest request, @RequestParam(required=false) String parkinfosearch,@RequestParam(name="page", defaultValue="1") int page) {
		ModelAndView mav = new ModelAndView("t_expr");
		RestTemplate template = new RestTemplate();
		String resp;
		String aresp;
		int tot = 0;
		int size = 0;
		if(parkinfosearch == null) {
			aresp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/1/999/",String.class);
			resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/{min}/{max}/", String.class,(page*10)-9, page*10);
		}else {
			aresp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/1/999/{str}",String.class,parkinfosearch);
			resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/{min}/{max}/{str}", String.class,(page*10)-9, page*10,parkinfosearch);
		}
		try {
			Map aobj = mapper.readValue(aresp, Map.class);
			mav.addObject("parkinfoalllist",((Map)aobj.get("GetParkInfo")).get("row"));
			Map obj = mapper.readValue(resp, Map.class);
			mav.addObject("parkinfolist",((Map)obj.get("GetParkInfo")).get("row"));
			tot = ((List)((Map)aobj.get("GetParkInfo")).get("row")).size();
			size = tot / 10;
			if (size % 10 > 0)
				size++;
			
			//System.out.println(((List)((Map)aobj.get("GetParkInfo")).get("row")).size());
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("section", "parkinfo/parkinfolist");
		mav.addObject("title", "주자창 정보");
		mav.addObject("pb", (page-1)/10*10+1 );
		mav.addObject("pe", (page-1)/10*10+10 <size ? (page-1)/10*10+10  : size );
		return mav;
	}
}
