<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  </head>
  
  <body>
			<form method="post" name="personaltrainer" action="PurchaseTrainerServlet?cardid=${ cib.cardid}">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mname" value="${cib.mname }"
								readonly="true"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡类型:
						</td>
						<td colspan="1" width="88%" class="pn-fcontent">
							<input type="text" name="cardtype" class="type" readonly="true" value="${cib.cardtype }"/>
						</td>
					</tr>
					<tr>
					    <td width="12%" class="pn-flabel pn-flabel-h">
							卡余额:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="money" readonly="true" value="${cib.money }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							课程名:
						</td>
						<td colspan="1" width="88%" class="pn-fcontent">
							<select name="coursename">
							
								<option value="瑜伽" selected="selected">
									瑜伽
								</option>
								<option value="瑜伽">
									瑜伽
								</option>
								<option value="瑜伽">
									瑜伽
								</option>
								
							</select>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							教练:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<select name="coachname"> 
							<c:forEach var="clist" items="${clist }">
							    <option value="${clist.cname }">
									${clist.cname }
								</option>
								<%--
								<option value="1" selected="selected">
									张三
								</option>
								<option value="2">
									李四
								</option>
								<option value="3">
									王五
								</option>
								--%>
						    </c:forEach>
							</select>
						</td>
					</tr>
				    <tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							备注:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<textarea cols="70" rows="5" name="content" maxlength="255"
								></textarea>
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
  </body>
</html>
