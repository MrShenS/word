<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
				当前位置: 权限设置 - 权限组管理
			</div>
			<br />
		</div>

		<div>
			<div style="float:left">
				[权限组管理]
			</div>
			<br />
			<div style="float:right">
				权限组名称:
				<input name="name" type="text" />
				权限组描述:
				<input name="discrption" type="text" />
				<input class="ropt" type="button"
					onclick="if(confirm('确定添加该权限组吗？')){alert('添加成功！')}" value="添加" />
				<input class="del-button" type="button"
					onclick="if(confirm('确定删除该权限组吗？')){alert('删除成功！')}" value="删除" />
			</div>
		</div>
		<br />
		<div>
			查询结果 :
		</div>
		<div class="clear"></div>


		<form name="delForm" action="#" method="POST">

			<table class="pn-ltable" style="" width="100%" cellspacing="1"
				cellpadding="0" border="0">
				<thead class="pn-lthead">
					<tr align="center">
						<td width="16%" align="center">
							操作
						</td>
						<td width="7%" align="center">
							<input type="checkbox" name="all" onclick="" class="wu">
						</td>
						<td width="35%" align="center">
							组名称
						</td>
						<td width="39%" align="center">
							描述
						</td>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<tr>
						<td title="">
							<img height="22" align="middle" src="#" />
						</td>
						<td align="center">
							<input type="checkbox" name="all" onclick="" class="wu">
						</td>
						<td title="" />
							财务
						</td>
						<td width="3%">
							财务人员使用
						</td>
					</tr>

					<tr>
						<td title="">
							<img height="22" align="middle" src="#" />
						</td>
						<td align="center">
							<input type="checkbox" name="all" onclick="" class="wu">
						</td>
						<td title="" />
							前台
						</td>
						<td>
							<samp></samp>
						</td>
					</tr>
					<tr>
						<td title="">
							<img height="22" align="middle" src="#" />
						</td>
						<td align="center">
							<input type="checkbox" name="all" onclick="" class="wu">
						</td>
						<td title="" />
							库管
						</td>
						<td>
							库存人员使用
						</td>
					</tr>
					<tr>
						<td title="">
							<img height="22" align="middle" src="#" />
						</td>
						<td align="center">
							<input type="checkbox" name="all" onclick="" class="wu">
						</td>
						<td title="" />
							管理
						</td>
						<td>
							管理人员使用
						</td>
					</tr>
					<tr>
						<td title="">
							<img height="22" align="middle" src="#" />
						</td>
						<td align="center">
							<input type="checkbox" name="all" onclick="" class="wu">
						</td>
						<td title="" />
							登记
						</td>
						<td>
							登记人员使用
						</td>
					</tr>
					<tr>
						<td title="">
							<img height="22" align="middle" src="#" />
						</td>
						<td align="center">
							<input type="checkbox" name="all" onclick="" class="wu">
						</td>
						<td title="" />
							店内财务
						</td>
						<td>
							店内财务人员使用
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
