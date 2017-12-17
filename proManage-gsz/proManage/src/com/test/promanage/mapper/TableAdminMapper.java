package com.test.promanage.mapper;

import com.test.promanage.po.TableAdmin;
import com.test.promanage.po.TableAdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableAdminMapper {
    int countByExample(TableAdminExample example);

    int deleteByExample(TableAdminExample example);

    int deleteByPrimaryKey(String adminId);

    int insert(TableAdmin record);

    int insertSelective(TableAdmin record);

    List<TableAdmin> selectByExample(TableAdminExample example);

    TableAdmin selectByPrimaryKey(String adminId);

    int updateByExampleSelective(@Param("record") TableAdmin record, @Param("example") TableAdminExample example);

    int updateByExample(@Param("record") TableAdmin record, @Param("example") TableAdminExample example);

    int updateByPrimaryKeySelective(TableAdmin record);

    int updateByPrimaryKey(TableAdmin record);
}