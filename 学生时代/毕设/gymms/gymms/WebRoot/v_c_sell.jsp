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
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 会员管理 - 售卡
			</div>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form method="post" action="SellCardServlet" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
					    <td colspan="4">会员信息：</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							<span class="pn-frequired">*</span>会员名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mname"
								maxlength="100" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							<span class="pn-frequired">*</span>身份证号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="id"
								maxlength="100" />
						</td>
					</tr>
					
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员组:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="mgroup">
								<option value="1">
									普通会员
								</option>
								<option value="2">
									VIP
								</option>
							</select>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							性别:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<label>
								<input type="radio" value="男" name="sex" />
								男
							</label>
							<label>
								<input type="radio" value="女" name="sex" />
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
							QQ:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="100" name="qq" />
						</td>
						
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							电话:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="telphone" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							手机:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="phone" />
						</td>
					</tr>
					</table>
					<br>
					<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
					    <td colspan="4">卡信息：</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							<span class="pn-frequired">*</span>卡号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" autocomplete="off" id="cardid"
								maxlength="100" name="cardid" class="required" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							单价:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="money" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡状态:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="cardstate">
								<option value="1">
									激活
								</option>
								<option value="2">
									锁定
								</option>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡类型:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<select name="cardtype">
								<option value="1" selected="selected">
									年卡
								</option>
								<option value="2">
									半年卡
								</option>
								<option value="3">
									季卡
								</option>
								<option value="4">
									月卡
								</option>
								<option value="5">
									次卡
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							开始时间:
						</td>
					  <td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="startdate" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							结束时间:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="overdate" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							备注:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<textarea cols="70" rows="5" name="intro" maxlength="255"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
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