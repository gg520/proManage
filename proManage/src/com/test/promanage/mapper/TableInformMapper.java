package com.test.promanage.mapper;

import com.test.promanage.po.TableInform;
import com.test.promanage.po.TableInformExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableInformMapper {
    int countByExample(TableInformExample example);

    int deleteByExample(TableInformExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TableInform record);

    int insertSelective(TableInform record);

    List<TableInform> selectByExampleWithBLOBs(TableInformExample example);

    List<TableInform> selectByExample(TableInformExample example);

    TableInform selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TableInform record, @Param("example") TableInformExample example);

    int updateByExampleWithBLOBs(@Param("record") TableInform record, @Param("example") TableInformExample example);

    int updateByExample(@Param("record") TableInform record, @Param("example") TableInformExample example);

    int updateByPrimaryKeySelective(TableInform record);

    int updateByPrimaryKeyWithBLOBs(TableInform record);

    int updateByPrimaryKey(TableInform record);
}