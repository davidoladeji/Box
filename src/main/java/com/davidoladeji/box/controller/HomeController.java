package com.davidoladeji.box.controller;


import com.davidoladeji.box.model.Account;
import com.davidoladeji.box.model.Product;
import com.davidoladeji.box.model.Search;
import com.davidoladeji.box.model.Warehouse;
import com.davidoladeji.box.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

/**
 * Contains frontend navigation control methods to pages on the frontend of the application
 * <p/>
 * <p/>
 * Home Page: Available to logged in users
 * Login Page: Doubles as the default view
 * Logout Page: page displayed when users log out
 * Registration Page: Users can register new accounts
 * Profile View page:
 * Tracking Page: To view orders being tracked
 * Cart View Page: view Items in cart
 * Order  Page: To make actual order
 * Error Pages: 404 and 403, page not found and access denied respectively
 */


@Controller
@RequestMapping("/")
@SessionAttributes({"countsList"})
public class HomeController {


    @Autowired
    AccountRepository accountRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TransferRepository transferRepository;

    @Autowired
    WarehouseRepository warehouseRepository;


    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView homePage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Home page!");
        model.addObject("breadcrumb", "*");

        model.addObject("productsearch", search);
        List<Product> featuredProductsList = productRepository.findByFeatured(true);
        model.addObject("featuredProductsList", featuredProductsList);

        List<Product> productsList = productRepository.findAll();
        model.addObject("productsList", productsList);


        model.setViewName("index");
        return model;
    }


    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public ModelAndView loginPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Login");
        model.addObject("breadcrumb", "Login");


        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public ModelAndView logoutPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult result) {
        model.addObject("title", "Logout");
        model.addObject("breadcrumb", "Logged out");

        model.setViewName("logout");
        return model;
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public ModelAndView registerPage(ModelAndView model, @ModelAttribute("account") Account account, @ModelAttribute("productsearch") Search search, BindingResult result) {
        model.addObject("title", "Register");
        model.addObject("breadcrumb", "Register");

        model.setViewName("register");
        return model;
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public ModelAndView registerPost(ModelAndView model, @ModelAttribute("account") Account account, BindingResult result, final RedirectAttributes redirectAttributes) {
        model.addObject("title", "Register");
        model.addObject("breadcrumb", "Register");

        // if (result.hasErrors()) {
        //  model.setViewName("register");
        //  return model;

        //  }else{

        accountRepository.save(account);
        model.setViewName("redirect:/");
        return model;
        // }


    }

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public ModelAndView accountProfilePage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Profile");
        model.addObject("breadcrumb", "Profile");

        model.setViewName("profile");
        return model;
    }


    @RequestMapping(value = "track", method = RequestMethod.GET)
    public ModelAndView trackingItemPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Track");
        model.addObject("breadcrumb", "Track");

        model.setViewName("tracking");
        return model;
    }

    @RequestMapping(value = "order", method = RequestMethod.GET)
    public ModelAndView ordersPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Order");
        model.addObject("breadcrumb", "Order");

        List<Warehouse> warehousesList = warehouseRepository.findAll();
        model.addObject("warehousesList", warehousesList);
        model.setViewName("orders");
        return model;
    }

    @RequestMapping(value = "cart", method = RequestMethod.GET)
    public ModelAndView cartPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Cart");
        model.addObject("breadcrumb", "Cart");

        List<Warehouse> warehousesList = warehouseRepository.findAll();
        model.addObject("warehousesList", warehousesList);
        model.setViewName("cart");
        return model;
    }

    @RequestMapping(value = "403", method = RequestMethod.GET)
    public ModelAndView accessDenied(ModelAndView model, Principal user) {
        model.addObject("title", "Access Denied");

        if (user != null) {
            model.addObject("msg", "Hi " + user.getName()
                    + ", you do not have permission to access this page!");
        } else {
            model.addObject("msg",
                    "You do not have permission to access this page!");
        }
        model.setViewName("/403");
        return model;
    }

    @RequestMapping(value = "404", method = RequestMethod.GET)
    public ModelAndView pageNotFound(ModelAndView model) {
        model.addObject("title", "Page Not Found");

        model.addObject("msg", "The page is unavailable, maybe next time!");

        model.setViewName("/404");
        return model;
    }


}