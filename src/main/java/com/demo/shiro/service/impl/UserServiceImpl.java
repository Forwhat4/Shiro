package com.demo.shiro.service.impl;

import com.demo.shiro.entity.UserEntity;
import com.demo.shiro.repository.UserRepository;
import com.demo.shiro.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;


    @Override
    public UserEntity queryByName(String username) {
        return userRepository.findByName(username);
    }
}
