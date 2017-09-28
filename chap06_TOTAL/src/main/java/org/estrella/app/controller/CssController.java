package org.estrella.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/style")
public class CssController {
	
	@RequestMapping("/01")
	public void css01Handle() {
		// 리턴에 뷰이름을 지정안하면, css/01
			// ==> InternalResourceViewResolver 에 의해서 해석되게
	}
}
