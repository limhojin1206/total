package org.estrella.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class Testcontroller {

	@RequestMapping("/basic")
	public String basicHandle() {
		return "test/basic";
	}
}
