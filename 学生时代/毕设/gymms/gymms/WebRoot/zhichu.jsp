<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 
 </head>
 
 <body>
 <table align="center" cellpadding="0" cellspacing="0">
   
   <tr>
     <td colspan="3"><img src="res/common/img/theme/zhichu.png" align="middle" height="400" width="600"></td>
   </tr>

  
   <tr>
     <td colspan="3">&nbsp;</td>
   </tr>
   
   <tr>
     <td colspan="3">&nbsp;</td>
   </tr>
   
    <tr>
     <td align="center"> <input  type="button" value="按天统计" /> </td>
	 <td align="center"> <input  type="button" value="按月统计" /> </td>
	 <td align="center"> <input  type="button" value="按年统计" /></td>
   </tr>
 </table>
</body>
</html>
