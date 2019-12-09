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

		<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});


         <style>  
	  .p{border-left-width :0px;
	    border-right-width : 0px;
		border-top-width : 0px;
		border-style:none
	  }
	  </style>
	</script>

	</head>


	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 健身管理 - 修改教练 - 页面
			</div>
			<form class="ropt">
				<input class="add" type="submit" value="返回"
					onclick="this.form.action='curriculum-check.jsp';" />
			</form>

			<div class="clear"></div>

		</div>
		<div class="body-box">
			<form method="post" action="o_save.do" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							姓名：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="name" value="" size="30" />
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							职位：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="name" value="" size="30" />
						</td>
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							团队：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" border="false" size="30" />
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							英语沟通：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" border="false" size="30" />
						</td>
					</tr>




					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							工作资历：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" class="p" border="false"
								size="30" />
						</td>

						<td width="14%" class="pn-flabel pn-flabel-h">
							年龄：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" border="false" size="30" />
						</td>
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							上班时间：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" class="p" border="false"
								size="30" />
						</td>

						<td width="14%" class="pn-flabel pn-flabel-h">
							特长：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" border="false" size="30" />
						</td>
					</tr>

					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							个人介绍：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" class="p" border="false"
								size="30" />
						</td>

						<td width="14%" class="pn-flabel pn-flabel-h">
							资历：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="f" value="" border="false" size="30" />
						</td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="hidden" name="id" value="5" />
							<input type="submit" value="提交" class="submit" />
							&nbsp;
							<input type="reset" value="重置" class="reset" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</body>
</html>



