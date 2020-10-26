package com.money.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.money.dao.UserDAO;
import com.money.model.User;
import com.money.model.Wallet;
import com.money.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.money.dao.WalletDAO;
import com.money.dao.TransactionDAO;
import com.money.dao.CategoryDAO;
import java.lang.Boolean;

import com.money.model.Category;

@Controller
@RequestMapping("/transaction")
public class TransactionController {
    @Autowired
    private WalletDAO walletDAO;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TransactionDAO transactionDAO;

    @RequestMapping(value="", method = RequestMethod.GET)
    public String showTransactions(@RequestParam("walletid") Integer walletid,@RequestParam("categoryid") Integer categoryid,
                                   @RequestParam("start") String start,@RequestParam("end") String end,
                                   Model model, HttpServletRequest request) throws JsonProcessingException {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        Transaction transaction = new Transaction();
        List<Wallet> wallets = walletDAO.findAll(userId);
        List<Wallet> walletshare = walletDAO.listWalletShare(userId);
        if(walletshare != null){
            for(Wallet w: walletshare){
                wallets.add(w);
            }
        }
        if(walletid == null) walletid = wallets.get(0).getId();

        List<Transaction> transactions = transactionDAO.findByWallet(walletid, categoryid, start, end);
        List<Category> categories = categoryDAO.findAll();
        User user = userDAO.getUserById(userId);
        ObjectMapper mapper = new ObjectMapper();
        String jsonInString = mapper.writeValueAsString(transactions);
        model.addAttribute("transactionss", jsonInString);
        model.addAttribute("user", user);
        model.addAttribute("transactions", transactions);
        model.addAttribute("wallets", wallets);

        model.addAttribute("categories", categories);
        model.addAttribute("transaction", transaction);
        model.addAttribute("categoryid", categoryid);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("walletid", walletid);
        return "transaction-list";
    }

//    @RequestMapping(value="/add", method=RequestMethod.GET)
//    public String getAddTransaction(Model model,HttpServletRequest request) {
//        Wallet wallet = new Wallet();
//        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
//        User user = userDAO.getUserById(userId);
//        model.addAttribute("user", user);
//        model.addAttribute("wallet", wallet);
//        model.addAttribute("mode", "add");
//        return "wallet-list";
//    }

    @RequestMapping(value="/add", method=RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void saveTransaction(@RequestParam("walletid") Integer walletid, @RequestParam("categoryid") Integer categoryid, @RequestParam("note") String note,
                           @RequestParam("time") String time, @RequestParam("amount") Integer amount,
                           Model model,HttpServletRequest request) {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        Wallet wallet = walletDAO.findBy(walletid);
        Category category = categoryDAO.findBy(categoryid);
        Transaction transaction = new Transaction();
        transaction.setUsername(user.getUserName());
        transaction.setUser(userId);
        transaction.setWallet(wallet.getName());
        transaction.setCategory(category.getName());
        transaction.setTime(time);
        transaction.setNote(note);
        transaction.setAmount(amount);
        boolean result = transactionDAO.saveTransaction(transaction);
        System.out.println(result);
//        if (result == false) {
//            return false;
//        }
        model.addAttribute("user", user);
//        return true;
    }


//    @RequestMapping(value="/update", method=RequestMethod.GET)
//    @ResponseStatus(HttpStatus.OK)
//    public Wallet getUpdateWallet(@RequestParam("id") int wallet_id, Model model,HttpServletRequest request) {
//        Wallet wallet = walletDAO.findBy(wallet_id);
//        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
//        User user = userDAO.getUserById(userId);
//        model.addAttribute("user", user);
//        model.addAttribute("wallet", wallet);
//        System.out.println(wallet.getId());
//        return wallet;
//    }
    @RequestMapping(value="/update", method=RequestMethod.POST)
    public String updateTransaction(@RequestParam("walletid") int walletid,@RequestParam("id") int id,@RequestParam("categoryid") Integer categoryid,
                                    @RequestParam("start") String start,@RequestParam("end") String end,
                                    @Valid @ModelAttribute("transaction") Transaction transaction,
                               BindingResult bindingResult, Model model,HttpServletRequest request) {
        transaction.setId(id);
        System.out.println(id);
        System.out.println(transaction.getCategory()+"abcbc");
        System.out.println(transaction.getWallet());
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        model.addAttribute("walletid", walletid);
        model.addAttribute("categoryid", categoryid);
        transaction.setUser(userId);
        transaction.setUsername(user.getUserName());
        model.addAttribute("categoryid", categoryid);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("walletid", walletid);
//        if (bindingResult.hasErrors() ) {
//            model.addAttribute("bindingError", "Vui lòng không để trống mục nào");
//            return getUpdateWallet(wallet.getId(),model,request);
//        }

        boolean result = transactionDAO.updateTransaction(transaction);
//        if (result == false) {
//            model.addAttribute("bindingError", "Cập nhật sách lỗi");
//            return getUpdateWallet(wallet.getId(),model,request);
//        }
        return "redirect:/transaction?walletid="+ walletid+"&categoryid="+categoryid +
                                             "&start="+start+"&end="+end;
    }

    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String deleteBook(@RequestParam("walletid") int walletid,@RequestParam("id") int id,@RequestParam("categoryid") Integer categoryid,
                             @RequestParam("start") String start,@RequestParam("end") String end, Model model) {
        boolean result = transactionDAO.deleteTransaction(id);
        if (result == false) {
            System.out.println("Xóa lỗi");
        }
        model.addAttribute("categoryid", categoryid);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("walletid", walletid);
        return "redirect:/transaction?walletid="+ walletid+"&categoryid="+categoryid +
                "&start="+start+"&end="+end;
    }
}
