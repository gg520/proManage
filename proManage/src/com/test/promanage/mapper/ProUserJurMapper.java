package com.test.promanage.mapper;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.ProUserJurExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProUserJurMapper {
    int countByExample(ProUserJurExample example);

    int deleteByExample(ProUserJurExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProUserJur record);

    int insertSelective(ProUserJur record);

    List<ProUserJur> selectByExample(ProUserJurExample example);

    ProUserJur selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProUserJur record, @Param("example") ProUserJurExample example);

    int updateByExample(@Param("record") ProUserJur record, @Param("example") ProUserJurExample example);

    int updateByPrimaryKeySelective(ProUserJur record);

    int updateByPrimaryKey(ProUserJur record);
}