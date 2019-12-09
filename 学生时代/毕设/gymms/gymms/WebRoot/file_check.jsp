<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

     
	  
	   
	  
	  </script>


	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 健身管理 - 场地信息 - 列表
			</div>

			<form class="ropt">
				<input class="add" type="submit" value="增加"
					onclick="this.form.action='add_field.jsp';" />
			</form>
			<div class="clear"></div>

		</div>
		
		<div class="body-box">
			<form action="FieldInfoServlet?ids=001" method="post">

				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							场地名：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<select name="roomname"> 
							
							<c:forEach var="flist" items="${flist }">
							    <option value="${flist.roomname }">
									${flist.roomname }
								</option>
						    </c:forEach>
						    
							</select>
							<input class="query" type="submit" value="查询" />
						</td>

						<td align="center" colspan="1" width="41%" class="pn-fcontent">
							<a href="FieldInfoServlet?did=003&roomname=${fib.roomname }"
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
							场地名称：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							${fib.roomname }
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							照片：
						</td>
						<td  align="center" rowspan="5" colspan="1" class="pn-fcontent">
						     <img  src="${fib.roomphoto }" />
						</td>
						
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							容纳人数：
						</td>
						<td colspan="2" width="36%" class="pn-fcontent">
							${fib.accountnumber }
						</td>
					</tr>
					
              
				</table>
				</div>
			</form>
		</div>
	</body>
</html>
