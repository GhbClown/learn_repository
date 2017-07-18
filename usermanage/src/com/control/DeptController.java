package com.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Dept;
import com.model.User;
import com.service.IDeptService;

@Controller
@RequestMapping("/dept")
public class DeptController {
	@Autowired
	IDeptService deptservice;

	@RequestMapping("/query")
	public String query(ModelMap map, String pageNumber) {
		System.out.println(pageNumber);
		// 总条数
		List<Dept> list = deptservice.query();
		int total = list.size();
		map.put("total", total);
		// 总页数
		int totalPage = total % 5 == 0 ? total / 5 : total / 5 + 1;
		if (totalPage == 0) {
			totalPage = 1;
		}
		map.put("totalPage", totalPage);
		int begin;// 查询开始
		int count;// 当前页
		if (pageNumber != null && !"".equals(pageNumber.trim())
				&& !"null".equals(pageNumber.trim())) {
			try {
				if (Integer.parseInt(pageNumber) <= totalPage
						&& Integer.parseInt(pageNumber) > 0) {
					count = Integer.parseInt(pageNumber);
					begin = (count - 1) * 5;
				} else if(Integer.parseInt(pageNumber)>totalPage){
					count = totalPage;
					begin = (count - 1) * 5;
				}else {
					begin = 0;
					count = 1;
				}
			} catch (NumberFormatException ne) {
				ne.printStackTrace();
				begin = 0;
				count = 1;
			}
		} else {
			begin = 0;
			count = 1;
		}
		map.put("count", count);
		List<User> alist = deptservice.queryDept(begin);
		map.put("list", alist);
		return "/dept/query";
	}

	@RequestMapping("/detail")
	public String detail(String id, ModelMap map) {
		if (id != null && !"".equals(id.trim()) && !"null".equals(id.trim())) {
			try {
				Dept dept = deptservice.queryById(Integer.parseInt(id));
				map.put("dept", dept);
			} catch (NumberFormatException ne) {
				ne.printStackTrace();
			}
		}
		return "/dept/detail";
	}
	
	@RequestMapping("/add")
	public String add(Dept dept){
		deptservice.add(dept);
		return "redirect:query.do";
	}
	@RequestMapping("/update")
	public String update(Dept dept){
		deptservice.update(dept);
		return "redirect:query.do";
	}
	@RequestMapping("/delete")
	public String deleteUserById(@RequestParam("id") String[] idlist) {
		
		try {
			for (int a = 0; a < idlist.length; a++) {
				int id = Integer.parseInt(idlist[a]);
				deptservice.deleteById(id);
			}
		} catch (NumberFormatException ne) {
			ne.printStackTrace();
		}
		return "redirect:query.do";
	}
}
