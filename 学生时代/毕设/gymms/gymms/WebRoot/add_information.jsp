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

</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 增加最新资讯 - 列表
			</div>
			<form class="ropt">
				<input class="add" type="submit" value="返回"
					onclick="this.form.action='information.jsp';" />
			</form>

			<div class="clear"></div>

		</div>
		<div class="body-box">
			<form method="post" action="o_save.do" id="jvForm">


				<table class="pn-ltable" style="" width="100%" cellspacing="1"
					cellpadding="0" border="0">
					<thead class="pn-lthead">
						<tr>

							<th>
								新增场地
							</th>

							<th>
								新增器械
							</th>

							<th>
								新进教练
							</th>
							<th>
								公司活动
							</th>

						</tr>
					</thead>

					<tbody class="pn-ltbody">
						<tr onmouseover="this.bgColor='#eeeeee'"
							onmouseout="this.bgColor='#ffffff'">
							<td>
								<textarea cols="20" rows="5"></textarea>
							</td>
							<td>
								<textarea cols="20" rows="5"></textarea>
							</td>
							<td>
								<textarea cols="20" rows="5"></textarea>
							</td>
							<td>
								<textarea cols="20" rows="5"></textarea>
							</td>

						</tr>
						<tr>
							<td colspan="8" class="pn-fbutton">
								<input type="hidden" name="id" value="5" />
								<input type="submit" value="提交" class="submit" />
								&nbsp;
								<input type="reset" value="重置" class="reset" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>
