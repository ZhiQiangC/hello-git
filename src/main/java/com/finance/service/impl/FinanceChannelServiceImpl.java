package com.finance.service.impl;

import com.finance.dao.FinanceChannelMapper;
import com.finance.entity.FinanceChannelEntity;
import com.finance.service.FinanceChannelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by zhph on 2017-01-17.
 */

@Service
public class FinanceChannelServiceImpl implements FinanceChannelService {

    @Resource
    FinanceChannelMapper channelMapper;

    public FinanceChannelEntity selectByID(String id){
        return channelMapper.selectByID(id);
    }

    public void saveFinancingChannel(FinanceChannelEntity financingChannel) {
        financingChannel.setIsSupportImport("0");
        financingChannel.setUpdateUserId("1");
        financingChannel.setUpdateUserName("j");
        channelMapper.insert(financingChannel);
    }

    public void updateFinancingChannel(FinanceChannelEntity financingChannel) {
        financingChannel.setIsSupportImport("0");
        financingChannel.setUpdateUserId("1");
        financingChannel.setUpdateUserName("j");
        channelMapper.updateByPrimaryKey(financingChannel);
    }

    public String isTrueChannelNumber(String channelNumber) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("channelNumber", "'"+channelNumber+"'");
        return channelMapper.isTrueChannelNumber(map);
    }

    public String isTrueChannelName(String channelName,String id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("channelName", "'"+channelName+"'");
        map.put("id", id);
        return channelMapper.isTrueChannelName(map);
    }

    public List<FinanceChannelEntity> selectAll() {
        return channelMapper.selectAll();
    }

    public int deleteTrue(String id) {
        return channelMapper.deleteTrue(id);
    }
}
