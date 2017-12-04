package com.test.promanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.TableProCustomMapper;
import com.test.promanage.mapper.TableProjectMapper;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableProjectExample;
import com.test.promanage.service.ProService;

@Service
public class ProServiceImpl implements ProService {

	@Autowired
	private TableProCustomMapper tableProCustomMapper;
	
	@Override
	public List<TableProjectCustom> selectProInfromByUid(String uid)
			throws Exception {
		return tableProCustomMapper.SelectProByUid(uid);
	}

}
