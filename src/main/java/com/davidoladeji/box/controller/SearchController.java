package com.davidoladeji.box.controller;

import com.davidoladeji.box.model.Product;
import com.davidoladeji.box.model.Search;
import com.davidoladeji.box.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Daveola on 3/17/2015.
 *
 * Provides search functionality
 *
 * Can be Improved to use criteria function and more
 */

@Controller
@RequestMapping("/")
public class SearchController {


    @Autowired
    ProductRepository productRepository;


    @RequestMapping(value = "search", method = RequestMethod.GET)
    public ModelAndView searchProducts(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult result, @RequestParam("searchterm") String searchterm) {
        model.addObject("title", "Search page!");
        model.addObject("breadcrumb", "Search Result ");

        List<Product> searchProductsList = productRepository.findByName(searchterm);

        model.setViewName("searchresult");
        return new ModelAndView("searchresult", "searchProductsList", searchProductsList);
    }


    @RequestMapping(value = "searchresult", method = RequestMethod.GET)
    public
    @ResponseBody
    ModelAndView searchResult(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult result) {


        model.setViewName("searchresult");
        return model;
    }
}
