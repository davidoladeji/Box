package com.davidoladeji.box.controller;


import com.davidoladeji.box.model.*;
import com.davidoladeji.box.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
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
@SessionAttributes({"loggedInUser"})
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




            /**
             * Since this is the first page a logged in user hits as determined from spring security
             * dispatch.
             * Determine who the current user is via authentication details
             */

            Authentication auth = SecurityContextHolder.getContext()
                    .getAuthentication();
            String username = "anonymous";

            if (!(auth instanceof AnonymousAuthenticationToken)) {
                UserDetails userDetail = (UserDetails) auth.getPrincipal();
                username = userDetail.getUsername();
            }


                Account loggedInUser = accountRepository.findByUsername(username);
                model.addObject("loggedInUser", loggedInUser);




        /**
         * add a search entity to the view
         */

        model.addObject("productsearch", search);


        /**
         * Find products marked as featured and
         *add to a list send to the Slider for display
         *
         */

        List<Product> featuredProductsList = productRepository.findByFeatured(true);

        model.addObject("featuredProductsList", featuredProductsList);


        /**
         * Pass along list of all products available to display latest products and featured products
         * At bottom of index page
         */
        List<Product> productsList = productRepository.findAll();
        model.addObject("productsList", productsList);


        model.setViewName("index");
        return model;
    }



    /**
     * This is the view where users can check their account details
     * and also goto tracking page
     * @param model
     * @param search
     * @param bindingResult
     * @return
     */

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public ModelAndView accountProfilePage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Profile");
        model.addObject("breadcrumb", "Profile");


        model.setViewName("profile");
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