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
</head>

<body>
  <div class="box-positon">
			<div class="rpos">
				当前位置: 权限设置 - 权限组授权
			</div>
			<div class="clear"></div>
		</div>
	<div>
	<form name="delForm" action="#" method="POST">
	<div><font size="+1">[权限组授权]</font></div>
	<br />
	<div >查询结果</div>
	<table class="pn-ltable"  style="" width="100%" cellspacing="1" cellpadding="0" border="1">
	<thead class="pn-lthead">
			<tr align="center"  > 
			   <td width="15%" height="18" align="center">
			      操作			   </td>
			   <td width="21%" align="center">
			      组名称			   </td>
			   <td width="22%" align="center">
			      描述		       </td>
			</tr>
			</thead>
			<tbody class="pn-ltbody">
		  <tr>
		      <td title="">
			      <img height="22" align="middle" src="#"  />
		      </td>
			 
			   <td title=""/>
			      财务
			   </td>
			   <td width="42%" >
			     财务人员使用				   </td>
	     </tr>
		 
		   <tr>
		      <td title="">
			      <img height="22" align="middle" src="#"  />
		      </td>
			  
			   <td title=""/>
			      前台
			   </td>
			   <td>
			     前台人员使用
			   </td>
	     </tr>
		   <tr>
		      <td title="">
			      <img height="22" align="middle" src="#"  />
		      </td>
			 
			   <td title=""/>
			       库管
			   </td>
			   <td>
			     库存人员使用
			   </td>
	     </tr>
		   <tr>
		      <td title="">
			      <img height="22" align="middle" src="#"  />
		      </td>
			 
			   <td title=""/>
			      管理
			   </td>
			   <td>
			     管理人员使用
			   </td>
	     </tr>
		   <tr>
		      <td title="">
			      <img height="22" align="middle" src="#"  />
		      </td>
			  
			   <td title=""/>
			      登记
			   </td>
			   <td>
			     登记人员使用
			   </td>
	     </tr>
		   <tr>
		      <td title="">
			      <img height="22" align="middle" src="#"  />
		      </td>
			 
			   <td title=""/>
			      店内财务
			   </td>
			   <td>
			     店内财务人员使用
			   </td>
	     </tr>
		 </tbody>
	  </table>
	</form>
	</div>
</body>
</html>
