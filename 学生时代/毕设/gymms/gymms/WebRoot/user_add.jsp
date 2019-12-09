<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
		
		<script type='text/javascript' src='/gymms/dwr/interface/JCusBiz_user.js'></script>
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
		<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});

       function check_uname(){
			var username = document.jvForm.username.value;
			if(username=='' && username.length==0) {
				alert("用户名不能为空");
				return;
			}
			JCusBiz_user.check_uname(username,tiantianxiangshang);
		}
		
		function tiantianxiangshang(isExit) {
			if(false==isExit) {
				document.getElementById("c001").style.display="block";
				document.getElementById("c002").style.display="none";
			} else {
				document.getElementById("c002").style.display="block";
				document.getElementById("c001").style.display="none";
			}
		}
		
		function check_password() {
			var password = document.jvForm.password.value;
			var repassword =document.jvForm.repassword.value;
			if(password=='' && password.length==0) {
				alert("密码不能为空");
				return ;
			}
			if(password=='' && password.length==0) {
				alert("请输入确定密码");
				return ;
			}
			if( repassword==password) {
				document.getElementById("p2").style.display="block";
				document.getElementById("p1").style.display="none";
		    } else {
		    	document.getElementById("p1").style.display="block";
				document.getElementById("p2").style.display="none";
		    }
		}
 	
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 用户信息-增加
			</div>
			<form class="ropt">
				<input type="submit" value="返回列表" onclick="this.form.action='UserModiyInfoServlet'"
					class="return-button" />
			</form>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form method="post" action="UserModiyInfoServlet" name="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							用户名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
						<input type="text" name="username" class="username" onblur="check_uname()">
						 <div id="c001" style="display:none;font-size:10px;color:green;">用户名可用</div>
						<div id="c002" style="display:none;font-size:10px;color:red;">用户名被占用</div>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							类型:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="typeId">
								<option value="1">
									营业员
								</option>
								<option value="2">
									管理员
								</option>
							</select>
						</td>
						
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							密码:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="password" autocomplete="off" name="password" onblur="check_password()"
								name="password" />
						</td><td width="12%" class="pn-flabel pn-flabel-h">
							确认密码:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="password" name="repassword" autocomplete="off" equalTo="#password" onblur="check_password()"/>
							 <div id="p1" style="display:none;font-size:10px;color:red;">密码不一致，请确认密码</div>
							<div id="p2" style="display:none;font-size:10px;color:green;">密码正确</div>
						</td>				
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							注册时间:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="register_time" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
						
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							真实姓名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="realname"
								maxlength="100" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							性别:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<label>
								<input type="radio" value="男" name="gender" />
								男
							</label>
							<label>
								<input type="radio" value="女" name="gender" />
								女
							</label>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							出生日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="birthday" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							来自:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">

							<input type="text"  name="comefrom"
								maxlength="150" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							QQ:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="qq" maxlength="100" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							手机：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="tel" maxlength="100" />
						</td>
						<td>
						  <input type="hidden" value="001" name="hidden">
						</td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="submit" value="保存" class="submit" />
							&nbsp;
							<input type="reset" value="重置" class="reset" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>

