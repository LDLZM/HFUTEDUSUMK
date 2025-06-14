package com.ldl.controller;


import com.ldl.entity.EduSupermarketRoles;
import com.ldl.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/roles")
public class RolesController {

    @Autowired
    private RolesService rolesService;

    @GetMapping("/list")
    public String listRoles(Model model) {
        List<EduSupermarketRoles> roles = rolesService.getAllRoles();
        model.addAttribute("roles", roles);
        return "roles/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("role", new EduSupermarketRoles());
        return "roles/add";
    }

    @PostMapping("/add")
    public String addRole(@ModelAttribute EduSupermarketRoles role) {
        rolesService.insertRole(role);
        return "redirect:/roles/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Integer id, Model model) {
        EduSupermarketRoles role = rolesService.getRoleById(id);
        model.addAttribute("role", role);
        return "roles/edit";
    }

    @PostMapping("/edit")
    public String updateRole(@ModelAttribute EduSupermarketRoles role) {
        rolesService.updateRole(role);
        return "redirect:/roles/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteRole(@PathVariable("id") Integer id) {
        rolesService.deleteRole(id);
        return "redirect:/roles/list";
    }
}    