package com.finance.dao;

import java.util.List;
import java.util.Map;
import com.finance.entity.FinanceChannelEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface FinanceChannelMapper{

    FinanceChannelEntity selectByID(String id);

    int insert(FinanceChannelEntity record);

    String isTrueChannelNumber(Map<String, Object> map);

    String isTrueChannelName(Map<String, Object> map);

    List<FinanceChannelEntity> selectAll();

    int updateByPrimaryKey(FinanceChannelEntity record);

    int deleteTrue(String id);


    int insertSelective(FinanceChannelEntity record);


    FinanceChannelEntity selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(FinanceChannelEntity record);
}
