package com.test.promanage.mapper;

import com.test.promanage.po.TableJurisdiction;
import com.test.promanage.po.TableJurisdictionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableJurisdictionMapper {
    int countByExample(TableJurisdictionExample example);

    int deleteByExample(TableJurisdictionExample example);

    int deleteByPrimaryKey(Integer jurisdictionId);

    int insert(TableJurisdiction record);

    int insertSelective(TableJurisdiction record);

    List<TableJurisdiction> selectByExample(TableJurisdictionExample example);

    TableJurisdiction selectByPrimaryKey(Integer jurisdictionId);

    int updateByExampleSelective(@Param("record") TableJurisdiction record, @Param("example") TableJurisdictionExample example);

    int updateByExample(@Param("record") TableJurisdiction record, @Param("example") TableJurisdictionExample example);

    int updateByPrimaryKeySelective(TableJurisdiction record);

    int updateByPrimaryKey(TableJurisdiction record);
}