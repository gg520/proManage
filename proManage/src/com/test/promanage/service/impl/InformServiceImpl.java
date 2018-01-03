package com.test.promanage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.TableInformMapper;
import com.test.promanage.po.TableInform;
import com.test.promanage.service.InformService;

@Service
public class InformServiceImpl implements InformService {

	@Autowired
	private TableInformMapper tableInformMapper;
	@Override
	public int addInform(TableInform tableInform) throws Exception {
		return tableInformMapper.insertSelective(tableInform);
	}

}
