package com.test.promanage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.pojo.User;
import com.test.promanage.service.ProService;


/**
 * @title ProController
 * @author guosuzhou
 *
 * @date 2017年12月4日
 */
@Controller
@RequestMapping("admin/project")
public class ProController {

	@Autowired
	private ProService proService;
	
	/**
	 * 项目列表
	 *
	 * @author guosuzhou
	 *
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月4日 下午9:56:40
	 */
	@RequestMapping("proList")
	public String proList(HttpServletRequest request,Model model)throws Exception{
		User user=(User)request.getSession().getAttribute("user");
		if(user!=null){
			List<TableProjectCustom> tableProjectCustoms=proService.selectProInfromByUid(user.getUserId());
			model.addAttribute("projectList", tableProjectCustoms);
			return "admin/project/proList";
		}else{
			throw new Exception("未登录");
		}
		
	}
	
	/**
	 * 创建项目 跳转界面
	 *
	 * @author guosuzhou
	 *
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月4日 下午9:59:21
	 */
	@RequestMapping(value="creatPro",method={RequestMethod.GET})
	public String creatPro()throws Exception{
		
		return "admin/project/creatPro";
	}
}
