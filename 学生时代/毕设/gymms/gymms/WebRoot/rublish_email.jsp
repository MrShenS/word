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
<script src="./res/common/js/jquery.js" type="text/javascript"></script>
<script src="./res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="./res/common/js/pony.js" type="text/javascript"></script>
<script src="./res/jeecms/js/admin.js" type="text/javascript"></script><script src="./res/common/js/message.js" type="text/javascript"></script>
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
	<div class="rpos">当前位置: 站内信管理 - 垃圾箱管理</div>
<form class="ropt" action="v_list.do" method="post" id="listFrom">
		<input type="hidden" name="box" value="3" id="box"/>
		<input class="send-message" type="submit" value="发送站内信" onclick="this.form.action='v_add.do'"/>
		<input class="inbox" type="button" value="收件箱管理" onclick="toList(0)"/>
		<input class="sendbox" type="button" value="发件箱管理" onclick="toList(1)"/>
		<input class="trash" type="button" value="垃圾箱管理" onclick="toList(3)"/>
</form>	<div class="clear"></div>
</div>
<div class="body-box">
<form id="tableForm" method="post">
<input type="hidden" name="pageNo" value=""/>
<input type="hidden" name="box" value="3"/>
<input type="hidden" name="msg" value="您选择的站内信息已被移动到垃圾箱"/>
<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
<thead class="pn-lthead"><tr>
	<th width="20"><input type='checkbox' onclick='Pn.checkbox("ids",this.checked)'/></th>
	<th>ID</th>
	<th>标题</th>
	<th>发件人</th>
	<th>收件人</th>
	<th>发送时间</th></tr></thead>
<tbody  class="pn-ltbody"><tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='26' id="id_26"/></td>
	<td>26</td>
	<td>			<a href="v_read.do?id=26&&box=3"><strong>agag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:19:28</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='25' id="id_25"/></td>
	<td>25</td>
	<td>			<a href="v_read.do?id=25&&box=3"><strong>agfagaga</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:19:02</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='24' id="id_24"/></td>
	<td>24</td>
	<td>			<a href="v_read.do?id=24&&box=3"><strong>agagagaga</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:18:43</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='23' id="id_23"/></td>
	<td>23</td>
	<td>			<a href="v_read.do?id=23&&box=3"><strong>agagag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:18:36</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='22' id="id_22"/></td>
	<td>22</td>
	<td>			<a href="v_read.do?id=22&&box=3"><strong>agaga</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:18:30</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='21' id="id_21"/></td>
	<td>21</td>
	<td>			<a href="v_read.do?id=21&&box=3"><strong>agagag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:18:21</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='20' id="id_20"/></td>
	<td>20</td>
	<td>			<a href="v_read.do?id=20&&box=3"><strong>agagaga</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:18:14</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='19' id="id_19"/></td>
	<td>19</td>
	<td>			<a href="v_read.do?id=19&&box=3"><strong>agag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:18:02</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='18' id="id_18"/></td>
	<td>18</td>
	<td>			<a href="v_read.do?id=18&&box=3"><strong>agaga</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:17:56</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='17' id="id_17"/></td>
	<td>17</td>
	<td>			<a href="v_read.do?id=17&&box=3"><strong>agag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:17:48</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='16' id="id_16"/></td>
	<td>16</td>
	<td>			<a href="v_read.do?id=16&&box=3"><strong>ag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:17:41</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='15' id="id_15"/></td>
	<td>15</td>
	<td>			<a href="v_read.do?id=15&&box=3"><strong>agagag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:17:34</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='14' id="id_14"/></td>
	<td>14</td>
	<td>			<a href="v_read.do?id=14&&box=3"><strong>agagagaga</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:17:25</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='13' id="id_13"/></td>
	<td>13</td>
	<td>			<a href="v_read.do?id=13&&box=3"><strong>afgag</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:17:17</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='11' id="id_11"/></td>
	<td>11</td>
	<td>			<a href="v_read.do?id=11&&box=3"><strong>aga</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:17:10</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='10' id="id_10"/></td>
	<td>10</td>
	<td>			<a href="v_read.do?id=10&&box=3"><strong>afa</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:16:59</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='9' id="id_9"/></td>
	<td>9</td>
	<td>			<a href="v_read.do?id=9&&box=3"><strong>afaf</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:16:50</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='8' id="id_8"/></td>
	<td>8</td>
	<td>			<a href="v_read.do?id=8&&box=3"><strong>afa</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:15:57</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='7' id="id_7"/></td>
	<td>7</td>
	<td>			<a href="v_read.do?id=7&&box=3"><strong>afa</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:15:57</td>
</tr>
<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
	<td><input type='checkbox' name='ids' value='5' id="id_5"/></td>
	<td>5</td>
	<td>			<a href="v_read.do?id=5&&box=3"><strong>afa</strong></a>
</td>
	<td align="center">admin</td>
	<td align="center">admin</td>
	<td align="center">2011-02-25 11:15:57</td>
</tr></tbody>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center" class="pn-sp">
	共 23 条&nbsp;
	每页<input type="text" value="20" style="width:30px" onfocus="this.select();" onblur="$.cookie('_cookie_page_size',this.value,{expires:3650});" onkeypress="if(event.keyCode==13){$(this).blur();return false;}"/>条&nbsp;
	<input class="first-page" type="button" value="首 页" onclick="_gotoPage('1');" disabled="disabled"/>
	<input class="pre-page" type="button" value="上一页" onclick="_gotoPage('1');" disabled="disabled"/>
	<input class="next-page" type="button" value="下一页" onclick="_gotoPage('2');"/>
	<input class="last-page" type="button" value="尾 页" onclick="_gotoPage('2');"/>&nbsp;
	当前 1/2 页 &nbsp;转到第<input type="text" id="_goPs" style="width:50px" onfocus="this.select();" onkeypress="if(event.keyCode==13){$('#_goPage').click();return false;}"/>页
	<input class="go" id="_goPage" type="button" value="转" onclick="_gotoPage($('#_goPs').val());"/>
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
<div>
<input class="recycle" type="button" onclick="revert()" value="还原"/>
<input class="delete-complete" type="button" onclick="empty()" value="彻底删除"/>
<span id="msgDiv" style="color: red;"></span>
</div>

</form>
</div>
</body>
</html>