package com.test.promanage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.promanage.exception.CustomException;
import com.test.promanage.po.TableUser;
import com.test.promanage.service.ResetPwdService;
import com.test.promanage.service.UserInforMationService;
import com.test.promanage.utils.MD5Utils;

@Controller
public class ResetController {

	@Autowired
	ResetPwdService pwdService;
	@Autowired
	private UserInforMationService inforMationService;

	@RequestMapping("reset")
	public String reset() {
		return "view/reset";
	}

	@RequestMapping(value = "rexist", method = { RequestMethod.POST })
	public String rExist(String userid, String username, Model model) {
		int exits = pwdService.selectByExample(userid, username);
		if (exits == 0) {
			model.addAttribute("reset", "验证未通过");
			return "view/reset";
		} else {
			model.addAttribute("userid", userid);
			return "view/step2";
		}

	}

	@RequestMapping(value = "repwd", method = { RequestMethod.POST })
	public String rePwd(String userid, String password, Model model) {
		System.out.println(password);
		password = MD5Utils.md5Encode(password);
		TableUser tableUser = new TableUser();
		try {
			tableUser.setUserid(userid);
			tableUser.setPassword(password);
			inforMationService.updateBaseInforMation(tableUser);
		} catch (Exception e) {
			try {
				throw new CustomException(e.getMessage());
			} catch (CustomException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		model.addAttribute("userid", userid);
		model.addAttribute("reset", "修改成功");
		return "view/step2";
	}
}
