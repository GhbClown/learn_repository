package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.ISexMapper;
import com.model.Sex;
import com.service.ISexService;

@Service
@Transactional
public class SexServiceImpl implements ISexService {
	ISexMapper mapper;

	public ISexMapper getMapper() {
		return mapper;
	}

	@Resource
	public void setMapper(ISexMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public List<Sex> query() {
		// TODO Auto-generated method stub
		return mapper.query();
	}

}
