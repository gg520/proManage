package com.test.promanage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.pojo.User;
import com.test.promanage.service.ProService;
import com.test.promanage.service.UserService;

@Controller
@RequestMapping("admin/user")
public class userController {

	@Autowired
	private UserService userService;
	@Autowired
	private ProService proService;
	
	/**
	 * 
	 *
	 * @author guosuzhou
	 *
	 * @param proUserJur
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午9:35:30
	 */
	@RequestMapping(value="verifyUserId",method={RequestMethod.POST})
	public  @ResponseBody int verifyUserId(@RequestBody ProUserJur proUserJur)throws Exception{
		int i=0;
		//该用户是否存在
		i=userService.selectUserById(proUserJur.getUserId());
		if(i==1){
			//存在，查看是否已经有该人
			if(proUserJur.getProjectId()!=null){
				ProUserJur proUserJurs=proService.selectProUserJurByPUid(proUserJur.getProjectId(),proUserJur.getUserId());
				if(proUserJurs!=null){
					//已经添加过该用户
					return 2;
				}
			}
		}
		return i;
	}
}
