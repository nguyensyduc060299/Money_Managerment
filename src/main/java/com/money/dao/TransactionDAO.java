package com.money.dao;
import com.money.model.Transaction;
import java.util.List;

public interface TransactionDAO {
    Transaction findBy(int id);
    List<Transaction> findAll();
    List<Transaction> findByWallet(int wallet_id, Integer category, String start, String end);
    boolean saveTransaction(Transaction transaction);
    boolean updateTransaction(Transaction transaction);
    boolean deleteTransaction(int id);
    int getId(String nameTable, String str);
}
