package com.davidoladeji.box.controller.admin;


import com.davidoladeji.box.model.Orders;
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


        List<Orders> ordersList = orderRepository.findAll();

        if (ordersList.size() >= 1){
            int count = 0;
            double allOrderPriceTotal = 0.0;
            while (ordersList.listIterator().hasNext() && count < ordersList.size()){

                allOrderPriceTotal += ordersList.listIterator().next().getPrice();
                count++;
            }
            model.addObject("allOrderPriceTotal", allOrderPriceTotal);
        }else{
            //Do nothing
        }



        model.addObject("orderstatuses", orderStatusRepository.findAll());
        model.addObject("transferstatuses", transferStatusRepository.findAll());
        model.addObject("ordersList", ordersList);
        model.addObject("warehousesList", warehouseRepository.findAll());
        model.setViewName("admin/dashboard");
        return model;
    }


}