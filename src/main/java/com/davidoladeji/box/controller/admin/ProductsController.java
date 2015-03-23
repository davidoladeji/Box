package com.davidoladeji.box.controller.admin;

import com.davidoladeji.box.model.Product;
import com.davidoladeji.box.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by Daveola on 3/17/2015.
 */

@Controller
@RequestMapping("/admin")
public class ProductsController {

    @Autowired
    ProductRepository productRepository;


    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView adminProductsPage(ModelAndView model) {
        model.addObject("title", "Products Page");

        List<Product> productList = productRepository.findAll();
        model.addObject("productsList", productList);

        model.setViewName("admin/products");
        return model;
    }


    @RequestMapping(value = "/addProduct", method = RequestMethod.GET)
    public ModelAndView adminAddProductPage(ModelAndView model, @ModelAttribute("product") Product product) {
        model.addObject("title", "Products Page");


        model.setViewName("admin/addProduct");
        return model;
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public ModelAndView adminAddProductPost(ModelAndView model, @ModelAttribute("product") Product product, BindingResult result, final RedirectAttributes redirectAttributes) {
        model.addObject("title", "Products Page");

        productRepository.save(product);
        model.setViewName("redirect:/admin/products");
        return model;
    }


    @RequestMapping(value = "/editProduct/{id}", method = RequestMethod.GET)
    public ModelAndView adminEditProductPage(ModelAndView model, @PathVariable("id") Long id, BindingResult result) {
        model.addObject("title", "Products Page");
        model.setViewName("admin/editProduct");
        model.addObject("product", productRepository.findOne(id));
        return model;
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.POST)
    public ModelAndView adminEditProductPost(ModelAndView model, @RequestParam Product product, @RequestParam Long id, final RedirectAttributes redirectAttributes, BindingResult result) {
        model.addObject("title", "Products Page");

        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("product", productRepository.findOne(id));
            model.setViewName("redirect:/admin/editProduct");
        } else {

            if (product.getId() == null && productRepository.findOne(id) != null) {
                product = productRepository.findOne(id);
            }
            productRepository.save(product);
            model.setViewName("redirect:/admin/products");

        }
        return model;
    }

    @RequestMapping(value = "/deleteProduct/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public String adminDeleteProduct(ModelAndView model, @PathVariable("id") Long id) {
        model.addObject("title", "Products Page");

        productRepository.delete(productRepository.findOne(id));
        return "redirect:/admin/products";
    }

}
