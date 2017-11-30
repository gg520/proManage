package com.test.promanage.controller;

import javassist.expr.NewArray;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.promanage.po.TableAdmin;
import com.test.promanage.po.TableUser;
import com.test.promanage.pojo.User;
import com.test.promanage.service.UserService;
import com.test.promanage.utils.MD5Utils;

@Controller
public class LoginController {
	
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login()throws Exception{
		return "login";
	}
	
	@RequestMapping("/quit")
	public String quit()throws Exception{
		return "login";
	}
	
}
