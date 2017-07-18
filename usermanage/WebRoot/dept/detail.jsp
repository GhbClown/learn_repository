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
<div align="center" style="margin-top: 50px;">
	<form name="f" method="post">
		<table>
			<tbody>
				<tr>
					<td><input type="hidden" id="yhId" name="deptId" value="${dept.deptId }">
					</td>
				</tr>
				<tr>
					<td>部门名称：</td>
					<td>
					<input type="text" name="deptName" value="${dept.deptName }">
					</td>
				</tr>
				<tr>
					<td>部门信息：</td>
					<td>
					<input type="text" name="deptInfo" value="${dept.deptInfo }">
						</td>
				</tr>
				<tr>
					<td><a href="javascript:save()">保存</a></td>
					<td>
							<a href="<%=request.getContextPath()%>/dept/query.do">返回</a>
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
document.f.action="<%=request.getContextPath()%>/dept/add.do";
document.f.submit();
}else
{
document.f.action="<%=request.getContextPath()%>/dept/update.do";
document.f.submit();
}
}
</script>