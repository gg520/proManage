package com.test.promanage.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableInform;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableRate;
import com.test.promanage.po.TableTask;
import com.test.promanage.pojo.User;
import com.test.promanage.service.InformService;
import com.test.promanage.service.ProService;
import com.test.promanage.service.TaskService;
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
	@Autowired
	private InformService informService;
	@Autowired
	private TaskService taskService;
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
	@RequestMapping(value="proList",method={RequestMethod.GET})
	public String proList()throws Exception{
		return "admin/project/proList";
	}
	
	@RequestMapping(value="proList",method={RequestMethod.POST})
	public @ResponseBody List<TableProjectCustom> proList(HttpServletRequest request)throws Exception{
		User user=(User)request.getSession().getAttribute("user");
		if(user!=null){
			List<TableProjectCustom> tableProjectCustoms=proService.selectProInfromByUid(user.getUserId());
			return tableProjectCustoms;
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
	
	/**
	 * 创建项目
	 *
	 * @author guosuzhou
	 *
	 * @param proTitle
	 * @param proIntro
	 * @param userList
	 * @param request
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午1:01:07
	 */
	@RequestMapping(value="creatPro",method={RequestMethod.POST})
	public String creatPro(String proTitle,String proIntro,String userList,HttpServletRequest request)throws Exception{
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
			proUserJur.setFlag(1);
			//设置权限等级
			proUserJur.setJurId(3);
			//合作人
			List<ProUserJur> proUserJurs=new ArrayList<>();
			//添加创建人信息
			proUserJurs.add(proUserJur);
			List<TableInform> tableInforms=new ArrayList<>();
			if(userList!=null&&userList.length()>0){
				
				String users[]=userList.split(";");
				for(String uid:users){
					ProUserJur proUserJur2=new ProUserJur();
					//发送消息
					TableInform tableInform=new TableInform();
					tableInform.setFlag(0);
					tableInform.setTouser(uid);
					tableInform.setType("委托关系");
					tableInform.setContent("任命为项目经理");
					tableInform.setUser(user.getUserId());
					tableInforms.add(tableInform);
					//项目经理为二级权限，直接显示
					proUserJur2.setJurId(2);
					proUserJur2.setProjectId(tableProject.getProjectid());
					proUserJur2.setUserId(uid);
					proUserJur2.setFlag(1);
					proUserJurs.add(proUserJur2);
				}
			}
			
			int x1=proService.insertTableProject(tableProject);
			if(x1!=1){
				//项目发布失败
				request.getSession().setAttribute("error", "创建项目失败");
				return "admin/project/creatPro";
			}else{
				x1=0;
			}
			if(proUserJurs!=null&&proUserJurs.size()>0){
				for(ProUserJur puj:proUserJurs){
					proService.insertProUserJur(puj);
				}
				if(tableInforms!=null&&tableInforms.size()>0){
					for(TableInform tableInform:tableInforms){
						//消息保存到数据库中
						informService.addInform(tableInform);
					}
				}else{
					//项目发布失败,没有添加成员，未知错误
					request.getSession().setAttribute("error", "创建项目失败");
					return "admin/project/creatPro";
				}
			}else{
				//项目发布失败,没有添加成员，未知错误
				request.getSession().setAttribute("error", "创建项目失败");
				return "admin/project/creatPro";
			}
			
			
				request.getSession().setAttribute("success", "创建项目成功");
			
			return "admin/project/creatPro";
		}else{
			throw new Exception("权限不足");
		}
		
	}
	/**
	 * 界面的跳转
	 * @author guosuzhou
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午4:47:22
	 */
	@RequestMapping(value="editPro/{proId}",method={RequestMethod.GET})
	public String editPro(@PathVariable String proId ,Model model)throws Exception{
		//获取数据
		//项目信息
		model.addAttribute("tableProject", proService.selectTableProjectByPid(proId));
		//项目任务
//		model.addAttribute("taskList", taskService.selectTableTaskByProId(proId));
//		//项目成员,只要普通成员
//		model.addAttribute("userLsit", proService.selectProUserJurByPid(proId));
		return "admin/project/editPro";
	}
	/**
	 * 
	 * 编辑项目设置项目进度
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param proId
	 * @param proTitle
	 * @param proIntro
	 * @param proRate
	 * @param request
	 * @return
	 * @throws Exception
	 * 
	 * @date 2017年12月11日
	 */
	@RequestMapping(value="editPro",method={RequestMethod.POST})
	public String editPro(String proId,String proTitle,String proIntro,String proRate,HttpServletRequest request)throws Exception{
		User user=(User)request.getSession().getAttribute("user");
		if(user!=null){
			TableProject tableProject=new TableProject();
			tableProject.setIntro(proIntro);
			tableProject.setProjectname(proTitle);
			tableProject.setProjectid(proId);
			tableProject.setRateid(Integer.valueOf(proRate));
			int i=proService.updateProjectById(tableProject);
			if(i>=1){
				request.getSession().setAttribute("success", "编辑成功");
			}else{
				request.getSession().setAttribute("error", "编辑失败");
			}
			
			return "redirect:editPro/"+proId;
		}else{
			throw new Exception("权限不足");
		}
		
	}
	
	
	/**
	 * 编辑项目
	 *
	 * @author guosuzhou
	 *
	 * @param proTitle
	 * @param proIntro
	 * @param doc_teskList
	 * @param code_teskList
	 * @param userList
	 * @param request
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午1:00:39
	 */
	/*@RequestMapping(value="editPro",method={RequestMethod.POST})
	public String editPro(String proId,String doc_teskList,String code_teskList,String userList,HttpServletRequest request)throws Exception{
		User user=(User)request.getSession().getAttribute("user");
		if(user!=null){
			//处理数据的任务信息
			//文档阶段任务
			List<TableTask> tableTasks=new ArrayList<>();
			if(doc_teskList!=null&&doc_teskList.length()>0){
				String doc_tesk[]=doc_teskList.split("%;%");
				for(String task:doc_tesk){
					TableTask tableTask=new TableTask();
					tableTask.setRateId(2);
					tableTask.setTaskname(task.substring(1, task.indexOf("$$")));
					tableTask.setIntro(task.substring(task.indexOf("$$")+2));
					tableTask.setProjectId(proId);
					tableTasks.add(tableTask);
				}
			}
			//代码阶段任务
			if(code_teskList!=null&&code_teskList.length()>0){
				String code_task[]=code_teskList.split("%;%");
				for(String task:code_task){
					TableTask tableTask=new TableTask();
					tableTask.setRateId(3);
					tableTask.setTaskname(task.substring(1, task.indexOf("$$")));
					tableTask.setIntro(task.substring(task.indexOf("$$")+2));
					tableTask.setProjectId(proId);
					tableTasks.add(tableTask);
				}
			}
			//合作人
			List<ProUserJur> proUserJurs=new ArrayList<>();
			//添加创建人信息
			if(userList!=null&&userList.length()>0){
				
				String users[]=userList.split(";");
				for(String uid:users){
					ProUserJur proUserJur=new ProUserJur();
					proUserJur.setJurId(1);
					proUserJur.setProjectId(proId);
					proUserJur.setUserId(uid);
					proUserJur.setFlag(0);
					proUserJurs.add(proUserJur);
				}
			}
			//添加任务到数据库
			if(tableTasks!=null&&tableTasks.size()>0){
				for(TableTask tableTask:tableTasks){
					taskService.insertTableTask(tableTask);
				}
			}
			if(proUserJurs!=null&&proUserJurs.size()>0){
				for(ProUserJur proUserJur:proUserJurs){
					proService.insertProUserJur(proUserJur);
				}
			}
			request.getSession().setAttribute("success", "编辑成功");
			return "redirect:editPro/"+proId;
		}else{
			throw new Exception("权限不足");
		}
		
	}*/
	
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
	/**
	 * 删除项目
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param tableProject
	 * @return
	 * @throws Exception
	 * 
	 * @date 2017年12月11日
	 */
	@RequestMapping(value="deProject",method={RequestMethod.POST})
	public @ResponseBody int deProject(@RequestBody TableProject tableProject)throws Exception{
		
		
		return proService.deleteProByPid(tableProject.getProjectid());
	}
	
	/**
	 * 项目详细信息显示
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @return
	 * @throws Exception 
	 * 
	 * @date 2017年12月11日
	 */
	@RequestMapping(value="projectDetail/{pid}")
	public String projectDetail(@PathVariable String pid,Model model) throws Exception{
		//查找项目基础信息
		model.addAttribute("tableProject", proService.selectTableProjectByPid(pid));
		//查找项目人员信息,包括最近上传的文件
		return "admin/project/projectDetail";
		
	}
}
