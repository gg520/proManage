package com.test.promanage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.promanage.po.TableProjectCustom;

public interface TableProCustomMapper {

	List<TableProjectCustom> SelectProByUid(@Param("uid")String uid);
}
