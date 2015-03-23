package com.davidoladeji.box.controller.admin;

import com.davidoladeji.box.model.Distances;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

/**
 * Created by Daveola on 3/20/2015.
 */


@Controller
public class RESTController {


    @RequestMapping(value = "/distance/{townone}/{towntwo}")
    public
    @ResponseBody
    Distances calcDistance(@PathVariable("townone") String townone, @PathVariable("towntwo") String towntwo) {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:9000/calcdistance?dept={townone}&dest={towntwo}";
        Distances distances = restTemplate.getForObject(url, Distances.class, townone, towntwo);
        System.out.print(distances.toString());
        return distances;
    }


}
