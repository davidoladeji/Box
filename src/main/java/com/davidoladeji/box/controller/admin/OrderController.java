package com.davidoladeji.box.controller.admin;

import com.davidoladeji.box.model.Orderitem;
import com.davidoladeji.box.model.Orders;
import com.davidoladeji.box.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by Daveola on 3/17/2015.
 */

@Controller
@RequestMapping("/admin")
public class OrderController {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderStatusRepository orderStatusRepository;

    @Autowired
    OrderitemRepository orderitemRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TransferRepository transferRepository;

    @Autowired
    TransferStatusRepository transferStatusRepository;

    @Autowired
    WarehouseRepository warehouseRepository;


    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public ModelAndView adminProductsPage(ModelAndView model) {
        model.addObject("title", "orders Page");


        model.addObject("orderstatuses", orderStatusRepository.findAll());
        model.addObject("transferstatuses", transferStatusRepository.findAll());
        model.addObject("ordersList", orderRepository.findAll());
        model.addObject("warehousesList", warehouseRepository.findAll());


        model.setViewName("admin/orders");
        return model;
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.GET)
    public ModelAndView adminOrderPage(ModelAndView model, @ModelAttribute("orders") Orders orders) {
        model.addObject("title", "Orders Page");

        model.addObject("productsList", productRepository.findAll());
        model.addObject("customersList", accountRepository.findByRoleId(2));

        model.addObject("orderstatuses", orderStatusRepository.findAll());
        model.addObject("ordersList", orderRepository.findAll());
        model.addObject("warehousesList", warehouseRepository.findAll());

        List<Orders> ordersList = orderRepository.findAll();

        model.addObject("ordersList", ordersList);

        model.setViewName("/admin/addOrder");
        return model;
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.POST)
    public ModelAndView adminOrderPost(ModelAndView model, @ModelAttribute("orders") Orders orders, BindingResult result, final RedirectAttributes redirectAttributes) {
        model.addObject("title", "Orders Page");

        List<Orderitem> orderitems = orders.getOrderItem();

        orderitemRepository.save(orderitems);


        orderRepository.save(orders);
        model.setViewName("admin/orders");
        return model;
    }
}
