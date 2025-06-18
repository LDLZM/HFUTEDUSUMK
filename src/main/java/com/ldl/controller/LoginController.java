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

    @GetMapping("/toLogin")
    public String toLogin() {
        // 直接返回逻辑视图名，由视图解析器拼接路径转发到 login.jsp
        return "login";
    }

//
//    @GetMapping("/")
//    public String showLoginForm(Model model) {
//
//         return "login";
//    }

    @PostMapping("/login")
    public String login(@RequestParam String id,
                        @RequestParam String password,
                        @RequestParam Integer roleId,
                        HttpSession session,
                        Model model) {

        System.out.println(id);
        System.out.println(password);
        // 根据用户名和角色ID验证用户
        EduSupermarketUsers user = usersService.loginByIdAndRole(id, password, roleId);

        if (user != null) {
            // 登录成功，将用户信息存入Session
            session.setAttribute("currentUser", user);
            System.out.println(user.toString());
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