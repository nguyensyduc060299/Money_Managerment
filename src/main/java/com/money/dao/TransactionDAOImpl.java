package com.money.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.money.model.Transaction;
import com.money.model.Wallet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.money.model.Category;

/*
 * Lớp làm việc trực tiếp với DB
 */

@Repository
public class TransactionDAOImpl implements TransactionDAO {

    @Autowired                //nhúng bean DriverManagerDataSource đã khởi tạo vào dataSource
    private DataSource dataSource;
    @Autowired
    private CategoryDAO categoryDAO;

    private Connection conn = null;
    private Statement statement = null;
    private PreparedStatement preStatement = null;
    private ResultSet result = null;


    /*
     *  Constant for table
     */


    @Override
    public Transaction findBy(int id) {
        Transaction transaction = new Transaction();
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("select transaction_id, c.name, w.name, t.amount, t.time, t.note, t.user_id, u.username " +
                    "from transaction as t, category as c, wallets as w , user as u" +
                    "where t.transaction_id = ? and c.category_id = t.category_id and w.wallet_id = t.wallet_id and t.user_id = u.user_id");
            preStatement.setInt(1, id);
            result = preStatement.executeQuery();
            if (result.next()) {
                transaction.setId(result.getInt(1));
                transaction.setCategory(result.getString(2));
                transaction.setWallet(result.getString(3));
                transaction.setAmount(result.getInt(4));
                transaction.setTime(result.getString(5));
                transaction.setNote(result.getString(6));
                transaction.setUser(result.getInt(7));
                transaction.setUsername(result.getString(8));
                return transaction;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    //    @Override
//    public List<Book> findAdmin(String bookName, String category, String publisher){
//        List<Book> books = new ArrayList<Book>();
//        try{
//            conn = dataSource.getConnection();
//            String sql = "SELECT b.id, b.name, b.author, b.image, b.total, b.price, b.year, " +
//                    "b.description,pl.name, ct.name, b.num_purchase, b.rating " +
//                    "FROM book AS b, publisher as pl, category as ct" +
//                    " where ";
//
//            if( bookName.length() == 0){
//                sql+= "true and ";
//            }else{
//                sql += " MATCH(b.name) AGAINST ( \"*"+bookName+"*\" IN NATURAL LANGUAGE MODE) and ";
//            }
//
//            if(category.length() == 0){
//                sql+=" b.category_id = ct.id and ";
//            }else{
//                sql+=" b.category_id = ct.id and MATCH(ct.name) AGAINST ( \"*"+category+"*\" IN NATURAL LANGUAGE MODE) and ";
//            }
//
//            if(publisher.length() == 0){
//                sql+=" b.publisher_id = pl.id ";
//            }else{
//                sql+=" b.publisher_id = pl.id and MATCH(pl.name) AGAINST ( \"*"+publisher+"*\" IN NATURAL LANGUAGE MODE)" ;
//            }
//            System.out.println(sql);
//            preStatement = conn.prepareStatement(sql);
//            result = preStatement.executeQuery();
//            while (result.next()) {
//                Book theBook = new Book();
//                theBook.setId(result.getInt(1));
//                theBook.setName(result.getString(2));
//                theBook.setAuthor(result.getString(3));
//                theBook.setImage(result.getString(4));
//                theBook.setTotalInStock(result.getInt(5));
//                theBook.setPrice(result.getInt(6));
//                theBook.setYear(result.getInt(7));
//                theBook.setDescription(result.getString(8));
//                theBook.setPublisher(result.getString(9));
//                theBook.setCategory(result.getString(10));
//                theBook.setNumPurchase(result.getInt(11));
//                theBook.setRating(result.getInt(12));
//                books.add(theBook);
//            }
//        } catch (SQLException e){
//            return null;
//        }
//        return books;
//    }
    @Override
    public List<Transaction> findAll() {
        List<Transaction> transactions = new ArrayList<Transaction>();
        try {
            conn = dataSource.getConnection();
            statement = conn.createStatement();
            result = statement.executeQuery("select transaction_id, c.name, w.name, t.amount, t.time, t.note " +
                    "from transaction as t, category as c, wallets as w " +
                    "where c.category_id = t.category_id and w.wallet_id = t.wallet_id");
            while (result.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(result.getInt(1));
                transaction.setCategory(result.getString(2));
                transaction.setWallet(result.getString(3));
                transaction.setAmount(result.getInt(4));
                transaction.setTime(result.getString(5));
                transaction.setNote(result.getString(6));
                transactions.add(transaction);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return transactions;
    }
    @Override
    public List<Transaction> findByWallet(int id, Integer categoryid, String start, String end) {
        List<Transaction> transactions = new ArrayList<Transaction>();
        String sql = "select transaction_id, c.name, w.name, t.amount, t.time, t.note , t.user_id, u.username"+
                " from transaction as t, category as c, wallets as w , user as u where c.category_id = t.category_id " +
                "and w.wallet_id = t.wallet_id and t.wallet_id = ? and t.user_id = u.user_id";
        if(categoryid != null && categoryid != 0){
            sql+= " and t.category_id = " + categoryid;
        }
        if(!start.equals("")){
            sql+= " and t.time >= "+ start;
        }
        if(!end.equals("")){
            sql+= " and t.time <= " + end;
        }
        System.out.println(sql);
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, id);
            result = preStatement.executeQuery();
            while (result.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(result.getInt(1));
                transaction.setCategory(result.getString(2));
                transaction.setWallet(result.getString(3));
                transaction.setAmount(result.getInt(4));
                transaction.setTime(result.getString(5));
                transaction.setNote(result.getString(6));
                transaction.setUser(result.getInt(7));
                transaction.setUsername(result.getString(8));
                transactions.add(transaction);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return transactions;
    }

    @Override
    public boolean saveTransaction(Transaction transaction) {

        System.out.println(transaction.getUser()+"abc");
        try {
            conn = dataSource.getConnection();

            int category_id = getId("category", transaction.getCategory());

            int wallet_id = getId("wallets", transaction.getWallet());

            preStatement = conn.prepareStatement("INSERT INTO transaction( wallet_id, category_id, time, note, amount, user_id)"
                    + " VALUES(?,?,?,?,?,?)");
            preStatement.setInt(1, wallet_id);
            preStatement.setInt(2, category_id);
            preStatement.setString(3, transaction.getTime());
            preStatement.setString(4, transaction.getNote());
            preStatement.setInt(5, transaction.getAmount());
            preStatement.setInt(6, transaction.getUser());
            int affected = preStatement.executeUpdate();
            if (affected == 0) {
                return false;
            } else {
                return true;
            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean deleteTransaction(int id) {
        String delete = "DELETE FROM transaction where transaction_id = ?";

        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(delete);
            preStatement.setInt(1, id);
            if (preStatement.executeUpdate() > 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateTransaction(Transaction transaction) {

        try {
            conn = dataSource.getConnection();

            int category_id = getId("category", transaction.getCategory());

            int wallet_id = getId("wallets", transaction.getWallet());

            preStatement = conn.prepareStatement("UPDATE transaction SET wallet_id = ?, category_id = ?, time = ? " +
                    ", note = ? , amount = ?, user_id = ? where transaction_id = ?");

            preStatement.setInt(1, wallet_id);
            preStatement.setInt(2, category_id);
            preStatement.setString(3, transaction.getTime());
            preStatement.setString(4, transaction.getNote());
            preStatement.setInt(5, transaction.getAmount());
            preStatement.setInt(6, transaction.getUser());
            preStatement.setInt(7, transaction.getId());
            int affected = preStatement.executeUpdate();
            if (affected == 0) {
                return false;
            } else {
                return true;
            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public int getId(String nameTable, String str) {
        int id = -1;
        String select = "SELECT * FROM " + nameTable;
        String insert = "INSERT INTO " + nameTable + "(name) VALUES(?)";
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(select);
            result = preStatement.executeQuery();
            while (result.next()) {
                if (result.getString(2).equals(str))
                    id = result.getInt(1);
            }
            if (id == -1) {
                preStatement = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
                preStatement.setString(1, str);
                preStatement.execute();
                result = preStatement.getGeneratedKeys();
                while (result.next()) {
                    id = result.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;

    }
}

