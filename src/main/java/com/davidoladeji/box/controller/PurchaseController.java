package com.davidoladeji.box.controller;

import com.davidoladeji.box.model.*;
import com.davidoladeji.box.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by Daveola on 3/17/2015.
 *
 * This provides users with the cart and shopping
 * possibilities for the whole experience.
 */

@Controller
@RequestMapping("/")
public class PurchaseController {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TransferRepository transferRepository;


    @Autowired
    TransferStatusRepository transferStatusRepository;

    @Autowired
    WarehouseRepository warehouseRepository;

    @Autowired
    ProductStockRepository productStockRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderitemRepository orderIemRepository;



    /**
     * This is the cart page view
     * @param model
     * @param search
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "cart", method = RequestMethod.GET)
    public ModelAndView cartPage(ModelAndView model, @ModelAttribute("productsearch") Search search, BindingResult bindingResult) {
        model.addObject("title", "Cart");
        model.addObject("breadcrumb", "Cart");

        List<Warehouse> warehousesList = warehouseRepository.findAll();
        model.addObject("warehousesList", warehousesList);
        model.setViewName("cart");
        return model;
    }


    /**
     * Adds a product to the cart and redirects to the current page
     * @param productId
     * @param cart
     * @param result
     * @param quantity
     * @param session
     * @param search
     * @param request
     * @return
     */

    @RequestMapping(value = "cart/add/{productId}", method = RequestMethod.GET)
    public String addToCart(@PathVariable("productId") Long productId, @ModelAttribute("cart") Cart cart, BindingResult result,
                            @RequestParam(value = "quantity", defaultValue = "1") int quantity,
                            HttpSession session,
                            @ModelAttribute("productsearch") Search search,
                            HttpServletRequest request) {


        Cart currentCart = (Cart) session.getAttribute("cart");
        if (currentCart == null || currentCart.getOrderItems() == null || currentCart.getOrderItems().isEmpty()) {
            currentCart = new Cart();
            Orders order = new Orders();
            //Long orderId = order.getId();
            Product product = productRepository.findOne(productId);
            Orderitem item = new Orderitem(order, productRepository.findOne(productId).getSalesPrice(), quantity, product.getId());
            item.setProduct(product);
            currentCart.addtOrderItems(item);
            session.setAttribute("cart", currentCart);
        } else {

            Orders order = new Orders();
            //Long orderId = order.getId();
            Product product = productRepository.findOne(productId);

            Orderitem item = new Orderitem(order, productRepository.findOne(productId).getSalesPrice(), quantity, product.getId());
            item.setProduct(product);
            currentCart.addtOrderItems(item);
            session.setAttribute("cart", currentCart);
        }



        String prevView = request.getHeader("Referer");
        return "redirect:" + prevView;
    }


    /**
     * Allos for updating the cart (quantity) needed of a product
     * @param model
     * @param cart
     * @param result
     * @param productId
     * @param quantity
     * @param action
     * @param session
     * @param search
     * @return
     */
    @RequestMapping(value = "cart/update", method = RequestMethod.POST)
    public ModelAndView updateCart(ModelAndView model, @ModelAttribute("cart") Cart cart, BindingResult result,
                                   @RequestParam("productId") Long productId,
                                   @RequestParam("quantity") int quantity,
                                   @RequestParam("action") String action,
                                   @RequestParam(value = "warehouseId") Long warehouseId,
                                   HttpSession session,
                                   @ModelAttribute("productsearch") Search search) {

        List<Warehouse> warehousesList = warehouseRepository.findAll();
        model.addObject("warehousesList", warehousesList);

        model.addObject("title", "orders Page");
        Cart currentCart = (Cart) session.getAttribute("cart");
        currentCart.setWarehouseId(warehouseId);
        if ("update".equals(action)) {

            for (Orderitem item : currentCart.getOrderItems()) {
                if (item.getProductId() == productId) {
                    item.setQuantity(quantity);
                }
            }

        } else {
            List<Orderitem> oldItem = currentCart.getOrderItems();
            currentCart.resetOrderItemList();
            for (Orderitem item : oldItem) {
                if (item.getProductId() != productId) {
                    currentCart.addtOrderItems(item);
                }
            }

        }



        model.setViewName("cart");
        return model;
    }



    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public ModelAndView checkOut(ModelAndView model, HttpSession session
            , @ModelAttribute("productsearch") Search search) {



        /**
         * Since this is the first page a logged in user hits as determined from spring security
         * dispatch.
         * Determine who the current user is via authentication details
         */
        Authentication auth = SecurityContextHolder.getContext()
                .getAuthentication();

        UserDetails userDetail = (UserDetails) auth.getPrincipal();


        String username = userDetail.getUsername();






        /**
         * Start the Actual Checkout process
         */

        int choosenWarehouseStock = 0;

        // get the cart item information
        Cart currentCart = (Cart) session.getAttribute("cart");
        if (currentCart == null) {
            //if null just goto home page
            //TODO add message to say cart is null
            model.setViewName("index");


        } else {


            //Long warehouseId = new Long(1);


            Orders order = new Orders();

            order.setOrderDate(new Timestamp(new Date().getTime()));

            order.setPrice(currentCart.getTotal());

            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");

            System.out.println(currentCart.getWarehouseId());
            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");
            System.out.println("---------------------------------------------------------");

            order.setWarehouse(warehouseRepository.findOne(currentCart.getWarehouseId()));



            //Set the desired warehouse



            order.setOrderStatus(1);

            order.setAccount(accountRepository.findByUsername(username));

            orderRepository.saveAndFlush(order);






            for (Orderitem item : currentCart.getOrderItems()) {
                List<ProductStock> productStock = productStockRepository.findByProductIdAndWarehouse_Id(item.getProductId(),
                        order.getWarehouse().getId());
                int qty = item.getQuantity();
                // TODO add transfer status based on avaialbility at warehouse chosen
                //First get the ware house
                Warehouse choosenWarehouse = warehouseRepository.findOne(order.getWarehouse().getId());



               int count = 0;

                //TODO get Item stock at specific warehouse
                if(productStock.size() == 0){
                    //If the productSock List is empty

                }else if(productStock.size() > 0){
                    //Ensure the productSock List is not empty
                    while(productStock.listIterator().hasNext() && productStock.size() < count){


                        Warehouse warehouseInLoop =  productStock.listIterator().next().getWarehouse();
                        if (warehouseInLoop.equals(choosenWarehouse)){
                             choosenWarehouseStock = productStock.listIterator().next().getStock();
                        }

                        count++;

                    }
                }


                //Set the Transfer Id

                //Loop through Items to set their transfer needs

                List<TransferStatus> transferStatusList = transferStatusRepository.findAll();

                    if (qty <= choosenWarehouseStock) {
                        // we have enough stock, we are good.
                        //Set to "Transfer not Necessary"
                        item.setTransferRequirement(transferStatusList.get(3).getId());

                    } else if (qty >= choosenWarehouseStock){
                        // we need staff attention,
                        //Set to "Needs Transfer"
                        item.setTransferRequirement(transferStatusList.get(1).getId());
                        

                    }else {

                        item.setTransferRequirement(transferStatusList.get(3).getId());
                    }


                item.setOrders(order);

            }
            orderIemRepository.save(currentCart.getOrderItems());

            order.setOrderItem(currentCart.getOrderItems());

            order.setAccount(accountRepository.findByUsername(username));

            orderRepository.saveAndFlush(order);






            // 4. save Orders
        // TODO: Move the date timestamp to the server side instead of JSP

            model.setViewName("successPage");
        }
        session.removeAttribute("cart");

        return model;
    }

}
