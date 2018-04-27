package com.baizhi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@Controller
@RequestMapping("/hello")
public class HollerController {
    @RequestMapping("/hello")
    @ResponseBody
    public String Hello(){
        System.out.println("springboot hello");
        return "ok";
    }

}
