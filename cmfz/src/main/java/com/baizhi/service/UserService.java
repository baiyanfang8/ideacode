package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    List<User> queryAll();
    void insertUser(User user);
    void deleteUser(String id);
    void updateUser(User user);
    User queryOne(String id);
}
