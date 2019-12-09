<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<link href="./res/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<script src="./thirdparty/fckeditor/fckeditor.js" type="text/javascript"></script>
<script src="./thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

<script src="./res/common/js/pony.js" type="text/javascript"></script>
<script src="./res/jeecms/js/admin.js" type="text/javascript"></script>
<script src="./res/common/js/message.js" type="text/javascript"></script>
<script type="text/javascript" src="res/common/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="res/common/js/jquery-1.4.2-vsdoc.js"></script>
<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
 function checkReceiverUser(){
  var f =document.getElementById("jvForm");
  f.submit();
}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 站内信管理 - 发送站内信</div>
	<form class="ropt">
		<input class="return-button" type="submit" value="返回列表" onclick="this.form.action='email_list.jsp?box=1';"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<form method="post" action="SendEmailServelt" id="jvForm">
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
<tr>
<td width="10%" class="pn-flabel pn-flabel-h">发件人:</td><td colspan="3" width="40%" class="pn-fcontent">
<input  name="username" disabled="disabled" value="${sessionScope.username }" id="username" maxlength="100" onchange="find_user()" />
用戶组选择<select name="groupId" id="groupId">
  <option value="-1">请选择</option>
  <option value="0">全部用戶</option>
  	 <option value="1">營業員</option>
  	 <option value="2">管理員</option>
</select>
请填写收件人或者选择会员组（两者必选其一，选择会员组批量发送站内信）<span style="color: red;" id="usernameMsg"></span>
</td></tr>
<tr><td width="10%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>标题:</td><td colspan="3" width="40%" class="pn-fcontent"><input type="text" maxlength="100" name="msgTitle" class="required" maxlength="100"/></td></tr>
<tr><td width="10%" class="pn-flabel pn-flabel-h">内容:</td><td width="90%" class="pn-fcontent"><textarea wrap="off" id="msgContent" name="msgContent" style="width:90%;height:350px" maxlength="1024000"></textarea>
</td></tr><tr></tr>
<tr>

<td colspan="4"  class="pn-fbutton">
<input type="button" value="提交" class="submit" onclick="checkReceiverUser()"/> &nbsp; <input type="reset" value="重置" class="reset" class="reset"/></td>

</tr></table>
</form>
</div>
</body>
</html>