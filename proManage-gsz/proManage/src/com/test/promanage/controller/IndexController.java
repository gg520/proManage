package com.test.promanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("about")
	public String about(){
		return "view/about";
	}
}
