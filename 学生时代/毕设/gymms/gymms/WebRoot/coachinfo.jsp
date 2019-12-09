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
						<td width="12%" class="pn-flabel pn-flabel-h">
							教练编号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.cno }
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							身份证号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
				            ${cb.cid }
						</td>
						<td rowspan="5" class="pn-flabel pn-flabel-h">
						     <img src="${cb.photofile }" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							真实姓名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.cname }
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							性别:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.sex }
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							出生日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.birthday }
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							来自:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.address }
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							QQ:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.qq }
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							电子邮箱:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.email }
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							类型:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.type }
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							手机:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							${cb.tel }
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							个人介绍:
						</td>
						<td colspan="4" width="88%" class="pn-fcontent">c
						    ${cb.description }
						</td>
					</tr>
					
				</table>
			</form>
		</div>
	</body>
</html>

