package com.test.promanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableRate;
import com.test.promanage.po.TableVersion;

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
	List<ProUserJur> selectProUserJurByPUid(String proId,String uid)throws Exception;
	
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
	
}
