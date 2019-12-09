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
$(function() {
	$("#jvForm").validate();
});
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 用户修改
			</div>
			<form class="ropt">
				<input type="submit" value="返回列表" onclick="this.form.action='UserModiyInfoServlet'"
					class="return-button" />
			</form>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form method="post" action="UserModiyInfoServlet" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
			  <c:forEach var="userlist" items="${userlist}">
					<c:if test="${userlist.username==param.username}">
			        <tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							用户名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="username" class="username" value="${userlist.username }">
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							用户编号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="userid" autocomplete="off" name="userid" value="${userlist.userid }"
							 />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							密码:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="password" autocomplete="off" id="password"  value="${userlist.password }" 
								name="password" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							确认密码:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="password" name="repassword" autocomplete="off" value="${userlist.password }" equalTo="#password"  / >
							<span class="pn-fhelp">不修改请留空</span>
						</td>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							注册时间:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${userlist.register_time }" name="register_time" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							类型:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="typeId">
								<option value="1" <c:if test="${userlist.typeid=='营业员'}"> selected</c:if> >
									营业员
								</option>
								<option value="2" <c:if test="${userlist.typeid=='管理员'}"> selected</c:if> >
									管理员
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							真实姓名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${userlist.realname }" name="realname"
								maxlength="100" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							性别:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
						<label>
						     <input type="radio" checked="checked" value="男" name="gender" />
								男
							</label>
							<label>
								<input type="radio"  value="女" name="gender" />
								女
							</label>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							出生日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${userlist.birthday }" name="birthday" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							来自:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${userlist.address }" name="comefrom"
								maxlength="150" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							QQ:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${userlist.qq }" name="qq" maxlength="100" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							手机：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${userlist.tel }" name="tel" maxlength="100" />
						</td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="hidden" name="hidden" value="002" />
							<input type="submit" value="保存" class="submit" />
							&nbsp;
							<input type="reset" value="重置" onClick="document.forms[0].reset()" class="reset" />
						</td>
					</tr>		     
			     </c:if>	   
			   </c:forEach>
				</table>
			</form>
		</div>
	</body>
</html>
