	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		
		<script type='text/javascript' src='/gymms/dwr/interface/JCusBiz_M.js'></script>
        <script type='text/javascript' src='/gymms/dwr/engine.js'></script>
        <script type='text/javascript' src='/gymms/dwr/util.js'></script>

		
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
				当前位置: 
			</div>
			
			<form class="ropt">
				<input type="submit" value="返回列表"
					onclick="this.form.action='welcome.jsp';" class="return-button" />
			</form>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form method="post" name="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							场地名称：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							${fib.roomname }
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							照片：
						</td>
						<td  align="center" rowspan="5" colspan="1" class="pn-fcontent">
						     <img  src="${fib.roomphoto }" />
						</td>
						
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							容纳人数：
						</td>
						<td colspan="2" width="36%" class="pn-fcontent">
							${fib.accountnumber }
						</td>
					</tr>
				
					
				</table>
			</form>
		</div>
	</body>
</html>

