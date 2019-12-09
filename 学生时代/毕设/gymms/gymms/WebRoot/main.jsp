<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>gymms-main</title>
</head>

<c:if test="${sessionScope.userType==1}">
<frameset cols="22%,*" frameborder="0" border="0" framespacing="0">
	<frame src="left-1.jsp" scrolling="auto" name="leftFrame" noresize="noresize" id="leftFrame" />
	<frame src="welcome.jsp " name="rightFrame"    id="rightFrame" />
</frameset> 
</c:if>
<c:if test="${sessionScope.userType==2}">
<frameset cols="22%,*" frameborder="0" border="0" framespacing="0">
	<frame src="left-2.jsp" scrolling="no" name="leftFrame" noresize="noresize" id="leftFrame" />
	<frame src="welcome.jsp "name="rightFrame"    id="rightFrame" />
</frameset> 
</c:if>
<noframes><body></body></noframes>
</html>
