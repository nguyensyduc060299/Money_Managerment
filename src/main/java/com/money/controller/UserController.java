package com.money.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.money.dao.UserDAO;
import com.money.model.User;


/*
 * Lớp quản lý login / registers
 */
@Controller
public class UserController{

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
	@RequestMapping(value= {"/login", "/adminportal"})
	public String showLogin() {
		return "login";
	}
	
	@RequestMapping("/authenticateUser")
	public String processLogin() {
		
		return "redirect:";
	}
	
	@RequestMapping("/register/showRegistrationForm")
	public String showRegistrationForm(Model model) {
		User newUser = new User();
		model.addAttribute("newUser", newUser);
		
		return "register";		
	}
	
	@PostMapping("/register/processRegistrationForm")
	public String processRegistrationForm(@Valid @ModelAttribute("newUser") User newUser,
										BindingResult theBindingResult,
										Model theModel) {
		// form validation
		if(theBindingResult.hasErrors()) {
//			theModel.addAttribute("newUser", new User());
			System.out.println("Invalid form");
			return "register";
		}
		// kiểm tra tài khoản đã tồn tại hay chưa
		if (userDAO.isExistsUser(newUser) == true) {
			System.out.println("Da ton tai user này");
			theModel.addAttribute("alreadyUserError", "Đã tồn tại user này!");
			return "register";
		}
		String encodedPassword = passwordEncoder.encode(newUser.getPassword());
		System.out.println(encodedPassword);
		// update password 
		// role mac định là ROLE_MEMBER
		newUser.setRole("ROLE_MEMBER");
 
		// save to database 
		if(! userDAO.saveUser(newUser)) {
			System.out.println("Tạo user thất bại");
			return "register";
		}
		return "register-confirm";
	}
	
	@RequestMapping("/forgot-password")
	public String showPageForgotPassword() {
		
		return "forgotPassword-2";
	}
}
