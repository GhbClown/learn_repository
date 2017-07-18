package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.IUserMapper;
import com.model.User;
import com.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
	IUserMapper usermapper;

	public IUserMapper getUsermapper() {
		return usermapper;
	}

	@Resource
	public void setUsermapper(IUserMapper usermapper) {
		this.usermapper = usermapper;
	}

	@Override
	public User queryLogUser(String username, String userpass) {
		return usermapper.queryLogUser(username, userpass);
	}

	@Override
	public List<User> queryUser(int begin,String name) {
		return usermapper.queryUser(begin,name);
	}

	@Override
	public User queryUserById(String id) {
		return usermapper.queryUserById(id);
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		usermapper.updateUser(user);
	}

	@Override
	public void deleteUserById(String id) {
		// TODO Auto-generated method stub
		System.out.println(id+"---------impl");
		usermapper.deleteUserById(id);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		usermapper.addUser(user);
	}

	@Override
	public List<User> query(String name) {
		// TODO Auto-generated method stub
		return usermapper.query(name);
	}

	@Override
	public User queryLogUserById(String yhId) {
		// TODO Auto-generated method stub
		return usermapper.queryLogUserById(yhId);
	}


}
