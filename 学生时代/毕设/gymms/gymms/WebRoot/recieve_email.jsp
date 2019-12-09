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

<script src="/thirdparty/fckeditor/fckeditor.js" type="text/javascript"></script>
<script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="/res/common/js/jquery.js" type="text/javascript"></script>
<script src="/res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="/res/common/js/pony.js" type="text/javascript"></script>
<script src="/res/jeecms/js/admin.js" type="text/javascript"></script><script src="./res/common/js/message.js" type="text/javascript"></script>
<script type="text/javascript">
function getTableForm() {
	return document.getElementById('tableForm');
}
function optDelete() {
	if(Pn.checkedCount('ids')<=0) {
		alert("请选择您要操作的数据");
		return;
	}
	if(!confirm("您确定删除吗？")) {
		return;
	}
	var f = getTableForm();
	f.action="o_delete.do";
	f.submit();
}
function toList(box) {
	$("#box").val(box);
	$("#listFrom").submit();
}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 站内信管理 - 收件箱管理</div>
<form class="ropt" action="v_list.do" method="post" id="listFrom">
		<input type="hidden" name="box" value="0" id="box"/>
		<input class="send-message" type="submit" value="发送站内信" onclick="this.form.action='v_add.do'"/>
		<input class="inbox" type="button" value="收件箱管理" onclick="toList(0)"/>
		<input class="sendbox" type="button" value="发件箱管理" onclick="toList(1)"/>
		<input class="trash" type="button" value="垃圾箱管理" onclick="toList(3)"/>
</form>	<div class="clear"></div>
</div>
<div class="body-box">
<form id="tableForm" method="post">
<input type="hidden" name="pageNo" value=""/>
<input type="hidden" name="box" value="0"/>
<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center" class="pn-sp">
	共 0 条&nbsp;
	每页<input type="text" value="20" style="width:30px" onfocus="this.select();" onblur="$.cookie('_cookie_page_size',this.value,{expires:3650});" onkeypress="if(event.keyCode==13){$(this).blur();return false;}"/>条&nbsp;
	<input class="first-page" type="button" value="首 页" onclick="_gotoPage('1');" disabled="disabled"/>
	<input class="pre-page" type="button" value="上一页" onclick="_gotoPage('1');" disabled="disabled"/>
	<input class="next-page" type="button" value="下一页" onclick="_gotoPage('1');" disabled="disabled"/>
	<input class="last-page" type="button" value="尾 页" onclick="_gotoPage('1');" disabled="disabled"/>&nbsp;
	当前 1/1 页 &nbsp;转到第<input type="text" id="_goPs" style="width:50px" onfocus="this.select();" onkeypress="if(event.keyCode==13){$('#_goPage').click();return false;}"/>页
	<input class="go" id="_goPage" type="button" value="转" onclick="_gotoPage($('#_goPs').val());" disabled="disabled"/>
</td></tr></table>
<script type="text/javascript">
function _gotoPage(pageNo) {
	try{
		var tableForm = getTableForm();
		$("input[name=pageNo]").val(pageNo);
		tableForm.action="v_list.do";
		tableForm.onsubmit=null;
		tableForm.submit();
	} catch(e) {
		alert('_gotoPage(pageNo)方法出错');
	}
}
</script>
<div><input class="del-button" type="button" value="删除" onclick="toTrash();"/><span id="msgDiv" style="color: red;"></span></div>
</form>
</div>
</body>
</html>