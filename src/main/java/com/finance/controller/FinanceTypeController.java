package com.finance.controller;

import com.alibaba.fastjson.JSON;
import com.finance.entity.FinanceTypeEntity;
import com.finance.service.FinanceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhph on 2017-01-19.
 */
@Controller
public class FinanceTypeController {

    @Autowired
    private FinanceTypeService typeService;

    FinanceChannelController financeChannelController;


    @RequestMapping("/showTypeList")
    public String showTypeList(Model model,HttpServletRequest request,String typeNumber,String typeName){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("channelNumber", "".equals(typeNumber) ? null : typeNumber);
        map.put("channelName", "".equals(typeName) ? null : typeName);
        List<FinanceTypeEntity> typeList=typeService.selectAll();
        model.addAttribute("typeList", typeList);
        return "finance/typeList";
    }

    @RequestMapping("/getFinancingType")
    public void getFinancingType(Model model, HttpServletResponse response, HttpServletRequest request, HttpSession session , String id, String type){
        FinanceTypeEntity financingType=typeService.selectByID(id);
        String json = JSON.toJSONString(financingType, true);

        out(response,json);
    }
    public void out(HttpServletResponse response,String content){
        try {
            response.setContentType("text/html;charset=utf-8");
            System.out.println("content = ");
            PrintWriter out = response.getWriter();
            out.print(content);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/saveFinancingType")
    @ResponseBody
    public Map<String, Object> saveFinancingType(HttpServletResponse response,
           HttpServletRequest request, FinanceTypeEntity financingType, HttpSession session){
        Map<String, Object> map = new HashMap<String, Object>();
        if(!financingType.getTypeName().equals("") && financingType.getTypeName()!=null){
            String twoTypeNumber=typeService.selectTwoTypeNumber(financingType.getTypeNumber());
            String twoTypeName=typeService.selectTwoTypeName(financingType.getTypeName(),"");
            if(Integer.parseInt(twoTypeNumber)>=1){
                map.put("msg", "2");//����
            }else if(Integer.parseInt(twoTypeName)>=1){
                map.put("msg", "3");//���������ظ�
            }else{
                typeService.saveFinancingType(financingType);
                map.put("msg", "����ɹ���");
            }

        }else{
            typeService.saveFinancingType(financingType);
            map.put("msg", "����ɹ���");
        }
        return map;
    }

    @RequestMapping("/updateFinancingType")
    @ResponseBody
    public Map<String, Object> updateFinancingType(HttpServletResponse response,
           HttpServletRequest request, FinanceTypeEntity financingType, HttpSession session){
        Map<String, Object> map = new HashMap<String, Object>();
        if(!financingType.getTypeName().equals("") && financingType.getTypeName()!=null){
            String twoTypeName=typeService.selectTwoTypeName(financingType.getTypeName(),financingType.getId());
            if(Integer.parseInt(twoTypeName)>=1){
                map.put("msg", "3");//���������ظ�
            }else{
                typeService.updateFinancingType(financingType);
                map.put("msg", "�޸ĳɹ���");
            }

        }else{
            typeService.updateFinancingType(financingType);
            map.put("msg", "�޸ĳɹ���");
        }
        return map;
    }

    @RequestMapping("/deleteFinancingType")
    @ResponseBody
    public Map<String, Object> deleteFinancingType(
            HttpServletResponse response, HttpServletRequest request,String id) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        //��Ҫ����������ˮ���Ƿ��и�������������ɾ����

        try {
            typeService.typeDeleteTrue(id);
            map.put("msg", "ɾ���ɹ�����");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "ɾ��ʧ�ܣ���");
        }
        return map;
    }

}
