package com.ldl.controller;

import com.ldl.entity.EduSupermarketUsers;
import com.ldl.service.UsersService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LoginController {

    @Autowired
    private UsersService usersService;

    @GetMapping("/")
    public String showLoginForm(Model model) {

         return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        @RequestParam Integer roleId,
                        HttpSession session,
                        Model model) {

        // 根据用户名和角色ID验证用户
        EduSupermarketUsers user = usersService.loginByUsernameAndRole(username, password, roleId);

        if (user != null) {
            // 登录成功，将用户信息存入Session
            session.setAttribute("currentUser", user);
            // 重定向到用户角色对应的首页
            return "redirect:" + user.getRole().getHomePage();
        } else {
            // 登录失败，返回错误信息
            model.addAttribute("errorMsg", "用户名、密码或角色不正确");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 清除Session中的用户信息
        session.removeAttribute("currentUser");
        return "redirect:/login";
    }
}