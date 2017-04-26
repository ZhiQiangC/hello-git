package com.finance.service;

import com.finance.entity.FinanceChannelEntity;

import java.util.List;


/**
 * Created by zhph on 2017-01-16.
 */
public interface FinanceChannelService {

    public void saveFinancingChannel(FinanceChannelEntity financingChannel);

    public void updateFinancingChannel(FinanceChannelEntity financingChannel);

    public String isTrueChannelNumber(String channelNumber);

    public String isTrueChannelName(String channelName,String id);

    List<FinanceChannelEntity> selectAll();

    public int deleteTrue(String id );

    public FinanceChannelEntity selectByID(String id );

}
