package org.estrella.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/parkinfo")
public class ParkInfoController {

	@Autowired
	ObjectMapper mapper;
	
	@GetMapping("/parkinfolist")
	public String listGetHandle(Map map, HttpServletRequest request, @RequestParam(required=false) String parkinfosearch,@RequestParam(name="page", defaultValue="1") int page) {
		RestTemplate template = new RestTemplate();
		String resp;
		String aresp;
		
		if(parkinfosearch == null) {
			aresp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/1/999/",String.class);
			resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/{min}/{max}/", String.class,(page*10)-9, page*10);
		}else {
			aresp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/1/999/{str}",String.class,parkinfosearch);
			resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/{min}/{max}/{str}", String.class,(page*10)-9, page*10,parkinfosearch);
		}
		try {
			//	min ( page/10 + 1)*10-9   max ( page /10 + 1)*10
			
			// 전체 리스트 길이
			Map aobj = mapper.readValue(aresp, Map.class);
			request.setAttribute("parkinfoalllist", ((Map)aobj.get("GetParkInfo")).get("row"));
			// 검색한 리스트 길이
			Map obj = mapper.readValue(resp, Map.class);
			request.setAttribute("parkinfolist", ((Map)obj.get("GetParkInfo")).get("row"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		map.put("section", "parkinfo/parkinfolist");
		map.put("title", "주자창 정보");
		return "t_expr";
	}
	
	@GetMapping("/pagemove")
	public String pagemoveHandle(Map map, HttpServletRequest request, @RequestParam(required=false) String parkinfosearch,@RequestParam(name="page", defaultValue="1") int page) {
		RestTemplate template = new RestTemplate();
		String resp;
		String aresp;
		
		if(parkinfosearch == null) {
			aresp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/1/999/",String.class);
			resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/{min}/{max}/", String.class,( page/10 + 1)*10-9, ( page /10 + 1)*10);
		}else {
			aresp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/1/999/{str}",String.class,parkinfosearch);
			resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/{min}/{max}/{str}", String.class,( page/10 + 1)*10-9, ( page /10 + 1)*10,parkinfosearch);
		}
		try {
			// 전체 리스트 길이
			Map aobj = mapper.readValue(aresp, Map.class);
			request.setAttribute("parkinfoalllist", ((Map)aobj.get("GetParkInfo")).get("row"));
			// 검색한 리스트 길이
			Map obj = mapper.readValue(resp, Map.class);
			request.setAttribute("parkinfolist", ((Map)obj.get("GetParkInfo")).get("row"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		map.put("section", "parkinfo/parkinfolist");
		map.put("title", "주자창 정보");
		return "t_expr";
	}
	
}
