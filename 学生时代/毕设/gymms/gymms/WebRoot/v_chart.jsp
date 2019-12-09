<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>

 <table align="center" cellpadding="0" cellspacing="0">
   
   <tr>
     <td colspan="3"><img src="${graphURL}"  width=600 height=400 border=0 usemap="#${filename}"></td>
   </tr>

  
   <tr>
     <td colspan="3">&nbsp;</td>
   </tr>
   
   <tr>
     <td colspan="3">&nbsp;</td>
   </tr>
   
    <tr>
     <td align="center"> <a href="TableServlet?di=0" target="rightFrame">按月统计</a></td>
	 <td align="center"> <a href="TableServlet?di=1" target="rightFrame">按年统计 </td>
   </tr>
 </table>

</body>
</html>
