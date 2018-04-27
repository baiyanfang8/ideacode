package com.baizhi.dao;

import com.baizhi.entity.User;

import java.util.List;

public interface UserDAO {
    List<User> queryAll();
    void insertUser(User user);
    void deleteUser(String id);
    void updateUser(User user);
    User queryOne(String id);

}
