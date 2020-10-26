package com.money.dao;

import java.util.List;

import com.money.model.FeedBack;

public interface FeedBackDAO {
    List<FeedBack> findAll();
    FeedBack findBy(int Id);
    boolean addFeedBack(FeedBack feedBack);
    boolean deleteFeedBack(int Id);
    boolean updateFeedBack(FeedBack feedBack);

}
