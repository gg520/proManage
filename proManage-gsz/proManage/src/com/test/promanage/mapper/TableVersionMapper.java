package com.test.promanage.mapper;

import com.test.promanage.po.TableVersion;
import com.test.promanage.po.TableVersionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableVersionMapper {
    int countByExample(TableVersionExample example);

    int deleteByExample(TableVersionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TableVersion record);

    int insertSelective(TableVersion record);

    List<TableVersion> selectByExampleWithBLOBs(TableVersionExample example);

    List<TableVersion> selectByExample(TableVersionExample example);

    TableVersion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TableVersion record, @Param("example") TableVersionExample example);

    int updateByExampleWithBLOBs(@Param("record") TableVersion record, @Param("example") TableVersionExample example);

    int updateByExample(@Param("record") TableVersion record, @Param("example") TableVersionExample example);

    int updateByPrimaryKeySelective(TableVersion record);

    int updateByPrimaryKeyWithBLOBs(TableVersion record);

    int updateByPrimaryKey(TableVersion record);
}