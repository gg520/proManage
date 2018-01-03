package com.test.promanage.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.promanage.exception.CustomException;
import com.test.promanage.po.TableUser;
import com.test.promanage.service.EnrolService;
import com.test.promanage.utils.MD5Utils;

@Controller
public class EnrolController {
	@Autowired
	EnrolService enrolService;

	@RequestMapping("enrol")
	public String reset() {
		return "view/enrol";
	}

	@RequestMapping(value = "enroledit", method = { RequestMethod.POST })
	public String enrolUser(String userid, String username, String userintro,
			String password, Model model) {

		TableUser tableUser = new TableUser();

		int exits = enrolService.selectByPrimaryKey(userid);
		// 如果账号存在,跳转并且附加信息
		if (exits != 0) {
			model.addAttribute("enrol", "账号已经存在");
			return "view/enrol";
		} else {
			List<String> errList = new ArrayList<String>();
			if (userid == null || userid.length() < 8 || userid.length() > 32) {
				errList.add("请输入8-32位的账号");
			}
			if (username == null || username.length() < 2
					|| username.length() > 8) {
				errList.add("请输入2-8位的姓名");
			}
			if (password == null) {
				errList.add("密码不能为空");
			}
			// 如果有其他错误，也是返回去
			if (errList.size() > 0) {
				model.addAttribute("errList", errList);
				return "view/enrol";
			} else {
				System.out.println("err");
				// 否则就填值，插入
				tableUser.setUsername(username);
				tableUser.setUserid(userid);
				tableUser.setIntro(userintro);
				tableUser.setPassword(MD5Utils.md5Encode(password));
				tableUser.setPhoto("/img/touxaing.jpg");
				try {
					enrolService.insertSelective(tableUser);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					try {
						throw new CustomException(e.getMessage());
					} catch (CustomException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				model.addAttribute("enrol", "注册成功");
				return "view/enrol";
			}

		}

	}
}
