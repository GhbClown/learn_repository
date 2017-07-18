<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.model.User"%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
a {
	text-decoration: none;
}

ul,li {
	list-style: none;
	margin: 0, 0, 0, 0;
	padding: 0, 0, 0, 0;
	margin-top: 15;
}
</style>
</head>
<body style="margin:auto;padding: auto">
	<ul style="margin-left: auto;margin-right: auto">
		<li><a href="<%=request.getContextPath()%>/q.do" target="main">主页</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/queryUser.do"
			target="main">用户</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/dept/query.do" target="main">部门</a></li>
	</ul>
</body>
</html>
