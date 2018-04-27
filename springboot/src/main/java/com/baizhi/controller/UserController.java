package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userSerivce;
    @RequestMapping("/findAll")
    public String findAll(Model model){

        List<User> users = userSerivce.queryAll();
        model.addAttribute("users",users);
        return "showAllUsers";
    }
    /*同步请求
    Ajax的编程思想
    1.创建xhr XMLHttpRequest
        var xhr;
        webkit内核chrome火狐        true(webkit)false(IE)
        if(window.XMLHttpRequest){
        xhr =new XMLHttpRequest();
        }else{
        xhr=new ActiveXObject("Microsoft.XMLHTTP");

        }

        苹果内置浏览器
       IE内核



    2.发送请求 并传递参数
    3.处理服务器响应，并更新页面

    *
    *
    *
    *
    *
    * */


}
