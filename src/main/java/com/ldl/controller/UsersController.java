package com.ldl.controller;

import com.ldl.entity.EduSupermarketRoles;
import com.ldl.entity.EduSupermarketUsers;
import com.ldl.service.RolesService;
import com.ldl.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private RolesService rolesService;

    @GetMapping("/list")
    public String listUsers(@RequestParam(required = false) String keyword, Model model) {
        System.out.printf("123234");
        List<EduSupermarketUsers> userList;
        if (keyword != null && !keyword.isEmpty()) {
            // 调用带搜索条件的Service方法
            userList = usersService.searchUsers(keyword);
        } else {
            // 查询所有用户（无搜索条件）
            userList = usersService.getAllUsers();
        }
        model.addAttribute("users", userList);
        model.addAttribute("keyword", keyword); // 回显搜索关键词
        return "users/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        List<EduSupermarketRoles> roles = rolesService.getAllRoles();
        model.addAttribute("user", new EduSupermarketUsers());
        model.addAttribute("roles", roles);
        return "users/add";
    }

    @PostMapping("/add")
    public String addUser(@ModelAttribute EduSupermarketUsers user) {
        usersService.insertUser(user);
        return "redirect:/users/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        EduSupermarketUsers user = usersService.getUserById(id);
        List<EduSupermarketRoles> roles = rolesService.getAllRoles();
        model.addAttribute("user", user);
        model.addAttribute("roles", roles);
        return "users/edit";
    }

    @PostMapping("/edit")
    public String updateUser(@ModelAttribute EduSupermarketUsers user) {
        usersService.updateUser(user);
        return "redirect:/users/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") String id) {
        usersService.deleteUser(id);
        return "redirect:/users/list";
    }
}    