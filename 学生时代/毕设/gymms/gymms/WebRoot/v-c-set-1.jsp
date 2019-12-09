<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'v-c-set-1.jsp' starting page</title>
    
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
    	<form method="post"  name="cardinfo" id="r002">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="mname" readonly="true" value="${cb.mname }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员ID:
						</td>
					       	<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="id" readonly="true" value="${cb.mid }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡号:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cardid" readonly="true" value="${cb.cardid }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡类型:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cardid" readonly="true" value="${cb.cardtype }"/>
						</td>
					</tr>
					<tr>
					    <td width="12%" class="pn-flabel pn-flabel-h">
							卡状态:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cardid" readonly="true" value="${cb.cardstate }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							可消费金额:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="money" readonly="true" value="${cb.money }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							开始时间:
						</td>
					  <td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="startdate" class="Wdate" readonly="true" value="${cb.startdate }"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							结束时间:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="overdate" class="Wdate" readonly="true" value="${cb.overdate }"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							备注:
						</td>
						<td colspan="3" width="88%" class="pn-fcontent">
							<textarea cols="70" rows="5" name="content" maxlength="255">${cb.content }</textarea>
						</td>
						<td>
						          <input type="hidden" value="r004" name="recharge_hidden">
						  </td>
					</tr>
				</table>
			</form>
  </body>
</html>
