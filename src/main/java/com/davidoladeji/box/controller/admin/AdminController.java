package com.davidoladeji.box.controller.admin;


import com.davidoladeji.box.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"countsList", "currentUsername"})
// The numbers showing various numbers/counts of entities across the backend
public class AdminController {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderStatusRepository orderStatusRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TransferRepository transferRepository;

    @Autowired
    TransferStatusRepository transferStatusRepository;

    @Autowired
    WarehouseRepository warehouseRepository;


    /**
     * Using one (Sessioned) ModelAndView Method to send counts to all views
     *
     * @return
     */
    @ModelAttribute("countsList")
    public List<Integer> countsList() {

        List<Integer> countsListModel = new ArrayList<Integer>();

        int numAccounts = accountRepository.findAll().size();
        countsListModel.add(0, numAccounts);

        int numOrders = orderRepository.findAll().size();
        countsListModel.add(1, numOrders);

        int numProducts = productRepository.findAll().size();
        countsListModel.add(2, numProducts);

        int numTransfers = transferRepository.findAll().size();
        countsListModel.add(3, numTransfers);

        int numWarehouses = warehouseRepository.findAll().size();
        countsListModel.add(4, numWarehouses);

        int numEmployees = accountRepository.findByRoleId(3).size();
        countsListModel.add(5, numEmployees);

        int numDrivers = accountRepository.findByRoleId(4).size();
        countsListModel.add(6, numDrivers);

        int numCustomers = accountRepository.findByRoleId(2).size();
        countsListModel.add(7, numCustomers);

        return countsListModel;
    }


    @RequestMapping(value = {"/admin", "/admin/dashboard"}, method = RequestMethod.GET)
    public ModelAndView adminDashboard(ModelAndView model, Principal currentUsername) {
        model.addObject("title", "Dashboard!");

        model.addObject("currentUsername", currentUsername.getName());


        model.addObject("orderstatuses", orderStatusRepository.findAll());
        model.addObject("transferstatuses", transferStatusRepository.findAll());
        model.addObject("ordersList", orderRepository.findAll());
        model.addObject("warehousesList", warehouseRepository.findAll());
        model.setViewName("admin/dashboard");
        return model;
    }


}