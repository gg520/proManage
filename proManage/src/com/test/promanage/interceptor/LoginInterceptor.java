package com.test.promanage.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.test.promanage.pojo.User;



public class LoginInterceptor implements HandlerInterceptor {

	
	//进入 Handler方法之前执行
		//用于身份认证、身份授权
		//比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		
		//获取请求的url
		String url = request.getRequestURI();
		//判断url是否是公开 地址（实际使用时将公开 地址配置配置文件中）
		//这里公开地址是登陆提交的地址
		if(url.endsWith("/proManage/")){
			return true;
		}
		if(url.indexOf("login")>=0){
			//如果进行登陆提交，放行
			return true;
		}
		if(url.indexOf("quit")>=0){
			//如果进行登陆提交，放行
			return true;
		}
		if(url.indexOf("api")>=0){
			//如果请求接口，放行  //接口验证不在此处实现
			return true;
		}
		response.setContentType("text/html;charset=utf-8");
		//判断session
		HttpSession session  = request.getSession();
		//从session中取出用户身份信息
		User user = (User) session.getAttribute("user");
		//执行这里表示用户身份需要认证，跳转登陆页面
		if(url.indexOf("admin")>=0){
			if(user!= null){
//				//身份存在，放行
//				ServletContext application=request.getSession().getServletContext();
//				HashMap<String, HttpSession> applicationMap= (HashMap<String, HttpSession>) application.getAttribute("user");
//				if(user.getUser().equals("管理员")){
//					HttpSession sid=applicationMap.get("admin"+user.getUserno());
//					if(sid==null||sid.toString().length()<=0){
//						response.getWriter().write("<script>alert('尚未登录??！');window.location='"+request.getContextPath()+"/login';</script>");
//						return false;
//					}
//					if(sid.getId().equals(request.getSession().getId())){
//						return true;
//					}else{
//						response.getWriter().write("<script>alert('该账号已在异地登录，请重新登录！');window.location='"+request.getContextPath()+"/login';</script>");
//						return false;
//					}
//				}else{
//					HttpSession sid=applicationMap.get(user.getUserno());
//					if(sid==null||sid.toString().length()<=0){
//						response.getWriter().write("<script>alert('尚未登录??！');window.location='"+request.getContextPath()+"/login';</script>");
//						return false;
//					}
//					if(sid.getId().equals(request.getSession().getId())){
//						return true;
//					}else{
//						response.getWriter().write("<script>alert('该账号已在异地登录，请重新登录！');window.location='"+request.getContextPath()+"/login';</script>");
//						return false;
//					}
//				}
				return true;
			}else{
				response.getWriter().write("<script>alert('尚未登录！');window.location='"+request.getContextPath()+"/login';</script>");
				return false;
			}
		}
		return true;
		
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	
}
