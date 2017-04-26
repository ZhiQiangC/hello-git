package com.test.user.controller;

import com.test.user.entity.UserEntity;
import com.test.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zhph on 2016-12-20.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

        @RequestMapping(value = "/dologin")
        public String doLogin(HttpServletRequest request, Model model) {
            System.out.print(request.getParameter("userName"));
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
            token.setRememberMe(true);
            Subject subject = SecurityUtils.getSubject();
            String msg = "";
            try {
                subject.login(token);

                if (subject.isAuthenticated()) {
                    return "redirect:/admin/index.do";
                } else {
                    return "login";
                }
            } catch (IncorrectCredentialsException e) {
                msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect.";
                model.addAttribute("message", msg);
                System.out.println(msg);
            } catch (ExcessiveAttemptsException e) {
                msg = "登录失败次数过多";
                model.addAttribute("message", msg);
                System.out.println(msg);
            } catch (LockedAccountException e) {
                msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";
                model.addAttribute("message", msg);
                System.out.println(msg);
            } catch (DisabledAccountException e) {
                msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was disabled.";
                model.addAttribute("message", msg);
                System.out.println(msg);
            } catch (ExpiredCredentialsException e) {
                msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";
                model.addAttribute("message", msg);
                System.out.println(msg);
            } catch (UnknownAccountException e) {
                msg = "帐号不存在. There is no user with username of " + token.getPrincipal();
                model.addAttribute("message", msg);
                System.out.println(msg);
            } catch (UnauthorizedException e) {
                msg = "您没有得到相应的授权！" + e.getMessage();
                model.addAttribute("message", msg);
                System.out.println(msg);
            }
            return "login";
        }

    @RequestMapping(value = "/login")
    public String Login(HttpServletRequest request, Model model) {
        model.addAttribute("message","");
        return "login";
    }

    @RequestMapping(value="/loginOut",method= RequestMethod.GET)
    public String logout(RedirectAttributes redirectAttributes ){
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息
        SecurityUtils.getSubject().logout();
        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/login.do";
    }

    @RequestMapping("/getUserList")
    @RequiresPermissions("query")
    @ResponseBody
    public List<UserEntity> getUserList() {
        return  userService.selectAll();
    }



    @RequestMapping("/timeOut")
    public String timeOut() {
        return  "timeOut";
    }
}
