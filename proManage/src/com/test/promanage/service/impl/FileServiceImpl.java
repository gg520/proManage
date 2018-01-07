package com.test.promanage.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.ProUserJurMapper;
import com.test.promanage.mapper.TableFileMapper;
import com.test.promanage.mapper.TableTaskMapper;
import com.test.promanage.mapper.TableVersionMapper;
import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.ProUserJurExample;
import com.test.promanage.po.TableFile;
import com.test.promanage.po.TableFileExample;
import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableTaskExample;
import com.test.promanage.po.TableVersion;
import com.test.promanage.service.FileService;

@Service
public class FileServiceImpl implements FileService {
	@Autowired
	TableFileMapper fileMapper;
	@Autowired
	TableTaskMapper tableTaskMapper;
	@Autowired
	ProUserJurMapper jurMapper;
	@Autowired
	TableVersionMapper versionMapper;

	@Override
	public int insertSelective(TableFile record) {

		return fileMapper.insertSelective(record);
	}

	@Override
	public TableFile selectFileByExample(int taskid) throws Exception {
		TableFileExample example = new TableFileExample();
		// 下载文件 根据taskid查找文件路径 找当前任务对应的文件 必须flag=1 或者2才是当前需要的
		example.createCriteria().andTaskidEqualTo(taskid).andFlagBetween(1, 2);
		List<TableFile> listFile = fileMapper.selectByExample(example);
		if (listFile.size() > 0) {
			return listFile.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<TableTask> selectByExample(String userid) {
		TableTaskExample example = new TableTaskExample();
		example.createCriteria().andUserIdEqualTo(userid);

		return tableTaskMapper.selectByExample(example);
	}

	@Override
	public TableTask selectTaskByExample(String userid, int taskid) {
		TableTaskExample example = new TableTaskExample();
		example.createCriteria().andUserIdEqualTo(userid)
				.andTaskidEqualTo(taskid);
		List<TableTask> listTask = tableTaskMapper.selectByExample(example);
		if (listTask.size() > 0) {
			return listTask.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<TableTask> selectAllTaskByExample(String projectid) {
		TableTaskExample example = new TableTaskExample();
		example.createCriteria().andProjectIdEqualTo(projectid);
		return tableTaskMapper.selectByExample(example);
	}

	@Override
	public ProUserJur selectByExample(String userid, String projectid) {
		ProUserJurExample example = new ProUserJurExample();
		example.createCriteria().andUserIdEqualTo(userid)
				.andProjectIdEqualTo(projectid);
		List<ProUserJur> listProUserJur = jurMapper.selectByExample(example);
		if (listProUserJur.size() > 0) {
			return listProUserJur.get(0);
		} else {
			return null;
		}
	}

	@Override
	public int updateByPrimaryKeySelective(int taskid, int flag) {
		TableTask record = new TableTask();
		record.setTaskid(taskid);
		record.setFlag(flag);
		return tableTaskMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<TableFile> selectMyFilePidUid(String userid, String proid) {
		TableFileExample example = new TableFileExample();
		example.createCriteria().andUseridEqualTo(userid);
		List<TableFile> listTableFile = fileMapper.selectByExample(example);
		if (listTableFile.size() == 0) {
			return null;
		} else {
			return listTableFile;
		}
	}

	//
	@Override
	public TableFile selectMyFileByPrimaryKey(int fileid) throws Exception {
		// TODO Auto-generated method stub
		return fileMapper.selectByPrimaryKey(fileid);
	}

	// 更新文件状态
	@Override
	public int updateFileByPrimaryKeySelective(int fileid, int flag) {
		TableFile tableFile = new TableFile();
		tableFile.setFileid(fileid);
		tableFile.setFlag(flag);
		return fileMapper.updateByPrimaryKeySelective(tableFile);
	}

	@Override
	public int insertVersionSelective(TableVersion record) {

		return versionMapper.insertSelective(record);
	}

	@Override
	public TableFile selectFIleForVersion(int flag, Date date, String userid,
			String proid) {
		TableFileExample example = new TableFileExample();
		example.createCriteria().andFlagEqualTo(flag)
				.andCreatetimeEqualTo(date).andUseridEqualTo(userid)
				.andProidEqualTo(proid);
		List<TableFile> listTableFile = fileMapper.selectByExample(example);
		if (listTableFile.size() == 0) {
			return null;
		} else {
			return listTableFile.get(0);
		}
	}
}
