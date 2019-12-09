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
		<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
		<title>JEECMS Administrator's Control Panel</title>
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
      function refresh()
        {
         document.getElementById("authImg").src='authImg?now=' + new Date();
       }

       </script>
		<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-size: 12px;
	background: url(./res/jeecms/img/login/bg.jpg) top repeat-x;
}

.input {
	width: 150px;
	height: 17px;
	border-top: 1px solid #404040;
	border-left: 1px solid #404040;
	border-right: 1px solid #D4D0C8;
	border-bottom: 1px solid #D4D0C8;
}
</style>
<script type="text/javascript">
function getForm() {
	return document.getElementById('jvForm');
}
function fun_submit() {
  var select= document.getElementById('grant').value;
	if(select<=0) {
		alert("请选择登陆用户类型.");
		return;
	}
	var f = getForm();
	f.action="LoginServlet";
	f.method="post";
	f.submit();
}

</script>
	</head>
	<body>
		<form id="jvForm">
			<table width="750" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="200">
						&nbsp;

					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="423" height="280" valign="top">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<img src="./res/jeecms/img/login/ltop.jpg" />
											</td>
										</tr>
										<tr>
											<td>
												<img src="./res/jeecms/img/login/llogo.jpg" />
											</td>
										</tr>
									</table>
								</td>
								<td width="40" align="center" valign="bottom">
									<img src="./res/jeecms/img/login/line.jpg" width="23"
										height="232" />
								</td>
								<td valign="top">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="90" align="center" valign="bottom">
												<img src="./res/jeecms/img/login/ltitle.jpg" />
											</td>
										</tr>
										<tr>
											<td>
												<div>
												</div>
												<table width="100%" border="0" align="center"
													cellpadding="0" cellspacing="5">
													<tr>
														<td width="91" height="40" align="right">
															<strong> 用户名：</strong>
														</td>
														<td width="211">
															<input type="input" id="username" name="username"
																vld="{required:true}" maxlength="100" class="input" />
														</td>
													</tr>
													<tr>
														<td height="40" align="right">
															<strong>密码：</strong>
														</td>
														<td>
															<input name="password" type="password" id="password"
																maxlength="32" vld="{required:true}" class="input" />
														</td>
													</tr>
                                                     <tr>
													<td height="40" align="right">
													
													<strong>登陆类型:</strong>
													</td>
													<td>
													  <select id="grant" name="grant">
													  <option value="-1">请选择用户类型</option>
													  <option value="1">营业员</option>
													  <option value="2">管理员</option>
													  </select>
													</td>
													
													</tr>
													<tr>
														<td height="40" align="right">
															<strong>验证码：</strong>
														</td>
														<td>
															<input type="text" name="validate" size="9" />
															<img src="authImg" id="authImg"/>看不清？<br><a href="#" onClick="refresh()">单击此处刷新</a>

														</td>

													</tr>
													
													<tr>
														<td height="40" colspan="2" align="center">
															<input type="image"
																src="./res/jeecms/img/login/login.jpg"
																onClick="fun_submit()" name="submit" />
															&nbsp; &nbsp;
															<img name="reg" style="cursor: pointer"
																src="./res/jeecms/img/login/reset.jpg"
																onclick="document.forms[0].reset()" />
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
