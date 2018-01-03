package com.test.promanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.TableUserMapper;
import com.test.promanage.po.TableUser;
import com.test.promanage.po.TableUserExample;
import com.test.promanage.service.UserInforMationService;

@Service
public class UserInforMationImpl implements UserInforMationService {

	@Autowired
	TableUserMapper tableUserMapper;

	/**
	 * 查询用户信息的实现类
	 */
	@Override
	public TableUser selectInfromation(String id) throws Exception {
		// TODO Auto-generated method stub
		TableUser tableUser = tableUserMapper.selectByPrimaryKey(id);

		return tableUser;
	}

	@Override
	public int updateBaseInforMation(TableUser tableUser) {
		TableUserExample example = new TableUserExample();

		tableUserMapper.updateByPrimaryKeySelective(tableUser);

		return 1;
	}

}
