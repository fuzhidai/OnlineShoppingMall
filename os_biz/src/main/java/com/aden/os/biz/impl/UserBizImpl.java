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
    private List<User> cache;

    public void add(User user) {

        Date date = new Date();
        user.setCreateTime(date);
        user.setLastLogin(date);
        user.setStatus("normal");
        user.setPermission(1);

        userDao.insert(user);
    }

    public void edit(User user) {
        userDao.update(user);
    }

    public void changePassword(String phone, String password) {
        User user = userDao.selectByPhone(phone);
        user.setPassword(password);
        userDao.update(user);
    }

    public void changeStatus(Integer id, String status) {
        User user = getDetailFromCache(id);

        user.setStatus(status);
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
        User user = getDetailFromCache(id);
        if (user == null){
            userDao.select(id);
        }
        return user;
    }

    public User getDetailFromCache(Integer id) {

        if (cache == null){
            getAll();
        }

        for (User user : cache) {
            if (user.getId() == id.intValue()) {
                return user;
            }
        }
        return null;
    }

    public List<User> getByIdentity(String identity) {
        List<User> userList;
        if ("member".equals(identity)){
            userList = getAll();
        }else{
            userList = userDao.selectByPermissionHigher(1);
        }
        return userList;
    }

    public List<User> getAll() {
        cache = userDao.selectAll();
        return cache;
    }


}
