package com.test.promanage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.promanage.po.TableFile;
import com.test.promanage.po.TableFileExample;

public interface TableFileMapper {
	int countByExample(TableFileExample example);

	int deleteByExample(TableFileExample example);

	int deleteByPrimaryKey(Integer fileid);

	int insert(TableFile record);

	int insertSelective(TableFile record);

	List<TableFile> selectByExampleWithBLOBs(TableFileExample example);

	List<TableFile> selectByExample(TableFileExample example);

	TableFile selectByPrimaryKey(Integer fileid);

	int updateByExampleSelective(@Param("record") TableFile record,
			@Param("example") TableFileExample example);

	int updateByExampleWithBLOBs(@Param("record") TableFile record,
			@Param("example") TableFileExample example);

	int updateByExample(@Param("record") TableFile record,
			@Param("example") TableFileExample example);

	int updateByPrimaryKeySelective(TableFile record);

	int updateByPrimaryKeyWithBLOBs(TableFile record);

	int updateByPrimaryKey(TableFile record);
}