<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
			function cardreissue() {
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

					var cardid = document.cardReissue.cardid.value;
					var id = document.getElementById('r002').name;
					if(cardid=='' && cardid.length==0) {
						alert("卡号为空，请输入卡号！！！");
						return ;
					}
					var url = "CardInfoServlet?cardid="+cardid+"&id="+id+"&rdnumber="+Math.random();
					
					
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
					document.getElementById('r001').innerHTML=flag;
				}
				
			}
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置:卡管理 - 补发
			</div>
				<div class="clear"></div>
		</div>
		<div class="body-box">
			<form name="cardReissue" method="post" id="r002"
				style="padding-top:5px;">
				请输入卡号:
				<input type="text" name="cardid" value="${ cb.cardid }" style="width:150px" />
				<input class="query" type="button" value="查询" onclick="cardreissue()" />
			</form>
		</div>

		<div id="r001" class="body-box">
			<form method="post" action="CardInfoServlet?cardid=${ cb.cardid}" id="jvForm">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							会员名:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="username" maxlength="100" value="${cb.mname }"
								readonly="true" />
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡号:
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="cardid" readonly="true" value="${cb.cardid }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡类型
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cardtype" class="type" readonly="true" value="${cb.cardtype }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡余额
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="cmoney" class="money" readonly="true" value="${cb.money }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							开始日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="start" readonly="true" value="${cb.startdate }"/>
						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							结束日期:
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="over" readonly="true" value="${cb.overdate }"/>
						</td>
					</tr>
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							卡状态:
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="text" maxlength="50" name="state" readonly="true" value="${cb.cardstate }"/>
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
		</div>
	</body>
</html>

