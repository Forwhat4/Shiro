package com.demo.shiro.service;

import com.demo.shiro.entity.UserEntity;

public interface UserService {

    UserEntity queryByName(String username);
}
