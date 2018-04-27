package com.baizhi.service;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entity.Admin;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDAO adminDAO;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Admin queryByName(String name, String password) {
       Admin admin=adminDAO.queryByName(name);
       if(admin==null)throw new RuntimeException("对不起此用户不存在");
           if(!password.equals(admin.getPassword()))throw new RuntimeException("对不起输入有误，请重新输入");

        return null;
    }
}
