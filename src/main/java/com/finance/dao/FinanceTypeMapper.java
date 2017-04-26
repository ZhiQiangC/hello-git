package com.finance.dao;

import com.finance.entity.FinanceTypeEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public interface FinanceTypeMapper {

    FinanceTypeEntity selectByID(String id);

    int insert(FinanceTypeEntity record);

    String selectTwoTypeNumber(Map<String, Object> map );

    String selectTwoTypeName(Map<String, Object> map );

    List<FinanceTypeEntity> selectTypeAll();

    int updateByPrimaryKey(FinanceTypeEntity record);

    int deleteTrue(String id);


    int insertSelective(FinanceTypeEntity record);


    FinanceTypeEntity selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(FinanceTypeEntity record);
}
