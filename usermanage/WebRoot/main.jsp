<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.model.User"%>
<%@ page import="com.model.Dept"%>
<%@ page import="com.model.Sex"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<%
	User u = (User) session.getAttribute("loguser");
	Dept d = u.getDept();
	Sex s = u.getSex();
%>
<body>
<div align="center" style="width:auto;padding-top: 30px">
<table>
<tr>
	<td>用户名：</td>
	<td>${user.yhName}</td>
</tr>
<tr>
	<td>用户密码：</td>
	<td>${user.yhPass}</td>
</tr>
<tr>
	<td>性别：</td>
	<td>${user.sex.sexName }</td>
</tr>
<tr>
	<td>所在部门：</td>
	<td>${user.dept.deptName }</td>
</tr>
</table>
<a href="<%=request.getContextPath() %>/log.do?id=<%=u.getYhId() %>" target="main">修改个人信息</a>
</div>
</body>
</html>
