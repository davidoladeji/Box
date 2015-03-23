package com.davidoladeji.box.controller;

import com.davidoladeji.box.model.Account;
import com.davidoladeji.box.model.Search;
import com.davidoladeji.box.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by Daveola on 3/23/2015.
 */


@Controller
public class AuthenticateController {

    @Autowired
    AccountRepository accountRepository;



    /**
     * This is the default view since all users need to be authenticated
     * @param model
     * @param search
     * @param bindingResult
     * @return
     */

    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public ModelAndView loginPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Login");
        model.addObject("breadcrumb", "Login");


        model.setViewName("login");
        return model;
    }


    /**
     * The page displayed when a user logs out
     * @param model
     * @param search
     * @param result
     * @return
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public ModelAndView logoutPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult result) {
        model.addObject("title", "Logout");
        model.addObject("breadcrumb", "Logged out");

        model.setViewName("logout");
        return model;
    }


    /**
     * This is the customer registration view
     * all other users can only be created via the admin
     *
     * @param model
     * @param account
     * @param search
     * @param result
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public ModelAndView registerPage(ModelAndView model, @ModelAttribute("account") Account account, @ModelAttribute("productsearch") Search search, BindingResult result) {
        model.addObject("title", "Register");
        model.addObject("breadcrumb", "Register");

        model.setViewName("register");
        return model;
    }


    /**
     * This is the customer registration action
     * @param model
     * @param account
     * @param result
     * @param redirectAttributes
     * @return
     */
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

}
