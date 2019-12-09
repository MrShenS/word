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

		<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});

     
	  
	     
	      function fun_change(){
		  
		    window.open('coach.html','lession','scrollbars,top=100,left=300,resizeable=0');
		      
			  
		  }
	  
	  </script>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 器械信息 - 器械查询 - 列表
			</div>

			<form class="ropt">
				<input class="add" type="submit" value="增加"
					onclick="this.form.action='apadd.jsp';" />
			</form>
			<div class="clear"></div>

		</div>
		<div class="body-box">
			<form method="post" action="DeviceServlet">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							器械名称:
						</td>
						 
						 <td colspan="1" width="30%" class="pn-fcontent">
							<input type="text" name="name" value="${db.devicename }"  />
						</td>

						 <td colspan="1" width="35%" class="pn-fcontent">

							<input class="add" type="submit" value="确定" />
						</td>

						<td align="center" colspan="1" width="23%" class="pn-fcontent">
							<a href="DeviceServlet?ids=${db.deviceid }" class="pn-opt">修改</a> |
							<a href="DeviceServlet?id=${db.deviceid }"
								onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a>
						</td>
					</tr>
				</table>
                

				<BR />
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
              

					<tr>
						<td width="15%" class="pn-flabel pn-flabel-h">
							器械名称：
						</td>
						
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="ap" value="${db.devicename }" readonly="readonly"/>
						</td>
						
						<td width="15%" class="pn-flabel pn-flabel-h">
							器械编号：
						</td>
						
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="hao" value="${db.deviceid }"  readonly="readonly" />
						</td>


					</tr>

					<tr>
						<td width="15%" class="pn-flabel pn-flabel-h">
							进入时间：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="entertime" value="${db.entrancetime }" readonly="readonly" />
						</td>
						<td width="15%" class="pn-flabel pn-flabel-h">
							过期时间：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="lifetime" value="${db.usetime}"  readonly="readonly" />
						</td>


					</tr>
					<tr>
						<td width="15%" class="pn-flabel pn-flabel-h">
							负责人：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="principal" value="${db.principal }"  readonly="readonly" />
						</td>
						<td width="15%" class="pn-flabel pn-flabel-h">
							放入场地：
						</td>
						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="number" value="${db.room }"   readonly="readonly" />
						</td>


					</tr>

					<tr>
						<td width="15%" class="pn-flabel pn-flabel-h">
							器械基本信息：
						</td>
						<td width="38%" class="pn-fcontent" colspan="3">
							<textarea cols="50" rows="2" border="false" name="news"  readonly="readonly">${db.brief }</textarea>
						</td>

					</tr>

				</table>
              </form>
			
		</div>

	</body>

</html>
