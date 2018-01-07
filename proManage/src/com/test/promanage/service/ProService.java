package com.test.promanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableFile;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableRate;
import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableVersion;
import com.test.promanage.po.TableVersionCustom;
import com.test.promanage.po.TaskCustom;

@Service
public interface ProService {


	
	/**
	 * 查找与自己相关的项目的详细信息
	 *
	 * @author guosuzhou
	 *
	 * @param uid
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月4日 下午7:59:17
	 */
	List<TableProjectCustom> selectProInfromByUid(String uid)throws Exception;
	
	/**
	 * 添加项目
	 *
	 * @author guosuzhou
	 *
	 * @param tableProject
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月6日 下午2:35:06
	 */
	int insertTableProject(TableProject tableProject)throws Exception;
	
	/**
	 * 添加项目相关数据
	 *
	 * @author guosuzhou
	 *
	 * @param proUserJur
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月6日 下午2:34:41
	 */
	int insertProUserJur(ProUserJur proUserJur)throws Exception;
	
	/**
	 * 查询进度
	 *
	 * @author guosuzhou
	 *
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月6日 下午2:34:29
	 */
	List<TableRate> selectRate()throws Exception;
	
	/**
	 * 获取项目信息tableProject
	 *
	 * @author guosuzhou
	 *
	 * @param proId
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午4:59:31
	 */
	TableProject selectTableProjectByPid(String proId) throws Exception;
	
	/**
	 * 查找项目普通成员
	 *
	 * @author guosuzhou
	 *
	 * @param proId
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午8:50:41
	 */
	List<ProUserJur> selectProUserJurByPid(String proId)throws Exception;
	
	/**
	 * 根据项目id和用户id获取相关信息
	 *
	 * @author guosuzhou
	 *
	 * @param proId
	 * @param uid
	 * @return
	 * @throws Exception
	 *
	 *date 2017年12月7日 下午9:38:11
	 */
	ProUserJur selectProUserJurByPUid(String proId,String uid)throws Exception;
	
	/**
	 * 
	 * 根据主键更新项目信息
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param tableProject
	 * @return
	 * @throws Exception
	 * 
	 * @date 2017年12月11日
	 */
	int updateProjectById(TableProject tableProject)throws Exception;
	
	/**
	 * 
	 * 删除项目信息
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param pid
	 * @return
	 * @throws Exception
	 * 
	 * @date 2017年12月11日
	 */
	int deleteProByPid(String pid)throws Exception;
	
	/**
	 * 查找项目文件信息最新的消息
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param pid
	 * @return
	 * @throws Exception
	 * 
	 * @date 2017年12月11日
	 */
	TableVersion selectTableVersionByPid(String pid) throws Exception;
	
	/**
	 * 查询项目的版本信息
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param pid
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月2日
	 */
	 List<TableVersionCustom> selectVersionByPid(String pid) throws Exception;
	
	/**
	 * 获取文件的信息
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param id
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月2日
	 */
	TableFile selectFileById(int id) throws Exception;
	
	/**
	 * 全文模糊搜索
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param tableProject
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	List<TableProjectCustom> selectProByLike(String str,String uid)throws Exception;
	
	/**
	 * 从项目中删除用户
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param pid
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	int deleteUserByPidUid(String pid,String uid) throws Exception;
	
	/**
	 * 获取任务信息
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param pid
	 * @param uid
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	List<TableTask> selectTaskByPidUid(String pid,String uid) throws Exception;
	
	/**
	 * 添加任务
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param tableTask
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	int inserTask(TableTask tableTask) throws Exception;
	
	/**
	 * 获取任务信息
	 * 
	 * 
	 * @title ProService.java
	 * @author guosuzhou
	 * @param pid
	 * @return
	 * @throws Exception
	 * 
	 * @date 2018年1月3日
	 */
	List<TaskCustom> selectTaskInformByPid(String pid)throws Exception;
}
