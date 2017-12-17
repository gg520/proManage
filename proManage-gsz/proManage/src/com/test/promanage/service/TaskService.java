package com.test.promanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.promanage.po.TableTask;

@Service
public interface TaskService {

	/**
	 * 根据pid查找任务
	 *
	 * @author guosuzhou
	 *
	 * @param proId
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午9:53:27
	 */
	List<TableTask> selectTableTaskByProId(String proId )throws Exception;
	
	/**
	 * 添加任务
	 *
	 * @author guosuzhou
	 *
	 * @param tableTask
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午9:54:04
	 */
	int insertTableTask(TableTask tableTask) throws Exception;
}
