package com.test.promanage.service;

import org.springframework.stereotype.Service;

import com.test.promanage.po.TableUser;

@Service
public interface UserInforMationService {
	// 查找所有信息
	TableUser selectInfromation(String id) throws Exception;

	// 修改表信息

	int updateBaseInforMation(TableUser tableUser) throws Exception;

}
