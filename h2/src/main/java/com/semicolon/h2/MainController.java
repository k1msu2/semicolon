package com.semicolon.h2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String h2() {
		return "map";
	}
	
	@RequestMapping("/ex")
	public String example() {
		return "main";
	}
	
	@RequestMapping("/place")
	public String example2() {
		return "place";
	}
	
}
