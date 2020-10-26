package com.money.dao;
import com.money.model.Event;

import java.util.List;
public interface EventDAO {
    Event findBy(int id);
    List<Event> findAll(int id, String start, String end);
    boolean saveEvent(Event event);
    boolean updateEvent(Event event);
    boolean deleteEvent(int id);
    int getId(String nameTable,String str);
}
