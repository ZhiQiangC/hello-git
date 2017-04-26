package com.finance.service.impl;

import com.finance.dao.FinanceTypeMapper;
import com.finance.service.FinanceTypeService;
import org.springframework.stereotype.Service;
import com.finance.entity.FinanceTypeEntity;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhph on 2017-01-19.
 */

@Service
public class FinanceTypeServiceImpl implements FinanceTypeService {

    @Resource
    FinanceTypeMapper typeMapper;

    public FinanceTypeEntity selectByID(String id){
        return typeMapper.selectByID(id);
    }

    public List<FinanceTypeEntity> selectAll(){
        return typeMapper.selectTypeAll();
    }

    public void saveFinancingType(FinanceTypeEntity financingType) {
        financingType.setUpdateUserId("1");
        financingType.setUpdateUserName("j");
        typeMapper.insert(financingType);
    }

    public void updateFinancingType(FinanceTypeEntity financingType) {
        financingType.setUpdateUserId("1");
        financingType.setUpdateUserName("j");
        typeMapper.updateByPrimaryKey(financingType);
    }

    public String selectTwoTypeNumber(String typeNumber) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("typeNumber", "'"+typeNumber+"'");
        return typeMapper.selectTwoTypeNumber(map);
    }

    public String selectTwoTypeName(String typeName,String id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("typeName", "'"+typeName+"'");
        map.put("id", id);
        return typeMapper.selectTwoTypeName(map);
    }
    public int typeDeleteTrue(String id) {
        return typeMapper.deleteTrue(id);
    }
}
