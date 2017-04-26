package com.finance.dao;

import com.finance.entity.FinanceOnlineBankingEntity;

public interface FinanceOnlineBankingMapper {

    int deleteByPrimaryKey(String id);


    int insert(FinanceOnlineBankingEntity record);


    int insertSelective(FinanceOnlineBankingEntity record);


    FinanceOnlineBankingEntity selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(FinanceOnlineBankingEntity record);


    int updateByPrimaryKey(FinanceOnlineBankingEntity record);
}