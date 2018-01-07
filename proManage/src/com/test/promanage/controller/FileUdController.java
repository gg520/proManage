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
import org.springframework.web.multipart.MultipartFile;

import com.test.promanage.po.TableFile;
import com.test.promanage.po.TableFileExample;
import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableVersion;
import com.test.promanage.pojo.User;
import com.test.promanage.service.FileService;
import com.test.promanage.service.ProService;
import com.test.promanage.utils.UUIDUtils;

@Controller
@RequestMapping("admin/project")
public class FileUdController {

	@Autowired
	FileService fileService;
	@Autowired
	private ProService proService;

	/**
	 * 
	 * @param taskid
	 * @param request
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("testjson")
	public @ResponseBody
	List<TableTask> listTask(@RequestBody TableTask tableTask) throws Exception {
		System.out.println("json");
		return fileService.selectAllTaskByExample(tableTask.getProjectId());
	}

	@RequestMapping(value = "upedit", method = { RequestMethod.POST })
	public void upload(String taskid, HttpServletRequest request,
			MultipartFile file, String intro) throws Exception {

		// fileid filename filepath projectid userid taskid intro createtime

		if (file.getSize() == 0) {
			System.out.println("空");
		} else {
			User user = (User) request.getSession().getAttribute("user");
			TableFile tableFile = new TableFile();
			String filename = file.getOriginalFilename();
			String filepath = "D:\\download/task" + UUIDUtils.getUUID()
					+ filename;
			TableTask tableTask = fileService.selectTaskByExample(
					user.getUserId(), Integer.parseInt(taskid));
			String projectId = tableTask.getProjectId();
			Date date = new Date();
			// 文件上传到服务器
			File upfile = new File(filepath);
			file.transferTo(upfile);

			// tablefile数据填充
			tableFile.setFilename(filename);
			tableFile.setFilepath(filepath);
			tableFile.setProid(projectId);
			tableFile.setUserid(user.getUserId());
			tableFile.setTaskid(Integer.parseInt(taskid));
			tableFile.setCreatetime(date);
			tableFile.setIntro(intro);
			fileService.insertSelective(tableFile);
			// 上传成功后任务状态更新成待审核
			fileService
					.updateByPrimaryKeySelective(Integer.parseInt(taskid), 1);
		}

	}

	/**
	 * 
	 * @param taskid
	 * @param request
	 * @param response
	 * @throws Exception
	 */

