<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});

var xmlRequest;
function personal_trainer() {
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

					var cardid = document.trainer.cardid.value;
					var id = document.getElementById('p001').name;
					if(cardid=='' && cardid.length==0) {
						alert("卡号为空，请输入卡号！！！");
						return ;
					}
					var url = "PurchaseTrainerServlet?cardid="+cardid+"&id="+id+"&rdnumber="+Math.random();
					
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
					document.getElementById('p002').innerHTML=flag;
				}
				
			}
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 会员管理 - 购买私教
			</div>
			<div class="clear"></div>
		</div>
		<div class="body-box">
			<form  method="post" name="trainer" id="p001" >
				请输入卡号:
				<input type="text" name="cardid"  style="width:150px" />
				<input class="query" type="button" value="查询" onclick="personal_trainer()" />
			</form>
		</div>
		<div id="p002" class="body-box" >
			
		</div>
	</body>
</html>