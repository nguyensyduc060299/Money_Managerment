package com.money.controller;

import java.util.*;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.money.dao.UserDAO;
import com.money.model.User;
import com.money.model.Event;
import com.sun.xml.internal.ws.util.UtilException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.money.dao.EventDAO;

@Controller
@RequestMapping("/plan")
public class EventController {
    @Autowired
    private EventDAO eventDAO;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value="", method = RequestMethod.GET)
    public String showWallets(@RequestParam("start") String start, @RequestParam("end") String end,  Model model, HttpServletRequest request) throws JsonProcessingException {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());

        List<Event> events = eventDAO.findAll(userId, start, end);
        ObjectMapper mapper = new ObjectMapper();
        String jsonInString = mapper.writeValueAsString(events);
        model.addAttribute("eventss", jsonInString);
        Event event = new Event();
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        model.addAttribute("events", events);
        model.addAttribute("event", event);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        return "plan-list";
    }

    @RequestMapping(value="/add", method=RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void saveWallet(@RequestParam("btn") String btn,@RequestParam("name") String name,@RequestParam("date") String date,@RequestParam("note") String note,
                           Model model,HttpServletRequest request) {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        Event event = new Event();
        event.setBtn(btn);
        event.setUser_id(userId);
        event.setName(name);
        event.setDate(date);
        event.setNote(note);
        boolean result = eventDAO.saveEvent(event);
        System.out.println(result);
//        if (result == false) {
//            return false;
//        }
        model.addAttribute("user", user);
//        return true;
    }

    @RequestMapping(value="/update", method=RequestMethod.POST)
    public String updateWallet(@RequestParam("start") String start, @RequestParam("end") String end,@RequestParam("id") int id, @Valid @ModelAttribute("event") Event event,
                               BindingResult bindingResult, Model model,HttpServletRequest request) {
        event.setId(id);
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        model.addAttribute("user", user);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        event.setUser_id(userId);
//        if (bindingResult.hasErrors() ) {
//            model.addAttribute("bindingError", "Vui lòng không để trống mục nào");
//            return getUpdateWallet(wallet.getId(),model,request);
//        }

        boolean result = eventDAO.updateEvent(event);
//        if (result == false) {
//            model.addAttribute("bindingError", "Cập nhật sách lỗi");
//            return getUpdateWallet(wallet.getId(),model,request);
//        }
        return "redirect:/plan?start="+start+"&end="+end;
    }

    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String deleteBook(@RequestParam("start") String start, @RequestParam("end") String end, @RequestParam("id") int id, Model model) {
        boolean result = eventDAO.deleteEvent(id);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        if (result == false) {
            System.out.println("Xóa lỗi");
        }
        return "redirect:/plan?start="+start+"&end="+end;
    }

    @RequestMapping(value = "/calender", method = RequestMethod.GET)
    public String showCalender(Model model, HttpServletRequest request) throws JsonProcessingException {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        User user = userDAO.getUserById(userId);
        List<Event> eventss = eventDAO.findAll(userId,"","");
        ObjectMapper mapper = new ObjectMapper();
        String jsonInString = mapper.writeValueAsString(eventss);
        model.addAttribute("events", jsonInString);
//        List<List<String>> events = new ArrayList<>();
//        for (Event e: eventss) {
//            List<String> event = new ArrayList<>();
//            event.add(e.getName());
//            event.add(e.getDate());
//            event.add("bg-"+e.getBtn());
//            events.add(event);
//        }
        model.addAttribute("user",user);
        return "app-calendar";
    }
}
