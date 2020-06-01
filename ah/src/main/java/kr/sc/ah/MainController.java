package kr.sc.ah;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}

	@RequestMapping("/main")
	public String main2() {
		return "main";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		return "test2";
	}

	@RequestMapping("/slide")
	public String slide() {
		return "slide";
	}

}
