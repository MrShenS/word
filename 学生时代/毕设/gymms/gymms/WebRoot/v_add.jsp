<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});

function check_mname(){
     var mname = document.jvForm.mname.value;
     if(mname=='' && mname.length==0) {
		alert("会员名不能为空");
		return;
	}
	JCusBiz_M.check_mname(mname,tiantianxiangshang);
}
function tiantianxiangshang(isExit) {
	if(false==isExit) {
		document.getElementById("m001").style.display="block";
		document.getElementById("m002").style.display="none";
	} else {
		document.getElementById("m002").style.display="block";
		document.getElementById("m001").style.display="none";
	}
}
function check_id(){
    var id = document.jvForm.id.value;
    if(id=='' && id.length==0) {
		alert("身份证不能为空");
		return;
	}
    JCusBiz_M.check_id(id,tiantianxiangshang2);
}
function tiantianxiangshang2(isExit) {
	if(false==isExit) {
		document.getElementById("m003").style.display="block";
		document.getElementById("m004").style.display="none";
	} else {
		document.getElementById("m004").style.display="block";
		document.getElementById("m003").style.display="none";
	}
}
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 会员信息 - 添加
			</div>
			<form class="ropt">
				<input type="submit" value="返回列表"
					onclick="this.form.action='MemberServlet'" class="return-button" />
			</form>
			<div class="clear"></div>
		
		</div>
		<div class="body-box">
			<form method="post" action="MemberServlet" name="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							<span class="pn-frequired">*</span>会员名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mname"	
								maxlength="100" class="required" onblur="check_mname()"/>
								<div id="m001" style="display:none;font-size:10px;color:green;">用户名可用</div>
							<div id="m002" style="display:none;font-size:10px;color:red;">用户名被占用</div>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							<span class="pn-frequired">*</span>身份证号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="id"
								class="required" onblur="check_id()"/>
								<div id="m003" style="display:none;font-size:10px;color:green;">身份证输入正确</div>
							<div id="m004" style="display:none;font-size:10px;color:red;">身份证输入有误</div>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							<span class="pn-frequired">*</span>会员编号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mno" class="required" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							电子邮箱:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text"  name="email"
								class="email" size="30" />
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
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							来自:
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="address"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							个人介绍:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<textarea cols="70" rows="5" name="description" maxlength="255"></textarea>
						</td>
					</tr>
					<tr>
					    <td><input type="hidden" value="001" name="hidden"></td>
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