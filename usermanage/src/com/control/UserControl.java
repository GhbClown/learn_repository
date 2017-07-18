package com.control;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Dept;
import com.model.Sex;
import com.model.User;
import com.service.IDeptService;
import com.service.ISexService;
import com.service.IUserService;

@Controller
@RequestMapping()
public class UserControl {
	@Autowired
	HttpSession session;
	@Autowired
	IUserService userservice;
	@Autowired
	ISexService sexservice;
	@Autowired
	IDeptService deptservice;

	@RequestMapping("/login")
	public String login(String username, String userpass) {
		String page = null;

		User user = userservice.queryLogUser(username, userpass);
		if (user == null)
			page = "index";
		else
			page = "home";
		session.setAttribute("loguser", user);

		return page;
	}

	@RequestMapping("/q")
	public String loguser(ModelMap map) {
		User u = (User) session.getAttribute("loguser");
		User user = userservice.queryLogUserById(u.getYhId());
		map.put("user", user);
		return "main";
	}

	@RequestMapping("/log")
	public String log(String id, ModelMap map) {
		User user = userservice.queryUserById(id);
		List<Sex> sex = sexservice.query();
		List<Dept> dept = deptservice.query();
		map.put("user", user);
		map.put("sex", sex);
		map.put("dept", dept);
		return "/loguser/detail";
	}

	@RequestMapping("/logupdate")
	public String logupdateUser(User user) {
		User u = (User) session.getAttribute("loguser");
		if (user.getYhName() != null && !"".equals(user.getYhName().trim())
				&& !"null".equals(user.getYhName().trim())
				&& user.getYhPass() != null
				&& !"".equals(user.getYhPass().trim())
				&& !"null".equals(user.getYhPass().trim())) {
			if(!user.getYhName().equals(u.getYhName())||!user.getYhPass().equals(u.getYhPass()))
			{
				System.out.println("username"+user.getYhName());
				System.out.println("name"+u.getYhName());
				System.out.println("userpass"+user.getYhPass());
				System.out.println("pass"+u.getYhPass());
				userservice.updateUser(user);
				return "redirect:out.do";
			}
			userservice.updateUser(user);
		} 
		return "redirect:q.do";
	}

	@RequestMapping("/out")
	public String out() {
		session.removeAttribute("loguser");
		return "index";
	}

	@RequestMapping("/queryUser")
	public String queryUser(ModelMap map, String pageNumber) throws Exception {
		User u = (User) session.getAttribute("loguser");
		// 总条数
		List<User> list = userservice.query(u.getYhName());
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
				} else if (Integer.parseInt(pageNumber) > totalPage) {
					count = totalPage;
					begin = (count - 1) * 5;
				} else {
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
		List<User> userlist = userservice.queryUser(begin, u.getYhName());
		map.put("userlist", userlist);
		return "query";
	}

	@RequestMapping("/edit")
	public String queryUserById(String id, ModelMap map) {
		User user = userservice.queryUserById(id);
		List<Sex> sex = sexservice.query();
		List<Dept> dept = deptservice.query();
		map.put("user", user);
		map.put("sex", sex);
		map.put("dept", dept);
		return "detail";
	}

	@RequestMapping("/delete")
	public String deleteUserById(@RequestParam("id") String[] idlist) {
		for (int a = 0; a < idlist.length; a++) {
			String id = idlist[a];
			System.out.println(id + "-----" + a);
			userservice.deleteUserById(id);
		}
		return "redirect:queryUser.do";
	}

	@RequestMapping("/addpage")
	public String addPage(ModelMap map) {
		System.out.println("我在跳转页面");
		List<Sex> sex = sexservice.query();
		List<Dept> dept = deptservice.query();
		map.put("sex", sex);
		map.put("dept", dept);
		return "detail";
	}

	@RequestMapping("/addUser")
	public String addUser(User user) {
		System.out.println("我在添加用户");
		userservice.addUser(user);
		return "redirect:queryUser.do";
	}

	@RequestMapping("/update")
	public String updateUser(User user) {
		System.out.println("我在更改更改用户");
		userservice.updateUser(user);
		return "redirect:queryUser.do";
	}

}
