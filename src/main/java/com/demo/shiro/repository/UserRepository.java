package com.demo.shiro.repository;

import com.demo.shiro.entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<UserEntity,Long>{

    public UserEntity findByName(String username);
}
