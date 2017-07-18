<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
a{
	display:inline-table ;
}
</style>
</head>
<%
	User u = (User) session.getAttribute("loguser");
%>
<body>
	当前用户：
	<a href="geren.jsp" target="main"><%=u.getYhName()%></a>
	<a id="a" onclick="exit()">退出</a>
</body>
</html>
<script type="text/javascript">
	function exit() {
		var r = confirm("是否退出");
		if(r){
		document.getElementById("a").target="_top";
		document.getElementById("a").href="<%=request.getContextPath()%>/out.do";
		}
	}
</script>