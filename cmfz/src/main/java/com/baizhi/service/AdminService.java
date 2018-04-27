package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    Admin queryByName(String name, String password);
}
