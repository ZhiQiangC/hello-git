package com.finance.controller;


import com.finance.entity.FinanceChannelEntity;
import com.finance.service.FinanceChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import com.alibaba.fastjson.JSON;
import java.io.*;

@Controller
public class FinanceChannelController {

    @Autowired
    private FinanceChannelService channelService;



    @RequestMapping("/showList")
    public String showList(Model model, HttpServletRequest request,String channelNumber,String channelName) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("channelNumber", "".equals(channelNumber) ? null : channelNumber);
        map.put("channelName", "".equals(channelName) ? null : channelName);
        System.out.print("-------------come on !");
        List<FinanceChannelEntity> channelList=channelService.selectAll();
        model.addAttribute("channelList", channelList);
        return "finance/channelList";
    }

    @RequestMapping("/getFinancingChannel")
    public void getFinancingChannel(Model model,HttpServletResponse response, HttpServletRequest request,HttpSession session ,String id,String type){
        FinanceChannelEntity financingChannel=channelService.selectByID(id);
        String json = JSON.toJSONString(financingChannel, true);

        out(response,json);
    }
    public void out(HttpServletResponse response,String content){
        try {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(content);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/saveFinancingChannel")
    @ResponseBody
    public Map<String, Object> saveFinancingChannel(HttpServletResponse response,
           HttpServletRequest request,FinanceChannelEntity financeChannel,HttpSession session){

        Map<String, Object> map = new HashMap<String, Object>();
        if(!financeChannel.getChannelName().equals("") && financeChannel.getChannelName()!=null){
            String twoChannelNumber=channelService.isTrueChannelNumber(financeChannel.getChannelNumber());
            String twoChannelName=channelService.isTrueChannelName(financeChannel.getChannelName(),"");
            if(Integer.parseInt(twoChannelNumber)>=1){
                map.put("msg", "2");//渠道
            }else if(Integer.parseInt(twoChannelName)>=1){
                map.put("msg", "3");//渠道名称重复
            }else{
                financeChannel.setIsSupportImport("0");
                channelService.saveFinancingChannel(financeChannel);
                map.put("msg", "保存成功！");
            }
        }else{
            channelService.saveFinancingChannel(financeChannel);
            map.put("msg", "保存成功！");
        }
        return map;
    }

    @RequestMapping("/updateFinancingChannel")
    @ResponseBody
    public Map<String, Object> updateFinancingChannel(HttpServletResponse response,
           HttpServletRequest request,FinanceChannelEntity financeChannel,HttpSession session){

        Map<String, Object> map = new HashMap<String, Object>();
        if(!financeChannel.getChannelName().equals("") && financeChannel.getChannelName()!=null){
            String twoChannelName=channelService.isTrueChannelName(financeChannel.getChannelName(),financeChannel.getId());
            if(Integer.parseInt(twoChannelName)>=1){
                map.put("msg", "3");//渠道名称重复
            }else{
                financeChannel.setIsSupportImport("0");
                channelService.updateFinancingChannel(financeChannel);
                map.put("msg", "修改成功！");
            }
        }else{
            channelService.updateFinancingChannel(financeChannel);
            map.put("msg", "修改成功！");
        }
        return map;
    }

    @RequestMapping("/deleteFinancingChannel")
    @ResponseBody
    public Map<String, Object> deleteFinancingChannel(
            HttpServletResponse response, HttpServletRequest request,String id) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        //需要查找网银流水表是否有该渠道：有则不能删除；

        try {
            channelService.deleteTrue(id);
            map.put("msg", "删除成功！！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "删除失败！！");
        }
        return map;
    }


}
