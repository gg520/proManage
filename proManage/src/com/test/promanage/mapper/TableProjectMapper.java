package com.test.promanage.mapper;

import com.test.promanage.po.TableProject;
import com.test.promanage.po.TableProjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableProjectMapper {
    int countByExample(TableProjectExample example);

    int deleteByExample(TableProjectExample example);

    int deleteByPrimaryKey(String projectid);

    int insert(TableProject record);

    int insertSelective(TableProject record);

    List<TableProject> selectByExampleWithBLOBs(TableProjectExample example);

    List<TableProject> selectByExample(TableProjectExample example);

    TableProject selectByPrimaryKey(String projectid);

    int updateByExampleSelective(@Param("record") TableProject record, @Param("example") TableProjectExample example);

    int updateByExampleWithBLOBs(@Param("record") TableProject record, @Param("example") TableProjectExample example);

    int updateByExample(@Param("record") TableProject record, @Param("example") TableProjectExample example);

    int updateByPrimaryKeySelective(TableProject record);

    int updateByPrimaryKeyWithBLOBs(TableProject record);

    int updateByPrimaryKey(TableProject record);
}