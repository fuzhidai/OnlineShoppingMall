package com.aden.os.biz;

import com.aden.os.entity.User;

import java.util.List;

public interface UserBiz {

    void add(User user);

    void edit(User user);

    void changePassword(String phone, String password);

    void changeStatus(Integer id, String status);

    User verifyInfo(String phone, String password);

    void remove(Integer id);

    User get(Integer id);

    User getDetailFromCache(Integer id);

    List<User> getAll();
}
