package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;
import com.model.User;

@Component
public interface IUserMapper {
	@Select("select * from yonghu " +
			" left join code_sex on code_sex.sex_id = yonghu.sex_id" +
			" left join code_dept on code_dept.dept_id = yonghu.dept_id" +
			" where yonghu.yh_name=#{username} and yonghu.yh_pass=#{userpass}")
	@ResultMap("yh")
	User queryLogUser(@Param("username") String username,
			@Param("userpass") String userpass);

	@Select("select * from yonghu "
			+ "left join code_sex on code_sex.sex_id=yonghu.sex_id "
			+ "left join code_dept on code_dept.dept_id=yonghu.dept_id "
			+ "where yh_name != #{name} "
			+ "order by yonghu.yh_id limit #{begin},5 ")
	@ResultMap("yh")
	List<User> queryUser(@Param("begin") int begin,@Param("name") String name);

	@Select("select * from yonghu where yh_name != #{name}")
	@ResultMap("yh")
	List<User> query(@Param("name") String name);

	@Select("select * from yonghu left join code_sex on code_sex.sex_id=yonghu.sex_id left join code_dept on code_dept.dept_id=yonghu.dept_id where yh_id=#{id}")
	@ResultMap("yh")
	User queryUserById(@Param("id") String id);

	@Update("update yonghu set yh_name=#{yhName},yh_pass=#{yhPass},sex_id=#{yhSexId},dept_id=#{yhDeptId} where yh_id=#{yhId}")
	void updateUser(User user);

	@Delete("delete from yonghu where yh_id= #{id}")
	@ResultMap("yh")
	void deleteUserById(@Param("id") String id);

	@Insert("insert into yonghu (yh_name,yh_pass,sex_id,dept_id) values (#{yhName},#{yhPass},#{yhSexId},#{yhDeptId})")
	@ResultMap("yh")
	void addUser(User user);
	@Select("select * from yonghu " +
			" left join code_sex on code_sex.sex_id = yonghu.sex_id" +
			" left join code_dept on code_dept.dept_id = yonghu.dept_id" +
			" where yonghu.yh_id=#{yhId}")
	@ResultMap("yh")
	User queryLogUserById(@Param("yhId")String yhId);

}
