<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		var xmlRequest;
			function search_cardinfo() {
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

					var info = document.mcardinfo.info.value;
					var op = document.mcardinfo.carssearch.value;
					var id = document.getElementById('r002').name;
					if(info=='' && info.length==0) {
						alert("请输入你要查询的字段内容！！！");
						return ;
					}
					var url = "CheckCardInfoServlet?info="+info+"&id="+id+"&op="+op+"&rdnumber="+Math.random();
					
					
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
					//alert(flag);
					document.getElementById('m001').innerHTML=flag;
				}
				
			}
			
			
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 会员管理 - 卡信息
			</div>
				<div class="clear"></div>
		</div>
		<div class="body-box">
			<form  method="post" name="mcardinfo" id="r002"
				style="padding-top:5px;">
				<tr>
						<td  width="12%" class="pn-flabel pn-flabel-h">
							<select name="carssearch">
								<option value="1" >
									卡号
								</option>
								<option value="2">
									身份证
								</option>
							</select>
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<input type="text" name="info" onblur="search_cardinfo()"/>
						</td>
					</tr>
				
			</form>
		</div>
		<div id="m001">
			
		</div>
	</body>
</html>