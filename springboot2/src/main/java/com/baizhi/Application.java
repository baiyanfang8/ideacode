package com.baizhi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication //用来修饰类 标志着这个类是一个入口类
public class Application {
    public static void main(String[] args){
        SpringApplication.run(Application.class,args);
    }

}
