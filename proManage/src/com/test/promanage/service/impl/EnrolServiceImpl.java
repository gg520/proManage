package com.test.promanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.TableUserMapper;
import com.test.promanage.po.TableUser;
import com.test.promanage.service.EnrolService;

@Service
public class EnrolServiceImpl implements EnrolService {
	@Autowired
	TableUserMapper mapper;

	@Override
	public int insertSelective(TableUser record) {
		mapper.insertSelective(record);
		return 0;
	}

	@Override
	public int selectByPrimaryKey(String userid) {
		// TODO Auto-generated method stub
		TableUser tableUser = mapper.selectByPrimaryKey(userid);
		if (tableUser == null) {
			return 0;
		} else {

			return 1;
		}
	}

}
