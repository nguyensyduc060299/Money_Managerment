package com.money.dao;
import com.money.model.User;
import com.money.model.Wallet;

import java.util.List;
public interface WalletDAO {
    Wallet findBy(int wallet_id);
    List<Wallet> findAll(int id);
    boolean saveWallet(Wallet wallet);
    boolean updateWallet(Wallet wallet);
    boolean deleteWallet(int wallet_id);
    int getId(String nameTable,String str);
    boolean updateShare(int id, int user);
    List<Wallet> listWalletShare(int id);
}
