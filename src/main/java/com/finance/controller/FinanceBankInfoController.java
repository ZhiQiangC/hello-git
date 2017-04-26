package com.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


@Controller
public class FinanceBankInfoController {

    @RequestMapping("/bankinfo")
    public String bankinfo(HttpServletRequest request) throws IOException {
        System.out.print("-------------come in !");
        String dataaa ="123";
        request.getSession(true).setAttribute("dataaa",dataaa);

//        // 查询bankinfo数据
//        Reader reader = Resources.getResourceAsReader("jdbc.properties");;
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
//
//        SqlSession session = sqlSessionFactory.openSession();
//        FinanceBankInfoEntity zhphBankInfo = (FinanceBankInfoEntity)session.selectOne("com.finance.entity.FinanceBankInfoEntity.FinanceBankInfoMapper.selectByPrimaryKey",1);
        return "finance/BankInfo_list_table";
    }

}
