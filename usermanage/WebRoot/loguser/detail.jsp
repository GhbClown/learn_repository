<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	User u = (User) session.getAttribute("loguser");
%>
<%@ page import="com.model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
var webRoot = "<%=request.getContextPath()%>";
var yhName = "<%=u.getYhName()%>";
var yhPass = "<%=u.getYhPass()%>";
</script>
</head>


<body>
	<form id="fa" name="f" method="post" target="main">
		<input type="hidden" id="yhId" name="yhId" value="${user.yhId }">
		<label>用户名：</label><input type="text" id="name" name="yhName"
			value="${user.yhName }"> <label>密码：</label> <input
			type="text" id="pass" name="yhPass" value="${user.yhPass }">

		<label>性别：</label><select id="sex" name="yhSexId">
			<c:forEach items="${sex }" var="sex">
				<option value="${sex.sexId }">${sex.sexName}</option>
			</c:forEach>
		</select> <label>部门：</label><select id="dept" name="yhDeptId">
			<c:forEach items="${dept }" var="dept">
				<option value="${dept.deptId }">${dept.deptName}</option>
			</c:forEach>
		</select> <label><a id="save" href="javascript:save()">保存</a> </label><label><a
			href="<%=request.getContextPath()%>/q.do">返回</a> </label>
	</form>
	<script type="text/javascript">
		window.onload = function() {
			var sexops = document.getElementById("sex");
			var sexid = "${user.sex.sexId}";
			for (var i = 0; i < sexops.options.length; i++) {
				if (sexid == sexops.options[i].value)
					sexops.options[i].selected = 'selected';
			}
			var deptops = document.getElementById("dept");
			var deptid = "${user.dept.deptId}";
			for (var i = 0; i < deptops.options.length; i++) {
				if (deptid == deptops.options[i].value)
					deptops.options[i].selected = 'selected';
			}
		}
		function save() {
			var id = document.getElementById("yhId").value;
			var fa = document.getElementById("fa");
			var name = document.getElementById("name").value;
			var pass = document.getElementById("pass").value;
			if (name != yhName || pass != yhPass) {
				fa.target = "_top";
				fa.action = webRoot + "/logupdate.do";
				fa.submit();
			} else {
				fa.action = webRoot + "/logupdate.do";
				fa.submit();
			}
		}
	</script>
</body>
</html>
