<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.springframework.web.context.request.SessionScope"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.model.User"%>
<%
	User u = (User) session.getAttribute("loguser");
%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
td {
	text-align: center;
}
</style>
<script type="text/javascript">
var idlist = document.getElementsByName("id");
var logid = "<%=u.getYhId()%>";
window.onload=function(){
	for(var i=0;i<idlist.length;i++){
		if(logid==idlist[i].value){
			idlist[i].disabled=true;
		}
	}
}
function del() {
	document.f.action = "<%=request.getContextPath()%>/delete.do?idlist="+ idlist;
	document.f.submit();
}
function check() {
	var c = document.getElementById("allcheck");
	if (c.checked) {
		for ( var i = 0; i < idlist.length; i++) {
			if(idlist[i].value==logid){
				idlist[i].checked=false;
			}else{
				if (idlist[i].checked) {
					idlist[i].checked = false;
				}else{
					idlist[i].checked = true;
				}
			}
		}
	}else{
		for (var i = 0; i < idlist.length; i++) {
			idlist[i].checked = false;
		}
	}
}
function query(pageNumber){
	document.f.action = "<%=request.getContextPath()%>/queryUser.do?pageNumber="+ pageNumber;
	document.f.submit();
}
function chenge(){
	var a = document.getElementById("chenge").value;
	document.f.action = "<%=request.getContextPath()%>/queryUser.do?pageNumber="+ a;
		document.f.submit();
	}
	function chengec() {
		var tr = document.getElementsByTagName("tr");
	}
</script>
</head>
<body>
	<form method="post" name="f">
		<div style="height: 200px">
			<table align="center" width="1090px">
				<thead style="height: 30">
					<tr style="background-color: #d7d7d7;">
						<th colspan="6">用户管理</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 50px"><input type="checkbox" id="allcheck"
							onclick="check()" />
						</td>
						<td style="width: 300px">用户名</td>
						<td style="width: 300px">用户密码</td>
						<td style="width: 50px">性别</td>
						<td style="width: 300px">部门</td>
						<td style="width: 50px">操作</td>
					</tr>
					<c:forEach items="${userlist }" var="map" varStatus="i">
						<c:if test="${i.count%2!=0}">
							<tr id="${i}" style="background-color: #d7d7d7;" onmousemove="">
								<td><input type="checkbox" name="id" id="a"
									value="${map.yhId }" />
								</td>
								<td>${map.yhName}</td>
								<td>${map.yhPass}</td>
								<td>${map.sex.sexName}</td>
								<td>${map.dept.deptName}</td>
								<td><a
									href="<%=request.getContextPath()%>/edit.do?id=${map.yhId}">修改</a>
								</td>
							</tr>
						</c:if>
						<c:if test="${i.count%2==0}">
							<tr id="${i}" style="background-color:white;">
								<td><input type="checkbox" name="id" id="a"
									value="${map.yhId }" />
								</td>
								<td>${map.yhName}</td>
								<td>${map.yhPass}</td>
								<td>${map.sex.sexName}</td>
								<td>${map.dept.deptName}</td>
								<td><a
									href="<%=request.getContextPath()%>/edit.do?id=${map.yhId}">修改</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<table align="center" width="1090px">
			<tr>
				<td><a href="<%=request.getContextPath()%>/addpage.do">添加</a>
				</td>
				<td><a href="javascript:del()">删除</a>
				</td>
				<td><a href="javascript:query('1')">首页</a></td>
				<td><a href="javascript:query('${count-1}')">上一页</a></td>
				<td><input type="text" name="countpage" style="width: 20px"
					value="${count }" id="chenge">
				/${totalPage }</td>
				<td><a href="javascript:chenge()">跳转</a>
				</td>
				<td><a href="javascript:query('${count+1}')">下一页</a>
				</td>
				<td><a href="javascript:query('${totalPage}')">尾页</a>
				</td>
				<td>总共有${total }条</td>
			</tr>
		</table>
	</form>
</body>
</html>

