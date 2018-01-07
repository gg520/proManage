package com.test.promanage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.test.promanage.controller.validation.ValidGroup1;
import com.test.promanage.po.TableUser;
import com.test.promanage.pojo.User;
import com.test.promanage.service.UserInforMationService;
import com.test.promanage.service.UserService;
import com.test.promanage.utils.MD5Utils;
import com.test.promanage.utils.UUIDUtils;

@Controller
@RequestMapping("admin/information")
public class UserInforController {
	@Autowired
	private UserInforMationService inforMationService;
	@Autowired
	private UserService userService;

	/**
	 * 修改基本信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("base")
	public String toChangeinfor(HttpServletRequest request, Model model)
			throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		// 查询详细信息
		TableUser tableUser = inforMationService.selectInfromation(user
				.getUserId());
		model.addAttribute(tableUser);
		return "admin/information/base";
	}

	/**
	 * 处理提交的基本信息
	 * 
	 * @param request
	 * @param tableUser
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "changeinforedit", method = { RequestMethod.POST })
	public String inforChangeSubmit(HttpServletRequest request,
			@Validated(value = { ValidGroup1.class }) TableUser tableUser,
			BindingResult bindingResult, Model model) throws Exception {

		if (bindingResult.hasErrors()) {

			List<ObjectError> allErrors = bindingResult.getAllErrors();
			request.getSession().setAttribute("status", "修改失败");

			// model.addAttribute("allErrors", allErrors);
			return "admin/information/base";
		} else {

			User user = (User) request.getSession().getAttribute("user");
			tableUser.setUserid(user.getUserId());
			inforMationService.updateBaseInforMation(tableUser);

			// 把新改的名字放回session域中
			user.setUserName(tableUser.getUsername());
			request.getSession().setAttribute("status", "修改成功");
		}
		return "admin/information/base";

	}

	/**
	 * 修改头像
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("pic")
	public String toChangePoic() throws Exception {
		return "admin/information/pic";
	}

	/**
	 * 处理修改的头像
	 * 
	 * @param request
	 * @param photo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "changepicedit", method = { RequestMethod.POST })
	public String picChangeSubmit(HttpServletRequest request,
			MultipartFile photo) throws Exception {
		TableUser tableUser = new TableUser();

		// 上传的图片的原始名称 如果不是jpg的图片或者没有选择图片则提示失败
		String photoName = photo.getOriginalFilename();
		if (photoName == null || "".equals(photoName)
				|| !photoName.endsWith("jpg")) {
			request.getSession().setAttribute("uploadError", "请选择一张jpg格式图片");

		} else {
			String filedir = "/download/pic/";
			String filename = UUIDUtils.getUUID() + photoName;
			User user = (User) request.getSession().getAttribute("user");
			// 得到当前修改头像的人的id 作为修改数据库的id并且把修改后的头像重新放回session中以便于及时显示
			tableUser.setUserid(user.getUserId());
			tableUser.setPhoto(filedir + filename);

			// 把文件拷贝到服务器上
			File file = new File(filedir + filename);
			photo.transferTo(file);
			inforMationService.updateBaseInforMation(tableUser);
			request.getSession().setAttribute(
					"user",
					new User("user", user.getUserId(), user.getUserName(),
							filedir + filename));
		}
		return "redirect:pic";
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("pwd")
	public String topwd() throws Exception {
		return "admin/information/pwd";
	}

	/**
	 * 处理修改的密码
	 * 
	 * @param request
	 * @param userid
	 * @param password
	 * @param newpwd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "changepwdedit", method = { RequestMethod.POST })
	public String pwdChangeSubmit(HttpServletRequest request, String userid,
			String password, String newpwd) throws Exception {

		password = MD5Utils.md5Encode(password);
		newpwd = MD5Utils.md5Encode(newpwd);

		TableUser tableuser = userService.selectUser(userid, password);

		if (tableuser != null) {
			// 如果原始密码正确
			TableUser tableUser = new TableUser();
			tableUser.setUserid(userid);
			tableUser.setPassword(newpwd);
			inforMationService.updateBaseInforMation(tableUser);
			request.getSession().setAttribute("pwdError", "修改成功");
		} else {
			request.getSession().setAttribute("pwdError", "原始密码错误");
		}
		return "admin/information/pwd";
	}

}
