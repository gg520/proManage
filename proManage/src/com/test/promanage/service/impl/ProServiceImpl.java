package com.test.promanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


















import com.test.promanage.mapper.ProUserJurMapper;
import com.test.promanage.mapper.TableFileMapper;
import com.test.promanage.mapper.TableProCustomMapper;
import com.test.promanage.mapper.TableProjectMapper;
import com.test.promanage.mapper.TableRateMapper;
import com.test.promanage.mapper.TableTaskMapper;
import com.test.promanage.mapper.TaskCustomMapper;
import com.test.promanage.mapper.VersionCustomMapper;
import com.test.promanage.mapper.TableVersionMapper;
import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.ProUserJurExample;
import com.test.promanage.po.TableFile;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableProjectExample;
import com.test.promanage.po.TableRate;
import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableTaskExample;
import com.test.promanage.po.TableVersion;
import com.test.promanage.po.TableVersionCustom;
import com.test.promanage.po.TableVersionExample;
import com.test.promanage.po.TaskCustom;
import com.test.promanage.pojo.Search;
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
	
	@Autowired
	private VersionCustomMapper versionCustomMapper;
	@Autowired
	private TableFileMapper tableFileMapper;
	
	@Autowired
	private TableTaskMapper tableTaskMapper;
	@Autowired
	private TaskCustomMapper taskCustomMapper;
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
		example.createCriteria().andProjectIdEqualTo(proId);
		return proUserJurMapper.selectByExample(example);
	}

	@Override
	public ProUserJur selectProUserJurByPUid(String proId, String uid)
			throws Exception {
		ProUserJurExample example=new ProUserJurExample();
		example.createCriteria().andProjectIdEqualTo(proId).andUserIdEqualTo(uid);
		List<ProUserJur> proUserJurs=proUserJurMapper.selectByExample(example);
		if(proUserJurs!=null&&proUserJurs.size()>0){
			return proUserJurs.get(0);
		}
		return null;
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

	@Override
	public List<TableVersionCustom> selectVersionByPid(String pid) throws Exception {
		return versionCustomMapper.selectVersionByPid(pid);
	}

	@Override
	public TableFile selectFileById(int id) throws Exception {
		return tableFileMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<TableProjectCustom> selectProByLike(String str,String uid) throws Exception {
		Search search =new Search();
		search.setStr(str);
		search.setUid(uid);
		return tableProCustomMapper.seleProByLike(search);
	}

	@Override
	public int deleteUserByPidUid(String pid,String uid) throws Exception {
		ProUserJurExample example=new ProUserJurExample();
		example.createCriteria().andProjectIdEqualTo(pid).andUserIdEqualTo(uid);
		return proUserJurMapper.deleteByExample(example);
	}

	@Override
	public List<TableTask> selectTaskByPidUid(String pid, String uid)
			throws Exception {
		TableTaskExample example=new TableTaskExample();
		example.createCriteria().andProjectIdEqualTo(pid).andUserIdEqualTo(uid);
		return tableTaskMapper.selectByExampleWithBLOBs(example);
	}

	@Override
	public int inserTask(TableTask tableTask) throws Exception {
		return tableTaskMapper.insertSelective(tableTask);
	}

	@Override
	public List<TaskCustom> selectTaskInformByPid(String pid) throws Exception {
		return taskCustomMapper.selectTaskByPid(pid);
	}


}
