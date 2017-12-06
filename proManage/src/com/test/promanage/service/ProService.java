package com.test.promanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.po.TableRate;

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
}
