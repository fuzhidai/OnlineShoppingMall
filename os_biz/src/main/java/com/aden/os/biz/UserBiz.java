package com.aden.os.biz;

import com.aden.os.entity.User;

import java.util.List;

public interface UserBiz {

    void add(User user);

    void edit(User user);

    User verifyInfo(String phone, String password);

    void remove(Integer id);

    User get(Integer id);

    List<User> getAll();
}
