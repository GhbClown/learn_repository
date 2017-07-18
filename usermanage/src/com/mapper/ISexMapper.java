package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import com.model.Sex;
@Component
public interface ISexMapper {
	@Select("select * from code_sex")
	@ResultMap("sex")
	List<Sex> query();

}
