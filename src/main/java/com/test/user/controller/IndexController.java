package com.test.user.controller;


import com.test.user.dto.UserListDto;
import com.test.user.dto.UserQueryDto;
import com.test.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Set;

/**
 * Created by zhph on 2016-12-20.
 */
@Controller
@RequestMapping("/admin")
public class IndexController {

    @Autowired
    UserService userService;

    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model) {
        System.out.print("index");
        Subject subject = SecurityUtils.getSubject();

        Set<String>  sets= userService.selectRolesName("zhangsan");
        return "index";
    }


    @RequestMapping(value = "/addUser",method = RequestMethod.GET)
    @RequiresRoles("admin")
    public String addUser() {
        return "user/add";
    }

    @RequestMapping(value = "/userList",method = RequestMethod.GET)
    @RequiresPermissions("query")
    public String userList() {
        return "user/list";
    }

    @RequestMapping(value = "/userList",method = RequestMethod.POST)
    @RequiresPermissions("query")
    @ResponseBody
    public UserListDto userList(UserQueryDto userDto) {
        Subject subject = SecurityUtils.getSubject();
        return userService.queryUserList(userDto);
    }

    @RequestMapping("/403")
    public  String noPower() {
        return "403";
    }
}
