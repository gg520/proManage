package com.test.promanage.service;

import org.springframework.stereotype.Service;

import com.test.promanage.po.TableUser;

@Service
public interface EnrolService {
	// 注册用户
	int insertSelective(TableUser record) throws Exception;

	// 查询用户是否存在
	int selectByPrimaryKey(String userid);
}
