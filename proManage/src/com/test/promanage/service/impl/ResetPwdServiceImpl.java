package com.test.promanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.TableUserMapper;
import com.test.promanage.po.TableUser;
import com.test.promanage.po.TableUserExample;
import com.test.promanage.service.ResetPwdService;

@Service
public class ResetPwdServiceImpl implements ResetPwdService {
	@Autowired
	TableUserMapper mapper;

	@Override
	public int selectByExample(String userid, String username) {
		TableUserExample example = new TableUserExample();
		example.createCriteria().andUseridEqualTo(userid)
				.andUsernameEqualTo(username);

		List<TableUser> userList = mapper.selectByExample(example);

		if (userList.size() > 0) {
			return 1;
		} else {
			return 0;
		}
	}
}
