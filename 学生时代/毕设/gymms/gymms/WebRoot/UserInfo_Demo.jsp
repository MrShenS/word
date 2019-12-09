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
	<form name = "editUserForm" action="User!update.action">
	<table cellpadding="0" cellspacing="0" width="86%" border="1" bordercolor="#00CCFF""">
	<tr  bordercolor="#00FFFF"  bgcolor="#00FFFF">
	      <td><font size="+1">[用户管理]</font> </td>
		  <td align="right">
		  权限组
			<select>
			<option value="1">财务</option>
			<option value="2">教练</option>
			<option value="3">后台</option>
			<option value="4">前台</option>
			</select>
			<input type="button" onclick="if(confirm('确定加入该组吗？')){alert('加入成功！')}" value="加入该组" />
			<input type="button" onclick="if(confirm('确定保存吗？')){alert('保存成功！');}" value="保存" />
			<input type="button" value="返回" />
		  </td>
		  
	   </tr>
	   <tr >
	      <td height="25" width="12%" align="center">用 户 名</td>
		  <td height="25" width="10%">max</td>
	  </tr>
		  <tr>
	      <td height="25" width="10%" align="center">密码</td>
	      <td  height="25"width="87%"  class="tableright">*******
		  <samp> (密码最大长度不超过14个字符！)</samp></td>		 
		  </tr>	   
	   <tr>
	      <td height="25" align="center">电子邮箱</td>
		  <td height="25" align="left">www.asdassd.@163.com</td>
	  </tr>
	      <tr>
	      <td width="10%" height="70"align="center">所 属 组</td>
	 	  <td height="25" width="10%">健身前台 <input type="button" onclick="if(confirm('确定退出该组吗？')){return true;}" value="退出该组" /><img width="20" src="#" /></td>	  
	  </tr>
	  
	  <tr  bgcolor="#EFEFEF">
	       <td height="25" width="10%" align="center">姓名</td>
           <td height="25" width="10%" colspan="2">毛忠</td>
	  </tr>
	  <tr>
	      <td height="25" width="10%" align="center">部门</td>
		  <td height="25" width="10%" colspan="2">无</td>
	 </tr>      
	 <tr>
	     <td height="25" width="10%" align="center">职务</td>
		 <td height="25" width="10%" colspan="2" align="left">前台</td>
	</tr>
	 </table>
	</form>
</body>
</html>
