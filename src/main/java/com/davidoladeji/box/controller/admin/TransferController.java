package com.davidoladeji.box.controller.admin;

import com.davidoladeji.box.model.Orderitem;
import com.davidoladeji.box.model.Transfer;
import com.davidoladeji.box.model.TransferStatus;
import com.davidoladeji.box.repository.AccountRepository;
import com.davidoladeji.box.repository.OrderitemRepository;
import com.davidoladeji.box.repository.TransferRepository;
import com.davidoladeji.box.repository.TransferStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Daveola on 3/17/2015.
 */

@Controller
@RequestMapping("/admin")
public class TransferController {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    TransferRepository transferRepository;


    @Autowired
    OrderitemRepository orderitemRepository;

    @Autowired
    TransferStatusRepository transferStatusRepository;

    @RequestMapping(value = "/transfers", method = RequestMethod.GET)
    public ModelAndView adminTransfersPage(ModelAndView model) {
        model.addObject("title", "Transfers Page");

        List<Transfer> transferList = transferRepository.findAll();
        model.addObject("transferList", transferList);

        List<TransferStatus> transferStatusList = transferStatusRepository.findAll();
        model.addObject("transferStatusList", transferStatusList);

        model.setViewName("admin/transfers");
        return model;
    }

    @RequestMapping(value = "/addTransfer", method = RequestMethod.GET)
    public ModelAndView adminAddTransferPage(ModelAndView model) {
        model.addObject("title", "Transfers Page");

        List<Transfer> transferList = transferRepository.findAll();
        model.addObject("transferList", transferList);

        model.setViewName("/admin/addTransfer");
        return model;
    }

    @RequestMapping(value = "/addTransfer", method = RequestMethod.POST)
    public ModelAndView adminAddTransferPost(ModelAndView model) {
        model.addObject("title", "Transfers Page");

        List<Transfer> transferList = transferRepository.findAll();
        model.addObject("transferList", transferList);

        model.setViewName("/admin/transfers");
        return model;
    }

    @RequestMapping(value = "/pendingTransfers", method = RequestMethod.GET)
    public ModelAndView adminPendingTransfers(ModelAndView model) {
        model.addObject("title", "Transfers Page");


        List<TransferStatus> transferStatusList = transferStatusRepository.findAll();

        List<Orderitem> orderitemPendingList = orderitemRepository.findByTransferRequirement(Long.parseLong("2"));
        model.addObject("orderitemPendingList", orderitemPendingList);

        model.setViewName("/admin/transfersPending");
        return model;
    }



    @RequestMapping(value = "/viewRoutes", method = RequestMethod.GET)
    public ModelAndView viewRoutes(ModelAndView model) {
        model.addObject("title", "Transfers Page");

        List<Transfer> transferList = transferRepository.findAll();
        model.addObject("transferList", transferList);

        model.setViewName("/admin/allroutes");
        return model;
    }
}
