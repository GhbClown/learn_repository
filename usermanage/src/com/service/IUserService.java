package com.service;

import java.util.List;

import com.model.User;

public interface IUserService {

	User queryLogUser(String username, String userpass);

	List<User> queryUser(int begin,String name);

	User queryUserById(String id);

	void updateUser(User user);

	void deleteUserById(String id);

	void addUser(User user);

	List<User> query(String name);

	User queryLogUserById(String yhId);

}
