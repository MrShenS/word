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
<style type="text/css">
<!--
.STYLE1 {color: #D4D0C8}
-->
</style>
</head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		<link href="./res/jeecms/css/admin.css" rel="stylesheet"
			type="text/css" />
		<link href="./res/common/css/theme.css" rel="stylesheet"
			type="text/css" />
		<link href="./res/common/css/jquery.validate.css" rel="stylesheet"
			type="text/css" />
		<link href="./res/common/css/jquery.treeview.css" rel="stylesheet"
			type="text/css" />
		<link href="./res/common/css/jquery.ui.css" rel="stylesheet"
			type="text/css" />

		<script src="./thirdparty/fckeditor/fckeditor.js"
			type="text/javascript"></script>
		<script src="./thirdparty/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>
		<script src="./res/common/js/jquery.js" type="text/javascript"></script>
		<script src="./res/common/js/jquery.ext.js" type="text/javascript"></script>
		<script src="./res/common/js/pony.js" type="text/javascript"></script>
		<script src="./res/jeecms/js/admin.js" type="text/javascript"></script>
		
<body>

<div class="box-positon">
			<div class="rpos">
				当前位置: 用户管理 - 用户信息
			</div>
			<div class="clear"></div>
		    </div>
			
			<div class="pn-flabel pn-flabel-h">
			<div style="float:left" class="pn-flabel pn-flabel-h">
 <font size="+1">[用户管理]</font> 
 </div>
 <div style="float:right" class="pn-flabel pn-flabel-h" >
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
</div>
			</div>
		 
		    <div class="body-box">
	<form name = "editUserForm" action="User!update.action">
	<table class="pn-ltable" style="" width="100%" cellspacing="1"
					cellpadding="0" border="0">
	  <tbody class="pn-ltbody">
	   <tr >
	      <td height="25" width="12%" align="center">用 户 名</td>
		  <td height="25" width="10%">max</td>
	  </tr>
		  <tr>
	      <td height="25" width="10%" align="center">密码</td>
	      <td width="87%"  height="25">*******	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <samp> (密码最大长度不超过14个字符！)</samp></td>		 
		  </tr>	   
	   <tr>
	      <td height="25" align="center">电子邮箱</td>
		  <td height="25" align="left">www.asdassd.@163.com</td>
	  </tr>
	      <tr>
	      <td width="10%" height="70"align="center">所 属 组</td>
	 	  <td height="25" width="10%">健身前台 <input type="button" onclick="if(confirm('确定退出该组吗？')){return true;}" value="退出该组" /><img width="20" src="#" /></td>	  
	  </tr>
	  
	  <tr >
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
	</tbody>
	 </table>
	</form>
	</div>
</body>
</html>
