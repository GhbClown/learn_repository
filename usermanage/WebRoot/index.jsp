<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body>
	<form name="logform"
		action="<%=request.getContextPath()%>/login.do" method="post">
		<table>
			<tbody>
				<tr>
					<td>账号：</td>
					<td><input type="text" name="username"></td>
					<td>密码：</td>
					<td><input type="password" name="userpass"></td>
					<td>
						<button type="button" onclick="checkout()">登录</button>
					</td>
					<td>
						<a href="zhuce.jsp">注册</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
<script type="text/javascript">
	function checkout() {
		document.logform.submit();
	}
</script>