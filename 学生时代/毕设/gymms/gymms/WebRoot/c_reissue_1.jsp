<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'c_reissue_1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    
			<form method="post" action="CardInfoServlet?cardid=${ cib.cardid}" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="username" maxlength="100" value="${cib.mname }"
								readonly="true" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡号:
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="cardid" readonly="true" value="${cib.cardid }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡类型
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cardtype" class="type" readonly="true" value="${cib.cardtype }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡余额
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cmoney" class="money" readonly="true" value="${cib.money }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							开始日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="start" readonly="true" value="${cib.startdate }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							结束日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="over" readonly="true" value="${cib.overdate }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡状态:
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="state" readonly="true" value="${cib.cardstate }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							请输入新的卡号:
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="newcardid" />
						</td>
						<td>
						          <input type="hidden" value="r001" name="recharge_hidden">
						  </td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="submit" value="更改" class="submit" />
							&nbsp;
							<input type="reset" value="取消" class="reset" />
						</td>
					</tr>
				</table>
			</form>
  </body>
</html>
