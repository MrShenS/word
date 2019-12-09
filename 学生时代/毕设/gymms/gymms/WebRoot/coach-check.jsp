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
				当前位置: 健身管理 - 健身课程 - 页面
			</div>


			<form class="ropt">
				<input class="add" type="submit" value="增加"
					onclick="this.form.action='add-coach.jsp';" />
			</form>


			<form class="ropt">
				<input class="add" type="submit" value="按课程查找"
					onclick="this.form.action='curriculum-check.html';" />
			</form>


			<div class="clear"></div>

		</div>
		<div class="body-box">
			<form method="post" action="o_save.do" id="jvForm">

				<table width="101%" class="pn-ftable" cellpadding="3"
					cellspacing="1" border="0">
					<tr>
						<td width="13%" class="pn-flabel pn-flabel-h">
							教练名:
						</td>

						<td colspan="1" width="31%" class="pn-fcontent">
							<input type="text" name="name" size="30" />

						</td>
						<td colspan="1" width="41%" class="pn-fcontent">
							<input class="add" type="submit" name="but" value="确定" />
						</td>

						<td align="center" colspan="1" width="41%" class="pn-fcontent">
							<a href="revamp_coach.html?id=5&pageNo=" class="pn-opt">修改</a> |
							<a href="o_delete.do?ids=5&pageNo="
								onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
						</td>
					</tr>

				</table>

				<br />

				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td rowspan="4" align="center">
							<img src="jj.jpg">
						</td>
						<td>
							<font style="color: #000000;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;团队:</font>
							<input type="text" value="健身教练 " class="p" disabled="disabled" />

							&nbsp;&nbsp;&nbsp;姓名:
							<input type="text" value="吴秉宇-Tony " class="p"
								disabled="disabled" />

							&nbsp;&nbsp;&nbsp;职位:
							<input type="text" value="私人" class="p" disabled="disabled" />
						</td>

					</tr>

					<tr>
						<td align="left">
							<font style="color: #000000;">英语沟通:</font>
							<input type="text" value="可以 " class="p" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<td lign="left">
							<font style="color: #000000;">工作资历:</font>
							<input type="text" value="3-5 " class="p" disabled="disabled" />

							<font style="color: #000000;"> &nbsp;&nbsp;&nbsp;年龄:</font>
							<input type="text" value="25-30 " class="p" disabled="disabled" />
						</td>
					</tr>

					<tr>

						<td>
							<font style="color: #000000;">上班时间:</font>
							<input type="text" value="周一 到 周六" class="p" disabled="disabled" />

						</td>
					</tr>


					<tr>
						<td></td>
						<td>
							<font style="color: #000000;">特长:</font>
							<br>
							<li>
								运动减脂、力量训练、功能性训练、脊柱康复训练
							</li>
						</td>
					</tr>


					<tr>
						<td></td>
						<td>
							<font style="color: #000000;">个人介绍:</font>
							<br>
							<li>
								重塑生活，重塑健康
							</li>
						</td>
					</tr>


					<tr>
						<td></td>
						<td>
							<font style="color: #000000;">资历:</font>
							<br>
							<li>
								NSCA美国体能学会注册私人教练
							</li>
							<li>
								AASFP亚洲体适能高级私人教练
							</li>
							<li>
								上海体育学院 体育教育专业 教育学学士
							</li>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
