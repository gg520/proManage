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

/**
 * @title LoginController
 * @author guosuzhou
 *
 * @date 2017年12月2日
 */
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	/**
	 * 界面的跳转 登陆界面
	 *
	 * @author guosuzhou
	 *
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月2日 下午7:46:36
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login()throws Exception{
		return "login";
	}
	
	/**
	 * 登陆验证
	 *
	 * @author guosuzhou
	 *
	 * @param userid
	 * @param password
	 * @param request
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月2日 下午8:27:43
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String userid,String password,HttpServletRequest request) throws Exception{
		
		password=MD5Utils.md5Encode(password);
		TableAdmin tableAdmin=userService.selectAdmin(userid, password);
		if(tableAdmin==null){
			//不是管理员权限
			TableUser tableUser=userService.selectUser(userid, password);
			if(tableUser!=null){
				//普通用户 登陆成功
				request.getSession().setAttribute("user", new User("user",tableUser.getUserid(),tableUser.getUsername(),tableUser.getPhoto()));
				return "index";
			}else{
				//登陆失败
				request.getSession().setAttribute("loginError", "账号或密码错误");
			}
		}else{
			//管理员登录
			request.getSession().setAttribute("user", new User("admin",tableAdmin.getAdminId(),tableAdmin.getAdminName(),"touxing.jpg"));
		}
		return "login";
		
	}
	
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request)throws Exception{
		User user=(User)request.getSession().getAttribute("user");
		if(user!=null){
			request.getSession().invalidate();
		}
		return "index";
	}
	
}
