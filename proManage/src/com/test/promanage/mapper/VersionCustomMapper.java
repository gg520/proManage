package com.test.promanage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.promanage.po.TableVersionCustom;

public interface VersionCustomMapper {

	List<TableVersionCustom> selectVersionByPid(@Param("pid") String pid);
}
