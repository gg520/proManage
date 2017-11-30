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
/**
 * 
 * @title LoginController
 * @author guo
 * @date 2017年11月30日
 */
public class LoginController {

	@Autowired
	private UserService userService;
	
	/**
	 * @title 登录界面跳转
	 * @author guosuzhou
	 * @return
	 * @throws Exception
	 * 
	 * @date 2017年11月30日 下午1:32:55
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login()throws Exception{
		return "login";
	}
	
	/**
	 * 登录验证
	 * @author guosuzhuo
	 * @param userid
	 * @param password
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String userid,String password,HttpServletRequest request) throws Exception{
		password=MD5Utils.md5Encode(password);
		//查询管理员 table_admin
		TableAdmin tableAdmin=userService.selectAdmin(userid,password);
		//查询用户
		if(tableAdmin==null){
			TableUser tableUser=userService.selectUser(userid, password);
			if(tableUser!=null){
				//普通用户登陆成功
				request.getSession().setAttribute("user", new User("user",tableUser.getUserid(),tableUser.getUsername(),tableUser.getPhoto()));
			}else{
				//登陆失败，没有账号，或者密码不对
				request.getSession().setAttribute("loginError", "账号或密码错误");
				return "login";
			}
		}else{
			//管理员登陆成功
			request.getSession().setAttribute("admin"/*用户的权限设置*/, new User("admin",tableAdmin.getAdminId(),tableAdmin.getAdminName(),"touxing.jpg"));
		}
		return "index";
	}
	
	/**
	 * @title  跳转到注册界面
	 * @author guosuzhou
	 * @date 2017年11月30日
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/register")
	public String register()throws Exception{
		return "register";
	}
	
	/**
	 * 跳转忘记密码界面
	 * @author guosuzhou
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/reset")
	public String reset()throws Exception{
		return "reset";
	}
	
	
	/**
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request)throws Exception{
		HttpSession session  = request.getSession();
		session.invalidate();  //清除Session
		return "redirect:index";
	}
}
