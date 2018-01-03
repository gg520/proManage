package com.test.promanage.mapper;

import com.test.promanage.po.TableRate;
import com.test.promanage.po.TableRateExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableRateMapper {
    int countByExample(TableRateExample example);

    int deleteByExample(TableRateExample example);

    int deleteByPrimaryKey(Integer rateid);

    int insert(TableRate record);

    int insertSelective(TableRate record);

    List<TableRate> selectByExample(TableRateExample example);

    TableRate selectByPrimaryKey(Integer rateid);

    int updateByExampleSelective(@Param("record") TableRate record, @Param("example") TableRateExample example);

    int updateByExample(@Param("record") TableRate record, @Param("example") TableRateExample example);

    int updateByPrimaryKeySelective(TableRate record);

    int updateByPrimaryKey(TableRate record);
}