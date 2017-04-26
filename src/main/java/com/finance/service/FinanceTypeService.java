package com.finance.service;

import com.finance.entity.FinanceTypeEntity;

import java.util.List;

/**
 * Created by zhph on 2017-01-19.
 */
public interface FinanceTypeService {


    public void saveFinancingType(FinanceTypeEntity financingType);

    public void updateFinancingType(FinanceTypeEntity financingType);

    public String selectTwoTypeNumber(String typeNumber);

    public String selectTwoTypeName(String typeName,String id);

    List<FinanceTypeEntity> selectAll();

    public int typeDeleteTrue(String id );

    public FinanceTypeEntity selectByID(String id );
}
