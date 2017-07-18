package com.service;

import java.util.List;

import com.model.Dept;
import com.model.User;

public interface IDeptService {

	List<Dept> query();

	List<User> queryDept(int begin);

	Dept queryById(int i);

	void add(Dept dept);

	void update(Dept dept);

	void deleteById(int id);

}
