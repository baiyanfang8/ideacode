package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    User save(User user);
    List<User> queryAll();
}
