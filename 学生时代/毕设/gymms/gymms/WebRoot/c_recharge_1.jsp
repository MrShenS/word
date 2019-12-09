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
	f.action="o_delete_login_failure.do";
	f.submit();
}



		var xmlRequest;
			function send_request() {
					xmlRequest = false;
					if(window.XMLHttpRequest) {
						xmlRequest = new XMLHttpRequest();
					} else {
						if(window.ActiveXObject) {
							try {
								xmlRequest = new ActiveXObject("MSxml2.XMLHTTP");
							} catch(e) {
								try {
									xmlRequest = new ActiveXObject("Microsoft.XMLHTTP");
								} catch(e) {
								
								}
							}
							
						}
						
					}

					var cardid = document.cardmanager.cardid.value;
					if(cardid=='' && cardid.length==0) {
						alert("卡号为空，请输入卡号！！！");
						return ;
					}
					var url = "CardInfoServlet?cardid="+cardid+"&rdnumber="+Math.random();
					
					
					xmlRequest.onreadystatechange=haolejiaowo;
					xmlRequest.open("GET",url,true);
					xmlRequest.send(null);
					
					if(!xmlRequest) {
						alert("XMLHttpRequest创建失败");
					}
			}
			
			function haolejiaowo() {
				if(xmlRequest.readyState==4 && xmlRequest.status==200) {
					var flag = xmlRequest.responseText;
					document.getElementById('t001').innerHTML=flag;
				}
				
			}
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置:卡管理 - 充值
			</div>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form  method="post" name="cardmanager"
				style="padding-top:5px;">
				请输入卡号:
				<input type="text" name="cardid" value="${cb.cardid }" style="width:150px" />
				<input class="query" type="button" value="查询" onclick="send_request()" />
			</form>
		</div>
		<div id="t001" class="body-box" >
			<form method="post" action="CardInfoServlet" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					

					
						<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
								会员名：
							</td>
							<td colspan="3" width="38%" class="pn-fcontent">
								<input type="text" name="username" maxlength="100" value="${cb.mname}"
									readonly="true" />
							</td>
						</tr>
						<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
								卡号：
							</td>
							<td colspan="3" width="38%" class="pn-fcontent">
								<input type="text" name="cardid"  value="${ cb.cardid}" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td width="12%" class="pn-flabel pn-flabel-h">
								卡余额：
							</td>
							<td colspan="3" width="38%" class="pn-fcontent">
								<input type="text" name="cmoney" class="money" value="${cb.money }" readonly="true" />
							</td>
						</tr>
						<tr>
							<td  width="12%" class="pn-flabel pn-flabel-h">
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
		</div>
	</body>
</html>
