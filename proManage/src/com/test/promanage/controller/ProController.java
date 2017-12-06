package com.test.promanage.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableRate;
import com.test.promanage.pojo.User;
import com.test.promanage.service.ProService;
import com.test.promanage.utils.UUIDUtils;


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
	
	
	@RequestMapping(value="creatPro",method={RequestMethod.POST})
	public String creatPro(String proTitle,String proIntro,HttpServletRequest request)throws Exception{
		User user=(User)request.getSession().getAttribute("user");
		if(user!=null){
			//创建时间
			TableProject tableProject=new TableProject();
			tableProject.setCreatetime(new Date());
			tableProject.setProjectname(proTitle);
			tableProject.setIntro(proIntro);
			tableProject.setProjectid(UUIDUtils.getUUID());
			tableProject.setUserid(user.getUserId());
			//初始进度
			tableProject.setRateid(1);
			
			ProUserJur proUserJur=new ProUserJur();
			proUserJur.setProjectId(tableProject.getProjectid());
			proUserJur.setUserId(user.getUserId());
			//设置权限等级
			proUserJur.setJurId(1);
			int x1=proService.insertTableProject(tableProject);
			if(x1!=1){
				//项目发布失败
				request.getSession().setAttribute("error", "创建项目失败");
				return "admin/project/creatPro";
			}else{
				x1=0;
			}
			x1=proService.insertProUserJur(proUserJur);
			if(x1!=1){
				//项目发布失败
				request.getSession().setAttribute("error", "创建项目失败");
				return "admin/project/creatPro";
			}else{
				request.getSession().setAttribute("success", "创建项目成功");
			}
			return "admin/project/creatPro";
		}else{
			throw new Exception("权限不足");
		}
		
	}
	
	/**
	 * 获取进度
	 *
	 * @author guosuzhou
	 *
	 * @return
	 *
	 *date 2017年12月6日 下午2:32:50
	 * @throws Exception 
	 */
	@RequestMapping(value="proRateList",method={RequestMethod.POST})
	public @ResponseBody List<TableRate> proRateList() throws Exception{
		return proService.selectRate();
		
	}
}
