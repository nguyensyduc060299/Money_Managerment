package com.money.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.money.dao.UserDAO;
import com.money.model.User;
import com.money.model.Category;
import com.money.model.FeedBack;

@Controller

public class MainController implements ErrorController {

    @Autowired
    private UserDAO userDAO;


    @RequestMapping(value = {"", "/"})
    public String home(HttpSession session, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {        // ~ !auth.getName().equals("anonymousUser")
            String username = auth.getName();
            System.out.println("Login : " + username);
            int userID = userDAO.getIdByUserName(username);
            session.setAttribute("userId", userID);
        }
        return "home";
    }

    // Xử lý lỗi url
    private static final String PATH = "/error";

    @RequestMapping(value = PATH)
    public String error404() {
        return "404";
    }

    @Override
    public String getErrorPath() {
        return PATH;
    }
}

