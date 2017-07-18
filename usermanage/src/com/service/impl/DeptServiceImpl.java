package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.IDeptMapper;
import com.model.Dept;
import com.model.User;
import com.service.IDeptService;

@Service
@Transactional
public class DeptServiceImpl implements IDeptService {
	IDeptMapper mapper;

	public IDeptMapper getMapper() {
		return mapper;
	}

	@Resource
	public void setMapper(IDeptMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public List<Dept> query() {
		// TODO Auto-generated method stub
		return mapper.query();
	}

	@Override
	public List<User> queryDept(int begin) {
		// TODO Auto-generated method stub
		return mapper.queryDept(begin);
	}

	@Override
	public Dept queryById(int id) {
		// TODO Auto-generated method stub
		return mapper.queryById(id);
	}

	@Override
	public void add(Dept dept) {
		// TODO Auto-generated method stub
		mapper.add(dept);
	}

	@Override
	public void update(Dept dept) {
		// TODO Auto-generated method stub
		mapper.update(dept);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		mapper.deleteById(id);
	}

}
