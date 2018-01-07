package com.test.promanage.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableFile;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableRate;
import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableVersionCustom;
import com.test.promanage.po.TaskCustom;
import com.test.promanage.pojo.User;
import com.test.promanage.service.InformService;
import com.test.promanage.service.ProService;
import com.test.promanage.service.TaskService;
import com.test.promanage.utils.TimeUtils;
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
	 *             date 2017年12月4日 下午9:56:40
	 */
	@RequestMapping(value = "proList", method = { RequestMethod.GET })
	public String proList() throws Exception {
		return "admin/project/proList";
	}

	@RequestMapping(value = "proList", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableProjectCustom> proList(HttpServletRequest request)
			throws Exception {

		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			List<TableProjectCustom> tableProjectCustoms = proService
					.selectProInfromByUid(user.getUserId());

			return tableProjectCustoms;
		} else {
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
	 *             date 2017年12月4日 下午9:59:21
	 */
	@RequestMapping(value = "creatPro", method = { RequestMethod.GET })
	public String creatPro() throws Exception {

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
	 *             date 2017年12月7日 下午1:01:07
	 */
	@RequestMapping(value = "creatPro", method = { RequestMethod.POST })
	public String creatPro(String proTitle, String proIntro,
			HttpServletRequest request) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (proTitle == null || proTitle.equals("")) {
			request.getSession().setAttribute("createProInform", "创建项目失败");
			return "admin/project/creatPro";
		}
		if (user != null) {
			// 创建时间
			TableProject tableProject = new TableProject();
			tableProject.setCreatetime(new Date());
			tableProject.setProjectname(proTitle);
			tableProject.setIntro(proIntro);
			tableProject.setProjectid(UUIDUtils.getUUID());
			tableProject.setUserid(user.getUserId());
			// 初始进度
			tableProject.setRateid(1);

			ProUserJur proUserJur = new ProUserJur();
			proUserJur.setProjectId(tableProject.getProjectid());
			proUserJur.setUserId(user.getUserId());
			proUserJur.setFlag(1);
			// 设置权限等级
			proUserJur.setJurId(3);

			int x1 = proService.insertTableProject(tableProject);
			if (x1 != 1) {
				// 项目发布失败
				request.getSession().setAttribute("createProInform", "创建项目失败");
				return "admin/project/creatPro";
			} else {
				x1 = 0;
			}
			proService.insertProUserJur(proUserJur);
			request.getSession().setAttribute("createProInform", "创建项目成功");

			return "admin/project/creatPro";
		} else {
			throw new Exception("权限不足");
		}

	}

	/**
	 * 界面的跳转
	 * 
	 * @author guosuzhou
	 * @return
	 * @throws Exception
	 * 
	 *             date 2017年12月7日 下午4:47:22
	 */
	@RequestMapping(value = "editPro/{proId}", method = { RequestMethod.GET })
	public String editPro(@PathVariable String proId, Model model)
			throws Exception {
		// 获取数据
		// 项目信息
		model.addAttribute("tableProject",
				proService.selectTableProjectByPid(proId));
		// 项目任务
		// model.addAttribute("taskList",
		// taskService.selectTableTaskByProId(proId));
		// //项目成员,只要普通成员
		// model.addAttribute("userLsit",
		// proService.selectProUserJurByPid(proId));
		return "admin/project/editPro";
	}

	@RequestMapping(value = "editProIntro", method = { RequestMethod.POST })
	public @ResponseBody
	int editProIntro(@RequestBody TableProject tableProject) throws Exception {

		return proService.updateProjectById(tableProject);
	}

	/**
	 * 获取进度
	 * 
	 * @author guosuzhou
	 * 
	 * @return
	 * 
	 *         date 2017年12月6日 下午2:32:50
	 * @throws Exception
	 */
	@RequestMapping(value = "proRateList", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableRate> proRateList() throws Exception {
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
	@RequestMapping(value = "deProject", method = { RequestMethod.POST })
	public @ResponseBody
	int deProject(@RequestBody TableProject tableProject) throws Exception {

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
	@RequestMapping(value = "projectDetail/{pid}")
	public String projectDetail(@PathVariable String pid, Model model)
			throws Exception {
		// 查找项目基础信息
		model.addAttribute("tableProject",
				proService.selectTableProjectByPid(pid));
		// 查找项目人员信息,包括最近上传的文件
		return "admin/project/projectDetail";

	}

	/**
	 * 查找版本信息
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param tableProject
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月2日
	 */
	@RequestMapping(value = "proVersion", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableVersionCustom> proVersion(@RequestBody TableProject tableProject)
			throws Exception {
		// 获取版本信息和版本文件
		List<TableVersionCustom> tableVersionCustoms = proService
				.selectVersionByPid(tableProject.getProjectid());
		if (tableVersionCustoms != null && tableVersionCustoms.size() > 0) {
			int index = 0;
			for (TableVersionCustom tableVersionCustom : tableVersionCustoms) {
				tableVersionCustoms.get(index).setCtime(
						TimeUtils.dateDifference(tableVersionCustom
								.getCreateTime()));
				index++;
			}
		}
		return tableVersionCustoms;
	}

	/**
	 * 下载
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param tableFile
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	@RequestMapping(value = "downloadFile", method = { RequestMethod.POST })
	public void downloadFile(@RequestBody TableFile tableFile,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		OutputStream outputStream = null;
		InputStream inputStream = null;
		try {
			inputStream = new BufferedInputStream(new FileInputStream(new File(
					tableFile.getFilepath())));
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/for-data");
			response.setHeader("Content-Disposition", "attachment;fileName="
					+ tableFile.getFilename());
			outputStream = new BufferedOutputStream(response.getOutputStream());
			byte[] buf = new byte[1024];
			for (int len = 0; (len = inputStream.read(buf)) != -1;) {
				outputStream.write(buf, 0, len);
				outputStream.flush();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			inputStream.close();
			outputStream.close();
		}
	}

	/**
	 * 获取权限信息
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月2日
	 */
	@RequestMapping(value = "getJur", method = { RequestMethod.POST })
	public @ResponseBody
	ProUserJur getJur(@RequestBody ProUserJur proUserJur,
			HttpServletRequest request) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			return proService.selectProUserJurByPUid(proUserJur.getProjectId(),
					user.getUserId());
		} else {
			return null;
		}
	}

	/**
	 * 获取团队成员
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param proUserJur
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月2日
	 */
	@RequestMapping(value = "getTeamUser", method = { RequestMethod.POST })
	public @ResponseBody
	List<ProUserJur> getTeamUser(@RequestBody ProUserJur proUserJur)
			throws Exception {
		return proService.selectProUserJurByPid(proUserJur.getProjectId());
	}

	/**
	 * 模糊查找
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param str
	 * @param request
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	@RequestMapping(value = "searchProject", method = { RequestMethod.GET })
	public String searchProject(String str, HttpServletRequest request,
			Model model) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			List<TableProjectCustom> tableProjects = proService
					.selectProByLike(str, user.getUserId());
			model.addAttribute("tableProjects", tableProjects);
		}

		return "admin/seach/";
	}

	/**
	 * 模糊查找
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param str
	 * @param request
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	@RequestMapping(value = "searchProject", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableProjectCustom> searchProject(@RequestBody String str,
			HttpServletRequest request) throws Exception {
		str = str.replaceAll("\"", "");
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			List<TableProjectCustom> tableProjects = proService
					.selectProByLike(str, user.getUserId());
			return tableProjects;
		}

		return null;
	}

	@RequestMapping(value = "delUserByPro", method = {})
	public @ResponseBody
	int delUserByPro(@RequestBody ProUserJur proUserJur) throws Exception {

		return proService.deleteUserByPidUid(proUserJur.getProjectId(),
				proUserJur.getUserId());
	}

	/**
	 * 获取自己的任务信息
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param request
	 * @param tableTask
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	@RequestMapping(value = "myTask", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableTask> myTask(HttpServletRequest request,
			@RequestBody TableTask tableTask) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			return proService.selectTaskByPidUid(tableTask.getProjectId(),
					user.getUserId());
		}
		return null;
	}

	/**
	 * 添加人员
	 * 
	 * 
	 * @title ProController.java
	 * @author guosuzhou
	 * @param proUserJur
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	@RequestMapping(value = "addPersonByPid", method = { RequestMethod.POST })
	public @ResponseBody
	int addPersonByPid(@RequestBody ProUserJur proUserJur) throws Exception {

		proUserJur.setFlag(1);
		proUserJur.setJurId(1);
		return proService.insertProUserJur(proUserJur);
	}

	@RequestMapping(value = "addTask", method = {})
	public @ResponseBody
	int addTask(@RequestBody TableTask tableTask) throws Exception {
		tableTask.setFlag(0);
		tableTask.setRateId(2);

		return proService.inserTask(tableTask);
	}

	@RequestMapping(value = "taskList", method = { RequestMethod.POST })
	public @ResponseBody
	List<TaskCustom> taskList(@RequestBody TableTask tableTask)
			throws Exception {
		return proService.selectTaskInformByPid(tableTask.getProjectId());
	}

}
