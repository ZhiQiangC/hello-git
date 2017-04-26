package com.finance.dao;

import com.finance.entity.FinanceBankInfoEntity;


public interface FinanceBankInfoMapper {


    int deleteByPrimaryKey(String id);

    int insert(FinanceBankInfoEntity record);

    int insertSelective(FinanceBankInfoEntity record);


    FinanceBankInfoEntity selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(FinanceBankInfoEntity record);

    int updateByPrimaryKey(FinanceBankInfoEntity record);
}