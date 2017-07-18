package com.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import com.model.Dept;
import com.model.User;

@Component
public interface IDeptMapper {
	@Select("select * from code_dept")
	@ResultMap("dept")
	List<Dept> query();

	@Select("select * from code_dept order by code_dept.dept_id limit #{begin},5")
	@ResultMap("dept")
	List<User> queryDept(@Param("begin") int begin);

	@Select("select * from code_dept where dept_id=#{id}")
	@ResultMap("dept")
	Dept queryById(@Param("id") int id);

	@Insert("insert into code_dept (dept_name,dept_info) value (#{deptName},#{deptInfo})")
	void add(Dept dept);

	@Update("update code_dept set dept_name=#{deptName},dept_info=#{deptInfo} where dept_id=#{deptId}")
	void update(Dept dept);

	@Delete("delete from  code_dept where dept_id=#{id}")
	void deleteById(@Param("id")int id);
}
