package com.test.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Even on 2017/1/12.
 */
@Controller
public class TestController {

    @RequestMapping("/testTable")
    public String testTable(HttpServletRequest request){
        System.out.print("-------------come in !");
        return "testPage/tableTest";
    }

    @RequestMapping("/testForm")
    public String testForm(HttpServletRequest request){
        System.out.print("-------------come in !");
        return "testPage/testForm";
    }
}
