package com.test.promanage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.promanage.po.ProCustom;

public interface ProCustomMapper {

	/**
	 * 
	 * 获取项目的详细信息
	 * 
	 * @title ProCustomMapper.java
	 * @author guosuzhou
	 * @param pid
	 * @return
	 * 
	 * @date 2017年12月11日
	 */
	List<ProCustom> selectProDetailByPid(@Param("pid") String pid);
}
