<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>

<body>

<div align="center" style="width:auto;padding-top: 30px">
<form name="f" method="post">
		<table>
			<tbody>
				<tr>
					<td><input type="hidden" id="yhId" name="yhId" value="${user.yhId }">
					</td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="yhName" value="${user.yhName }">
					</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="text" name="yhPass"
						value="${user.yhPass }"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><select id="sex" name="yhSexId">
							<c:forEach items="${sex }" var="sex">
								<option value="${sex.sexId }">${sex.sexName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>部门：</td>
					<td><select id="dept" name="yhDeptId">
							<c:forEach items="${dept }" var="dept">
								<option value="${dept.deptId }">${dept.deptName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><a href="javascript:save()">保存</a></td>
					<td>
							<a href="<%=request.getContextPath()%>/queryUser.do">返回</a>
					</td>
				</tr>
			</tbody>
		</table>
		
	</form>
	</div>
</body>
</html>
<script type="text/javascript">
window.onload = function() {
	var sexops = document.getElementById("sex");
	var sexid = "${user.sex.sexId}";
	for ( var i = 0; i < sexops.options.length; i++) {
		if (sexid == sexops.options[i].value) 
			sexops.options[i].selected = 'selected';
	}
	var deptops = document.getElementById("dept");
	var deptid = "${user.dept.deptId}";
	for ( var i = 0; i < deptops.options.length; i++) {
		if (deptid == deptops.options[i].value) 
			deptops.options[i].selected = 'selected';
	}
}
function save(){
var id = document.getElementById("yhId").value;
if(id==""){
document.f.action="<%=request.getContextPath()%>/addUser.do";
document.f.submit();
}else
{
document.f.action="<%=request.getContextPath()%>/update.do";
document.f.submit();
}
}
</script>