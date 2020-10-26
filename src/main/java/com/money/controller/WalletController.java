package com.money.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.money.dao.*;
import com.money.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.lang.Boolean;

@Controller
@RequestMapping("/wallet")
public class WalletController {
    @Autowired
    private WalletDAO walletDAO;
    @Autowired
    private TransactionDAO transactionDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private FeedBackDAO feedBackDAO;

    @RequestMapping(value="", method = RequestMethod.GET)
    public String showWallets(Model model, HttpServletRequest request) throws JsonProcessingException {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        List<Wallet> wallets = walletDAO.findAll(userId);
        List<Wallet> walletshare = walletDAO.listWalletShare(userId);
        if(wallets != null){
            for (Wallet w: wallets) {
                List<Transaction> transactions = transactionDAO.findByWallet(w.getId(),0,"","");
                int total = 0;
                for (Transaction t: transactions) {
                    total += t.getAmount();
                }
                if(total <= w.getInitialbalance()){
                    int start = w.getInitialbalance();
                    int percent = (int)((start-total)*100/start);
                    w.setOverbalnce(start-total);
                    w.setPercent(percent);
                }else {
                    int start = w.getInitialbalance();
                    w.setOverbalnce(start-total);
                    w.setPercent(0);
                }
            }
        }
        if(walletshare != null){
            for (Wallet w: walletshare) {
                List<Transaction> transactions = transactionDAO.findByWallet(w.getId(),0,"","");
                int total = 0;
                for (Transaction t: transactions) {
                    total += t.getAmount();
                }
                if(total <= w.getInitialbalance()){
                    int start = w.getInitialbalance();
                    int percent = (int)((start-total)*100/start);
                    w.setOverbalnce(start-total);
                    w.setPercent(percent);
                }else {
                    int start = w.getInitialbalance();
                    w.setOverbalnce(start-total);
                    w.setPercent(0);
                }
            }
        }

        Wallet wallet = new Wallet();
        User user = userDAO.getUserById(userId);
        List<User> listUser = userDAO.listUser(userId);
        ObjectMapper mapper = new ObjectMapper();
        String jsonInString = mapper.writeValueAsString(wallets);
        String jsonInString1 = mapper.writeValueAsString(listUser);
        model.addAttribute("walletss", jsonInString);
        model.addAttribute("listUser", jsonInString1);
        model.addAttribute("user", user);
        model.addAttribute("wallets", wallets);
        model.addAttribute("walletshare", walletshare);
        model.addAttribute("wallet", wallet);
        return "wallet-list";
    }

    @RequestMapping(value="/add", method=RequestMethod.GET)
    public String getAddWallet(Model model,HttpServletRequest request) {
        Wallet wallet = new Wallet();
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        model.addAttribute("wallet", wallet);
        model.addAttribute("mode", "add");
        return "wallet-list";
    }

    @RequestMapping(value="/add", method=RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void saveWallet(@RequestParam("walletname") String walletname, @RequestParam("initialbalance") Integer initialbalance,
                            Model model,HttpServletRequest request) {
        System.out.println(walletname);
        System.out.println(initialbalance);
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        Wallet wallet = new Wallet();
        wallet.setInitialbalance(initialbalance);
        wallet.setUser(userId);
        wallet.setName(walletname);
        wallet.setCurrency("VNĐ");
        System.out.println(wallet.getCurrency());
        boolean result = walletDAO.saveWallet(wallet);
        System.out.println(result);
        model.addAttribute("user", user);
    }


    @RequestMapping(value="/update", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public Wallet getUpdateWallet(@RequestParam("id") int wallet_id, Model model,HttpServletRequest request) {
        Wallet wallet = walletDAO.findBy(wallet_id);
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        model.addAttribute("wallet", wallet);
        System.out.println(wallet.getId());
        return wallet;
    }
    @RequestMapping(value="/update", method=RequestMethod.POST)
    public String updateWallet(@RequestParam("id") int id, @Valid @ModelAttribute("wallet") Wallet wallet,
                             BindingResult bindingResult, Model model,HttpServletRequest request) {
        wallet.setId(id);
        wallet.setCurrency("VNĐ");
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        wallet.setUser(userId);
//        if (bindingResult.hasErrors() ) {
//            model.addAttribute("bindingError", "Vui lòng không để trống mục nào");
//            return getUpdateWallet(wallet.getId(),model,request);
//        }

        boolean result = walletDAO.updateWallet(wallet);
//        if (result == false) {
//            model.addAttribute("bindingError", "Cập nhật sách lỗi");
//            return getUpdateWallet(wallet.getId(),model,request);
//        }
        return "redirect:";
    }

    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String deleteBook(@RequestParam("id") int id) {
        boolean result = walletDAO.deleteWallet(id);
        if (result == false) {
            System.out.println("Xóa lỗi");
        }
        return "redirect:";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String Contact(Model model, HttpServletRequest request){
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        FeedBack feedBack = new FeedBack();
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        model.addAttribute("feedback", feedBack);
        return "contact";
    }

    @RequestMapping(value = "/contact/send", method = RequestMethod.POST)
    public String sendContact(@ModelAttribute("feedback") FeedBack feedback, Model model, HttpServletRequest request){
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        feedback.setUser_id(userId);
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        feedBackDAO.addFeedBack(feedback);
        return "contact";
    }

    @RequestMapping(value = "/share", method = RequestMethod.POST)
    public String saveShare(@RequestParam("walletid") Integer walletid, @RequestParam("email") String email,
                           Model model,HttpServletRequest request) {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        User user1 = userDAO.getUserByEmail(email);
        walletDAO.updateShare(walletid, user1.getId());
        model.addAttribute("user", user);
        return "redirect:/wallet";
    }
}
