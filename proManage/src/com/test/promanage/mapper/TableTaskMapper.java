package com.test.promanage.mapper;

import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableTaskExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableTaskMapper {
    int countByExample(TableTaskExample example);

    int deleteByExample(TableTaskExample example);

    int deleteByPrimaryKey(Integer taskid);

    int insert(TableTask record);

    int insertSelective(TableTask record);

    List<TableTask> selectByExample(TableTaskExample example);

    TableTask selectByPrimaryKey(Integer taskid);

    int updateByExampleSelective(@Param("record") TableTask record, @Param("example") TableTaskExample example);

    int updateByExample(@Param("record") TableTask record, @Param("example") TableTaskExample example);

    int updateByPrimaryKeySelective(TableTask record);

    int updateByPrimaryKey(TableTask record);
}