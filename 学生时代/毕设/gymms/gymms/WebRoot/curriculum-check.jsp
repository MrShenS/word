<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


         <style>  
	  .p{border-left-width :0px;
	    border-right-width : 0px;
		border-top-width : 0px;
		border-style:none
	  }
	  </style>
	  
	  var xmlRequest;
			function checkcourse() {
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

					var cardid = document.cardLost.cardid.value;
					var id = document.getElementById('r002').name;
					if(cardid=='' && cardid.length==0) {
						alert("卡号为空，请输入卡号！！！");
						return ;
					}
					var url = "CourseServlet?courseid="+courseid+"&id="+id+"&rdnumber="+Math.random();
					
					
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
					document.getElementById('t003').innerHTML=flag;
				}
				
			}
	</script>
	</head>


	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 健身管理 - 健身课程 - 页面
			</div>

			<form class="ropt" action="CourseServlet?id=002" method="post">
				<input class="add" type="submit" value="增加"/>
			</form>

			<div class="clear"></div>

		</div>
		<div class="body-box">
			<form action="CourseServlet?id=001" method="post">

				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							课程名：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="coursename"> 
							
							<c:forEach var="courseNameList" items="${courseNameList }">
							    <option value="${courseNameList.coursename }">
									${courseNameList.coursename }
								</option>
						    </c:forEach>
						    
							</select>
							<input class="query" type="submit" value="查询" />
						</td>

						<td align="center" colspan="1" width="41%" class="pn-fcontent">
							<a href="revamp_cur.html?id=5&pageNo=" class="pn-opt">修改</a> |
							<a href="o_delete.do?ids=5&pageNo="
								onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
						</td>
					</tr>

				</table>
				<br />
                 <div class="body-box" id='div001'>
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">

					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							课程名称：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							${cb.coursename }
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							课程编号：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							${cb.courseid }
						</td>
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							授课教练：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							${cb.coachname }
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							授课教室：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							${cb.roomname }
						</td>
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							课程上线人数：
						</td>
						<td colspan="3" width="36%" class="pn-fcontent">
							${cb.carpnumber }
						</td>
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							所用器材：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							${cb.devicename }
						</td>

						<td width="14%" class="pn-flabel pn-flabel-h">
							课程好处：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent" align="left">
							${cb.benifits }
						</td>
					</tr>
              
				</table>
				</div>
			</form>
		</div>
	</body>
</html>
