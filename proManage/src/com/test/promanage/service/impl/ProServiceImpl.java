package com.test.promanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import com.test.promanage.mapper.ProUserJurMapper;
import com.test.promanage.mapper.TableProCustomMapper;
import com.test.promanage.mapper.TableProjectMapper;
import com.test.promanage.mapper.TableRateMapper;
import com.test.promanage.mapper.TableVersionMapper;
import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.ProUserJurExample;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableRate;
import com.test.promanage.po.TableVersion;
import com.test.promanage.po.TableVersionExample;
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
	@Autowired
	private TableVersionMapper tableVersionMapper;
//	@Autowired
//	private ProCustomMapper proCustomMapper;
	
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

	@Override
	public TableProject selectTableProjectByPid(String proId)
			throws Exception {
		return tableProjectMapper.selectByPrimaryKey(proId);
	}

	@Override
	public List<ProUserJur> selectProUserJurByPid(String proId)
			throws Exception {
		ProUserJurExample example=new ProUserJurExample();
		//jur权限为1.普通员工
		example.createCriteria().andProjectIdEqualTo(proId).andJurIdEqualTo(1);
		return proUserJurMapper.selectByExample(example);
	}

	@Override
	public List<ProUserJur> selectProUserJurByPUid(String proId, String uid)
			throws Exception {
		ProUserJurExample example=new ProUserJurExample();
		example.createCriteria().andProjectIdEqualTo(proId).andUserIdEqualTo(uid);
		return proUserJurMapper.selectByExample(example);
	}

	@Override
	public int updateProjectById(TableProject tableProject) throws Exception {
		return tableProjectMapper.updateByPrimaryKeySelective(tableProject);
	}

	@Override
	public int deleteProByPid(String pid) throws Exception {
		
		return tableProjectMapper.deleteByPrimaryKey(pid);
	}

	@Override
	public TableVersion selectTableVersionByPid(String pid) throws Exception {
		TableVersionExample example=new TableVersionExample();
		example.setOrderByClause("create_time desc");
		example.createCriteria().andPrijectIdEqualTo(pid);
		List<TableVersion> tableVersions=tableVersionMapper.selectByExampleWithBLOBs(example);
		if(tableVersions!=null){
			return tableVersions.get(0);
		}
		return null;
	}


}
