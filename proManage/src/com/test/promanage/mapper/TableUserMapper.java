package com.test.promanage.mapper;

import com.test.promanage.po.TableUser;
import com.test.promanage.po.TableUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableUserMapper {
    int countByExample(TableUserExample example);

    int deleteByExample(TableUserExample example);

    int deleteByPrimaryKey(String userid);

    int insert(TableUser record);

    int insertSelective(TableUser record);

    List<TableUser> selectByExampleWithBLOBs(TableUserExample example);

    List<TableUser> selectByExample(TableUserExample example);

    TableUser selectByPrimaryKey(String userid);

    int updateByExampleSelective(@Param("record") TableUser record, @Param("example") TableUserExample example);

    int updateByExampleWithBLOBs(@Param("record") TableUser record, @Param("example") TableUserExample example);

    int updateByExample(@Param("record") TableUser record, @Param("example") TableUserExample example);

    int updateByPrimaryKeySelective(TableUser record);

    int updateByPrimaryKeyWithBLOBs(TableUser record);

    int updateByPrimaryKey(TableUser record);
}