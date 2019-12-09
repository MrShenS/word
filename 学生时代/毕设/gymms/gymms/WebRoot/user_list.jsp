<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	f.action="UserBulkDeleteServlet";
	f.submit();
}
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 用户管理 - 列表
			</div>
			<form class="ropt" method="post" action="UserInfoServlet">
				<select name="flag">
								<option value="1">
									用户编号
								</option>
								<option value="2">
									用户名
								</option>
							</select>
				<input type="text" name="text">
				 <input class="query" type="submit" value="查询"/>
				<input class="add" type="submit" value="添加"
					onclick="this.form.action='user_add.jsp';" />
			</form>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form id="tableForm" method="post">
				<input type="hidden" name="pageNo" value="" />
				<table class="pn-ltable" style="" width="100%" cellspacing="1"
					cellpadding="0" border="0">
					<thead class="pn-lthead">
						<tr>
							<th width="20">
								<input type='checkbox' onclick='Pn.checkbox("ids",this.checked)' />
							</th>
							<th>
								ID
							</th>
							<th>
								用户名
							</th>
							<th>
								注册时间
							</th>
							<th>
								QQ
							</th>
							<th>
								联系方式
							</th>
							<th>
								操作选项
							</th>
						</tr>
					</thead>
					<tbody class="pn-ltbody">
						
							<c:forEach var="userinfo" items="${userlist}">
							
							<tr onmouseover="this.bgColor='#eeeeee'"
							onmouseout="this.bgColor='#ffffff'">
							<td>
								<input type='checkbox' name='ids' value='${userinfo.userid} ' />
							</td>
							<td align="center">
								${userinfo.userid}
							</td>
							<td align="center">
								${userinfo.username}
							</td>
							<td align="center">
								${userinfo.register_time}
							</td>
							<td align="center">
								${userinfo.qq}
							</td>
							<td align="center">
								${userinfo.tel}
							</td>
							<td align="center">
								<a href="userinfo.jsp?username=${userinfo.username}" class="pn-opt">修改</a> |
								<a href="UserInfoServlet?userid=${userinfo.userid}"
									onclick="if(!confirm('您确定删除吗？')) {return false;}"
									class="pn-opt">删除</a>
							</td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center" class="pn-sp">
							共 ${podi.itemcount} 条&nbsp; 每页
							<input type="text" value="${podi.pagesize}" style="width: 30px" name = "pagesize"
								onfocus="this.select();"
								onblur="$.cookie('_cookie_page_size',this.value,{expires:3650});"
								onkeypress="if(event.keyCode==13){$(this).blur();return false;}" />
							条&nbsp;
							<input class="first-page" type="button" value="首 页"
								onclick="_gotoPage('1');" />
							<input class="pre-page" type="button" value="上一页"
								onclick="_gotoPage('2');"/>
							<input class="next-page" type="button" value="下一页"
								onclick="_gotoPage('3');" />
							<input class="last-page" type="button" value="尾 页"
								onclick="_gotoPage('4');"/>
							&nbsp;${podi.curpage}/${podi.pagecount}&nbsp;转到第
							<input type="text" id="_goPs" style="width: 50px"
								onfocus="this.select();"
								onkeypress="if(event.keyCode==13){$('#_goPage').click();return false;}" />
							页
							<input class="go" id="_goPage" type="button" value="转"
								onclick="_gotoPage('0000'+$('#_goPs').val());" />
						</td>
						<td>
						  <input type="hidden" value="000" name="hidden">
						</td>
					</tr>
				</table>
				<script type="text/javascript">
function _gotoPage(pageNo) {
	try{
		var tableForm = getTableForm();
		$("input[name=pageNo]").val(pageNo);
		tableForm.action="UserModiyInfoServlet";
		tableForm.onsubmit=null;
		tableForm.submit();
	} catch(e) {
		alert('_gotoPage(pageNo)方法出错');
	}
}
</script>
				<div>
					<input class="del-button" type="button" value="删除"
						onclick="optDelete();" />
				</div>
			</form>
		</div>
	</body>
</html>