package com.aden.os.biz.impl;

import com.aden.os.biz.UserBiz;
import com.aden.os.dao.UserDao;
import com.aden.os.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("userBiz")
public class UserBizImpl implements UserBiz {

    @Autowired
    private UserDao userDao;

    public void add(User user) {

        Date date = new Date();
        user.setCreateTime(date);
        user.setLastLogin(date);
        user.setStatus("normal");

        userDao.insert(user);
    }

    public void edit(User user) {
        userDao.update(user);
    }

    public User verifyInfo(String phone, String password) {
        User user = userDao.selectByPhone(phone);
        if (user != null && password.equals(user.getPassword())){
            user.setLastLogin(new Date());
            userDao.update(user);
            return user;
        }
        return null;
    }

    public void remove(Integer id) {
        userDao.delete(id);
    }

    public User get(Integer id) {
        return userDao.select(id);
    }

    public List<User> getAll() {
        return userDao.selectAll();
    }


}
