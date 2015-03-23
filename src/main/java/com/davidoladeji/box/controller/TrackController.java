package com.davidoladeji.box.controller;

import com.davidoladeji.box.model.Account;
import com.davidoladeji.box.model.Orderitem;
import com.davidoladeji.box.model.Orders;
import com.davidoladeji.box.model.Search;
import com.davidoladeji.box.repository.OrderRepository;
import com.davidoladeji.box.repository.OrderitemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Daveola on 3/23/2015.
 */

@Controller
@RequestMapping("/")
@SessionAttributes({"countsList", "loggedInUser"})
public class TrackController {




    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderitemRepository orderitemRepository;


    /**
     * This provides the tracking view
     * @param model
     * @param search
     * @param bindingResult
     * @return
     */

    @RequestMapping(value = "track", method = RequestMethod.GET)
    public ModelAndView trackingItemPage(ModelAndView model, HttpServletRequest request, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Track");
        model.addObject("breadcrumb", "Track");


        Account account = (Account)request.getSession().getAttribute("loggedInUser");
        List<Orders> customerOrdersList = orderRepository.findByAccount_Id(account.getId());


        List<Orderitem> orderitemsList = orderitemRepository.findByOrders_Account_Id(account.getId());

        model.addObject("customerOrdersList", customerOrdersList);
        model.addObject("orderitemsList", orderitemsList);

        model.setViewName("tracking");
        return model;
    }

}
