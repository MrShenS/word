<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
				当前位置: 会员信息 - 修改
			</div>
			<form class="ropt">
				<input type="submit" value="返回列表" onclick="this.form.action='MemberServlet'" 
					class="return-button" />
			</form>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form method="post" action="MemberServlet" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<c:forEach var="mList" items="${mList}">
					<c:if test="${mList.mno==param.mno}">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mname" value="${mList.mname}"
								maxlength="100" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							身份证号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="id" value="${mList.id}"
								maxlength="100" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员编号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mno" readonly="readonly" class="required" value="${mList.mno}"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							电子邮箱:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="email" class="email" size="30" value="${mList.email}"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员组:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="mgroup">
								<option value="1" <c:if test="${mList.mgroup=='普通会员'}">selected </c:if> >
									普通会员
								</option>
								<option value="2" <c:if test="${mList.mgroup=='VIP'}">selected </c:if> >
									VIP会员
								</option>
							</select>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							性别:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<label>
								<input type="radio" value="男" name="sex" <c:if test="${mList.sex=='男'}"> checked="checked"</c:if>/>
								男
							</label>
							<label>
								<input type="radio" value="女" name="sex" <c:if test="${mList.sex=='女'}"> checked="checked"</c:if>/>
								女
							</label>
						</td>
					</tr>
					<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
							出生日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="birthday" class="Wdate" value="${mList.birthday}"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
							<td width="12%" class="pn-flabel pn-flabel-h">
							QQ:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="100" name="qq" value="${mList.qq}"/>
						</td>
						
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							电话:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="telphone" value="${mList.telphone}"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							手机:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="phone" value="${mList.phone}"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							来自:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<input type="text" maxlength="150" name="address" size="70" value="${mList.address}"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							个人介绍:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<textarea cols="70" rows="5" name="description" maxlength="255"> ${mList.description}</textarea>
						</td>
					</tr>
					</c:if>
					</c:forEach>
					<tr>
					    <td><input type="hidden" value="002" name="hidden"></td>
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