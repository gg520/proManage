package com.test.promanage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.promanage.po.TaskCustom;

public interface TaskCustomMapper {
	
	List<TaskCustom> selectTaskByPid(@Param("pid")String pid);

}