	@RequestMapping(value = "allTaskList", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableTask> taskList(@RequestBody TableTask tableTask) throws Exception {
		return fileService.selectAllTaskByExample(tableTask.getProjectId());
	}

	@RequestMapping(value = "download1", method = { RequestMethod.POST })
	public void download1(String taskid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		TableFile tableFile = new TableFile();

		tableFile = fileService.selectFileByExample(Integer.parseInt(taskid));
		String filepath = tableFile.getFilepath();

		OutputStream outputStream = null;
		InputStream inputStream = null;
		try {
			inputStream = new BufferedInputStream(new FileInputStream(new File(
					filepath)));
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

	@RequestMapping(value = "download2", method = { RequestMethod.POST })
	public void download2(String fileid, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		TableFile tableFile = fileService.selectMyFileByPrimaryKey(Integer
				.parseInt(fileid));
		String filepath = tableFile.getFilepath();
		OutputStream outputStream = null;
		InputStream inputStream = null;
		try {
			inputStream = new BufferedInputStream(new FileInputStream(new File(
					filepath)));
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

	@RequestMapping(value = "download3/{fileid}", method = { RequestMethod.GET })
	public void download3(@PathVariable String fileid,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		TableFile tableFile = fileService.selectMyFileByPrimaryKey(Integer
				.parseInt(fileid));
		String filepath = tableFile.getFilepath();
		OutputStream outputStream = null;
		InputStream inputStream = null;
		try {
			inputStream = new BufferedInputStream(new FileInputStream(new File(
					filepath)));
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

	// 审核文件，下载文件
	@RequestMapping(value = "downmyfile", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableFile> listTableFile(@RequestBody String project) {

		return null;
	}

	@RequestMapping(value = "myfile", method = { RequestMethod.POST })
	public @ResponseBody
	List<TableFile> myfile(HttpServletRequest request,
			@RequestBody String projectid, Model model) {
		System.out.println("查找我的文件");
		User user = (User) request.getSession().getAttribute("user");
		String userid = user.getUserId();
		TableFileExample example = new TableFileExample();
		example.createCriteria().andProidEqualTo(projectid);
		List<TableFile> listTableFile = fileService.selectMyFilePidUid(userid,
				projectid);
		System.out.println("size" + listTableFile.size());
		return listTableFile;
	}

	@RequestMapping(value = "upeditjson", method = { RequestMethod.POST })
	public @ResponseBody
	int uploadjson(String taskid, HttpServletRequest request, MultipartFile file)
			throws Exception {
		if (file.getSize() == 0) {
			throw new Exception("文件不能为空");
		} else {
			User user = (User) request.getSession().getAttribute("user");
			TableFile tableFile = new TableFile();
			String filename = file.getOriginalFilename();
			String filepath = "D:\\download/task/" + UUIDUtils.getUUID()
					+ filename;

			TableTask tableTask = fileService.selectTaskByExample(
					user.getUserId(), Integer.parseInt(taskid));
			String projectId = tableTask.getProjectId();
			Date date = new Date();
			// 文件上传到服务器
			File upfile = new File(filepath);
			file.transferTo(upfile);

			// tablefile数据填充
			tableFile.setFilename(filename);
			tableFile.setFilepath(filepath);
			tableFile.setProid(projectId);
			tableFile.setUserid(user.getUserId());
			tableFile.setTaskid(Integer.parseInt(taskid));
			tableFile.setCreatetime(date);
			tableFile.setFlag(1);// 待检测
			fileService.insertSelective(tableFile);
			fileService
					.updateByPrimaryKeySelective(Integer.parseInt(taskid), 1);
		}
		return 1;
	}

	// 这个是审核通过的
	@RequestMapping(value = "exam", method = { RequestMethod.POST })
	public @ResponseBody
	int toexam(@RequestBody TableTask task, HttpServletRequest request)
			throws Exception {
		int taskid = task.getTaskid();
		int flag = task.getFlag();
		// 搜索任务id对应的文件

		TableFile tableFile = fileService.selectFileByExample(taskid);
		fileService.updateByPrimaryKeySelective(taskid, flag);
		fileService
				.updateFileByPrimaryKeySelective(tableFile.getFileid(), flag);
		return 1;
	}

	@RequestMapping(value = "newversion", method = { RequestMethod.POST })
	public @ResponseBody
	int newversion(TableVersion tableVersion, MultipartFile file,
			HttpServletRequest request, Model model) throws Exception {
		System.out.println("来了");

		if (file.getSize() == 0) {
			System.out.println("空");
		} else {
			User user = (User) request.getSession().getAttribute("user");
			TableFile tableFile = new TableFile();
			String filename = file.getOriginalFilename();
			String filepath = "D:\\download\\project/" + UUIDUtils.getUUID()
					+ filename;
			Date date = new Date();
			// 文件上传到服务器
			File upfile = new File(filepath);
			file.transferTo(upfile);

			// tablefile数据填充
			tableFile.setFilename(filename);
			tableFile.setFilepath(filepath);
			tableFile.setProid(tableVersion.getPrijectId());
			tableFile.setUserid(user.getUserId());
			tableFile.setFlag(5);// 5代表版本文件

			tableFile.setCreatetime(date);
			tableFile.setIntro(tableVersion.getIntro());
			fileService.insertSelective(tableFile);
			TableFile verTablefile = fileService.selectFIleForVersion(5, date,
					user.getUserId(), tableVersion.getPrijectId());
			// 版本数据填充
			TableVersion version = new TableVersion();
			version.setFileId(verTablefile.getFileid());
			version.setCreateTime(date);
			version.setPrijectId(tableVersion.getPrijectId());
			version.setVersionName(tableVersion.getVersionName());
			version.setIntro(tableVersion.getIntro());
			fileService.insertVersionSelective(version);

		}
		return 1;
	}
}
