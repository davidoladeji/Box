package com.davidoladeji.box.controller.admin;

import com.davidoladeji.box.repository.AccountRepository;
import com.davidoladeji.box.repository.GenderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

/**
 * Created by Daveola on 3/21/2015.
 */

@Controller
@RequestMapping("/admin")
public class MiscControllers {


    @Autowired
    AccountRepository accountRepository;

    @Autowired
    GenderRepository genderRepository;


    @RequestMapping(value = {"customers"}, method = RequestMethod.GET)
    public ModelAndView viewCustomers(ModelAndView model, Principal user) {
        model.addObject("title", "Customers");

        model.addObject("username", user.getName());

        model.addObject("genderList", genderRepository.findAll());
        model.addObject("customersList", accountRepository.findByRoleId(2));
        model.setViewName("admin/customers");
        return model;
    }

}
