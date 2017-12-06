package com.test.promanage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.promanage.pojo.User;
import com.test.promanage.service.UserService;

@Controller
@RequestMapping("admin/user")
public class userController {

	@Autowired
	private UserService userService;
	@RequestMapping(value="verifyUserId",method={RequestMethod.POST})
	public @ResponseBody int verifyUserId(@RequestBody User user)throws Exception{
		int i=0;
		i=userService.selectUserById(user.getUserId());
		return i;
	}
}
