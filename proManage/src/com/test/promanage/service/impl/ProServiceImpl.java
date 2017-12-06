package com.test.promanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.ProUserJurMapper;
import com.test.promanage.mapper.TableProCustomMapper;
import com.test.promanage.mapper.TableProjectMapper;
import com.test.promanage.mapper.TableRateMapper;
import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableProjectExample;
import com.test.promanage.po.TableRate;
import com.test.promanage.service.ProService;

@Service
public class ProServiceImpl implements ProService {

	@Autowired
	private TableProCustomMapper tableProCustomMapper;
	@Autowired
	private TableProjectMapper tableProjectMapper;
	@Autowired
	private ProUserJurMapper proUserJurMapper;
	@Autowired
	private TableRateMapper tableRateMapper;
	
	@Override
	public List<TableProjectCustom> selectProInfromByUid(String uid)
			throws Exception {
		return tableProCustomMapper.SelectProByUid(uid);
	}

	@Override
	public int insertTableProject(TableProject tableProject) throws Exception {
		
		return tableProjectMapper.insertSelective(tableProject);
	}

	@Override
	public int insertProUserJur(ProUserJur proUserJur) throws Exception {
		return proUserJurMapper.insertSelective(proUserJur);
	}

	@Override
	public List<TableRate> selectRate() throws Exception {
		
		return tableRateMapper.selectByExample(null);
	}

}
