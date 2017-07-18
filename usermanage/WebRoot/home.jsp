 <%@ page import="com.model.User"%>
<!DOCTYPE html>
<html>
<head>
</head>
<frameset rows="130,*">
	<frame noresize="noresize" frameborder="0" src="head.jsp" />
	<frameset cols="150,*">
		<frame noresize="noresize" frameborder="0" src="menu.jsp" />
		<frame noresize="noresize" frameborder="0" src="<%=request.getContextPath()%>/q.do" name="main" />
	</frameset>
</frameset>
</html>