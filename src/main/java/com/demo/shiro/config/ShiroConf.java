package com.demo.shiro.config;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConf {

    @Bean
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager){

        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        //必须设置SecurityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager);


        Map<String,String> filterChainDefinitionMap = new LinkedHashMap<>();
        //配置退出过滤器，其中具体的退出代码shiro已经实现
        filterChainDefinitionMap.put("/logout","logout");

        /**
         * 过滤链定义，从上向下顺序执行，一般将“/**”放在最下边（！！！坑，一不小心代码就不好使了）
         * authc:所有的URL都必须通过认证才可以访问；anon：所有的URL都可以匿名访问
         */
        filterChainDefinitionMap.put("/**","authc");

        //不设置默认会自动寻找web工程根目录下的“/login.jsp”
        shiroFilterFactoryBean.setLoginUrl("/login");
        //登录成功后跳转的页面
        shiroFilterFactoryBean.setSuccessUrl("/index");
        //未授权页面
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);


        return shiroFilterFactoryBean;
    }

    public SecurityManager securityManager(){

        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();

        return securityManager;
    }
}
