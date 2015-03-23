package com.davidoladeji.box.controller;

import com.davidoladeji.box.model.Product;
import com.davidoladeji.box.model.Search;
import com.davidoladeji.box.model.Warehouse;
import com.davidoladeji.box.repository.AccountRepository;
import com.davidoladeji.box.repository.ProductRepository;
import com.davidoladeji.box.repository.ProductStockRepository;
import com.davidoladeji.box.repository.WarehouseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Daveola on 3/17/2015.
 */

@Controller
@RequestMapping("/products")
public class HomeProductsController {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductStockRepository productStockRepository;

    @Autowired
    WarehouseRepository warehouseRepository;


    @RequestMapping(value = "/viewDetails/{id}", method = RequestMethod.GET)
    public ModelAndView productView(ModelAndView model, @PathVariable("id") Long id, BindingResult result, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Product Details Page");

        Product product = productRepository.findOne(id);
        model.addObject("product", product);
        List<Warehouse> warehouseList = warehouseRepository.findAll();
        product.setProductStock(productStockRepository.findByProductId(id));


        model.addObject("totalstock", product.getTotalstock());


        model.setViewName("product");
        return model;
    }
}
