package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import web.model.Role;
import web.model.User;
import web.service.RoleService;
import web.service.UserService;

import java.util.HashSet;
import java.util.Set;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @GetMapping("/")
    public String view() {
        return "main";
    }

    @GetMapping("/admin")
    public String listUsers(Model model) {
        model.addAttribute("listUser", userService.getAllUsers());
        return "admin-page";
    }

    @GetMapping("/confidential")
    public String confidential(Model model){
        return "/confidential";
    }

    @GetMapping(value = "/admin/create")
    public String formAddUser(Model model) {
        return "user-form";
    }

    @PostMapping(value = "admin/create")
    public String addUser(@ModelAttribute User user,
                          @RequestParam(value = "role") String roleName) {

        Role role = roleService.getRoleByName(roleName);
        Set<Role> roles = new HashSet<>();
        roles.add(role);
        userService.addUser(user);
        return "redirect:/admin";
    }

    @GetMapping("/admin/delete")
    public String deleteUser(@RequestParam(value = "id") Integer id) {
        userService.deleteUser(userService.getUserById(id));
        return "redirect:/admin";
    }

    @GetMapping("/admin/update")
    public String editForm(@RequestParam(value="id") Integer id, Model model) {
        model.addAttribute("user", userService.getUserById(id));
        return "user-form";
    }

    @PostMapping("/admin/update")
    public String editUser(@ModelAttribute User user,
                           @RequestParam(value = "role") String roleName) {
        Role role = roleService.getRoleByName(roleName);
        Set<Role> roles = new HashSet<>();
        roles.add(role);
        user.setRoles(roles);
        userService.updateUser(user);
        return "redirect:/admin";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "/login";
    }

    @GetMapping("/user")
    public String showMainPage(Model model) {
        return "user-page";
    }

    @ModelAttribute("user")
    public User createUser(){
        return new User();
    }


    @GetMapping("/accessDenied")
    public String accessDeniedPage(Model model) {
        return "noAdminRights";
    }
}
