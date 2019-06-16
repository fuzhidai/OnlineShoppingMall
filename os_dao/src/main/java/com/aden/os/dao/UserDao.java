package com.aden.os.dao;

import com.aden.os.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    void insert(User user);

    void update(User user);

    void delete(Integer id);

    User select(Integer id);

    String selectName(Integer id);

    User selectByPhone(String phone);

    List<User> selectByPermissionHigher(Integer id);

    List<User> selectAll();
}
