package com.aden.os.biz;

import com.aden.os.entity.User;

import java.util.List;

public interface UserBiz {

    // 添加用户
    void add(User user);

    // 修改用户信息
    void edit(User user);

    // 修改密码
    void changePassword(String phone, String password);

    // 修改状态
    void changeStatus(Integer id, String status);

    // 修改个人信息
    User verifyInfo(String phone, String password);

    // 删除用户
    void remove(Integer id);

    // 通过用户编号获取用户信息
    User get(Integer id);

    // 通过用户编号从缓存中获取用户信息
    User getDetailFromCache(Integer id);

    // 通过认证获取用户列表
    List<User> getByIdentity(String identity);

    // 获取所有用户列表
    List<User> getAll();
}
