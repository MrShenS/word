<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
$(function() {
	$("#jvForm").validate();
});
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 教练信息 - 修改
			</div>
			<form class="ropt" method="get">
				<input type="submit" value="返回列表" onclick="this.form.action='CoachInfoServlet'"
					class="return-button" />
			</form>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form method="post" action="CoachInfoServlet" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<c:forEach var="clist" items="${clist}">
					<c:if test="${clist.cno==param.cno}">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							教练编号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cno" value="${clist.cno}" readonly="true">
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							身份证号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="ID" value="${clist.cid}">
						</td>
					</tr>

					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							真实姓名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="realname" maxlength="100" value="${clist.cname}"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							性别:
						</td>
						
						<td colspan="1" width="38%" class="pn-fcontent">
							<label>
								<input type="radio" value="true" <c:if test="${clist.sex=='男'}"> checked="checked"</c:if>name="gender" />
								男
							</label>
							<label>
								<input type="radio" value="false" name="gender" <c:if test="${clist.sex=='女'}"> checked="checked"</c:if> />
								女
							</label>
						</td>
						
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							出生日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="birthday" class="Wdate" value="${clist.birthday}"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							来自:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${clist.address}" name="comefrom" maxlength="150" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							QQ:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="qq" maxlength="100" value="${clist.qq}"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							电子邮箱:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" value="${clist.email}" name="email"
								class="email" size="30" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							类型:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="typeId">
								<option value="1" <c:if test="${clist.type=='健身教练'}">selected </c:if> >
									健身教练
								</option>
								<option value="2" <c:if test="${clist.type=='私人教练'}"> selected</c:if> >
									私人教练
								</option>
							</select>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							手机:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mobile" maxlength="50" value="${clist.tel }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							照片:
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="file" name="photofile" value="${clist.photofile }" maxlength="100" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							个人介绍:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<textarea cols="70" rows="5" name="intro" maxlength="255" >${clist.description}</textarea>
						</td>
						<td><input type="hidden" value="001" name="hidden">
						</td>
					</tr>
					</c:if>
					</c:forEach>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="hidden" name="id" value="5" />
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
