package com.money.controller.admin;

import java.util.List;

import com.money.dao.UserDAO;
import com.money.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin/user-manage")
public class AdminUserController {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping("")
    public String showUser(Model model, HttpServletRequest request) {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        List<User> users = userDAO.listUser(userId);
        int totalUser = users.size();
        model.addAttribute("user", user);
        model.addAttribute("users", users);
        model.addAttribute("totaluser", totalUser);
        return "user-manage";
    }


    @RequestMapping(value ="/add", method = RequestMethod.GET)
    public String getAddUserForm(Model model, HttpServletRequest request){
        User user1 = new User();
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        model.addAttribute("user",user);
        model.addAttribute("user1",user1);
        return "admin/user-add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String saveCategory(@Valid @ModelAttribute("user1")User use1,
                               BindingResult bindingResult, Model model, HttpServletRequest request){
        if(bindingResult.hasErrors()){
            model.addAttribute("bindingError","Vui lòng không để trống");
            return getAddUserForm(model,request);
        }
        boolean result = userDAO.saveUser(use1);
        if(result == false){
            model.addAttribute("bindingError","Thêm lỗi");
            return getAddUserForm(model, request);
        }
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        return "user-manage";
    }

//    @RequestMapping(value = "/update", method = RequestMethod.GET)
//    public String updateUserForm(@RequestParam("id")int id, Model model, HttpServletRequest request){
//        User user1 = userDAO.getUserById(id);
//        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
//        User user = userDAO.getUserById(userId);
//        List<String> roles = userDAO.listRole();
//        model.addAttribute("user",user);
//        model.addAttribute("user1",user1);
//        model.addAttribute("roles",roles);
//        return "admin/user-update";
//    }
//    @RequestMapping(value = "/update", method = RequestMethod.POST)
//    public String updateCategory(@Valid @ModelAttribute("user1") User user1,
//                                 BindingResult bindingResult, Model model,HttpServletRequest request){
//        if(bindingResult.hasErrors()){
//            model.addAttribute("bindingError","Vui lòng không để trống");
//            return updateUserForm(user1.getId(),model,request);
//        }
//        boolean result = userDAO.updateUserAdmin(user1);
//        if(result==false){
//            model.addAttribute("bindingError","Thêm lỗi");
//            return updateUserForm(user1.getId(),model,request);
//        }
//        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
//        User user = userDAO.getUserById(userId);
//        model.addAttribute("user",user);
//        return "redirect:/admin/user-manage?page=1";
//    }
//    @RequestMapping(value = "/delete", method = RequestMethod.GET)
//    public String deleteCategory(@RequestParam("id")int id, Model model){
//        User user = userDAO.getUserById(id);
//        if(user.getRole()== "ROLE_ADMIN"){
//            model.addAttribute("bindingError", "Không thể xóa ADMIN");
//            return "redirect:/admin/user-manage";
//        }else{
//            boolean result = userDAO.deleteUser(id);
//            if(result == false){
//                model.addAttribute("bindingError", "Xóa lỗi");
//                return "redirect:/admin/user-manage";
//            }
//        }
//        return "redirect:/admin/user-manage";
//    }

}

