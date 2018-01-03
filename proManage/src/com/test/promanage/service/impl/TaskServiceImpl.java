package com.test.promanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.net.www.content.text.plain;

import com.test.promanage.mapper.TableTaskMapper;
import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableTaskExample;
import com.test.promanage.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TableTaskMapper tableTaskMapper;
	@Override
	public List<TableTask> selectTableTaskByProId(String proId)
			throws Exception {
		TableTaskExample example=new TableTaskExample();
		example.createCriteria().andProjectIdEqualTo(proId);
		return tableTaskMapper.selectByExampleWithBLOBs(example);
	}
	@Override
	public int insertTableTask(TableTask tableTask) throws Exception {
		return tableTaskMapper.insertSelective(tableTask);
	}

}
