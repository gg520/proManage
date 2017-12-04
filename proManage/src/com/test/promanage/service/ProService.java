package com.test.promanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;

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
	
}
