package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {
   @Resource
   private UserDAO userDAO;

    @Override
    public List<User> queryAll() {
        return userDAO.queryAll();
    }

    @Override
    public void insertUser(User user) {
        user.setId(UUID.randomUUID().toString().replace("-"," "));
    }

    @Override
    public void deleteUser(String id) {

    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public User queryOne(String id) {
        return null;
    }
}
