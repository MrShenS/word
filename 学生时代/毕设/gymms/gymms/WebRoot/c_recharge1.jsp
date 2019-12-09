<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'c_recharge1.jsp' starting page</title>
    
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

			<form method="post" action="CardInfoServlet" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					
				
					
						<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
								会员名：
							</td>
							<td colspan="3" width="38%" class="pn-fcontent">
								<input type="text" name="username" maxlength="100" value="${cib.mname}" readonly="true" />
							</td>
						</tr>
						<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
								卡号：
							</td>
							<td colspan="3" width="38%" class="pn-fcontent">
								<input type="text" name="cardid"  value="${ cib.cardid}" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
								卡余额：
							</td>
							<td colspan="3" width="38%" class="pn-fcontent">
								<input type="text" name="cmoney" class="money" value="${cib.money }" readonly="true" />
							</td>
						</tr>
						<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
								充值金额：
							</td>
							<td colspan="3" width="38%" class="pn-fcontent">
								<input type="text" name="recharge_cmoney" class="money" />
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pn-fbutton">
								<input type="submit" value="更改" class="submit" />
								&nbsp;
								<input type="reset" value="取消" class="reset" />
							</td>
							<td>
						          <input type="hidden" value="r002" name="recharge_hidden">
						  </td>
							
						</tr>
				
					
				</table>
			</form>
	
  </body>
</html>
