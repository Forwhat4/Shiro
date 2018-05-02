package com.demo.shiro.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue
    private Integer id;

    private String name;

    private String password;

    private String salt; //加密密码的盐

    private Integer tate;


}
