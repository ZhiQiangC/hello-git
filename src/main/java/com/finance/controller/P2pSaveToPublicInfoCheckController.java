package com.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Even on 2017/1/19.
 */
@Controller
@RequestMapping("/p2pSaveToPublicInfoCheck")
public class P2pSaveToPublicInfoCheckController {

    @RequestMapping("init")
    public String init(HttpServletRequest request){
        return  "testPage/init";
    }
}
