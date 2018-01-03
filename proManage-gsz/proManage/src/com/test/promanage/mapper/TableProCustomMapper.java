package com.test.promanage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectCustom;
import com.test.promanage.pojo.Search;

public interface TableProCustomMapper {

	List<TableProjectCustom> SelectProByUid(@Param("uid")String uid);
	
	/**
	 * 模糊查找
	 * 
	 * 
	 * @title TableProCustomMapper.java
	 * @author guosuzhou
	 * @param str
	 * @param uid
	 * @return
	 * 
	 * @date 2018年1月3日
	 */
	List<TableProjectCustom> seleProByLike(@Param("search")Search search);
}
