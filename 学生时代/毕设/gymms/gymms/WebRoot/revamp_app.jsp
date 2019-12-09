<%@ page language="java" import="java.util.*,com.csu.gymms.entity.DeviceInfoBean" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<link href="./res/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="./res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<script src="./thirdparty/fckeditor/fckeditor.js" type="text/javascript"></script>
<script src="./thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="./res/common/js/jquery.js" type="text/javascript"></script>
<script src="./res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="./res/common/js/pony.js" type="text/javascript"></script>
<script src="./res/jeecms/js/admin.js" type="text/javascript"></script>
		
		<script type="text/javascript">
$(function() {
	$("#jvForm").validate();
});
		
		</script>
		
		  
		
<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 器械信息 - 器械修改 - 列表
			</div>
			
			  <form class="ropt">
				<input class="add" type="submit" value="返回"
					onclick="this.form.action='DeviceServlet';" />
			</form>
	    
	         
	     <form action="DeviceServlet" method="post">
	     
	   
	     <table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
		      <tr>
			     <td width="12%" class="pn-flabel pn-flabel-h">
				     器械名称：
				 </td>
				 
				   <td colspan="1" width="38%" class="pn-fcontent">	 
					  <input type="text" name="ap" value="${db.devicename } " readonly="readonly" />
					  
				 </td>
				 
				  <td width="12%" class="pn-flabel pn-flabel-h">
				     器械编号：
				</td>
				
				<td colspan="1" width="38%" class="pn-fcontent">	 	 
					  <input type="text" name="hao" value="${db.deviceid } " readonly="readonly"/>
			   </tr>
			   
			    <tr>
			     <td width="12%" class="pn-flabel pn-flabel-h">
							负责人：
						</td>

						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="principal" value="${db.principal}">

						</td>
				  <td width="12%" class="pn-flabel pn-flabel-h">
				     放入场地：
				</td>
				
					 	<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="number" value="${db.room }">

						</td>
			   </tr>
			   
			    <tr>
			    <td width="12%" class="pn-flabel pn-flabel-h">
				     进入时间：
				 </td>
				 
			<td colspan="1" width="38%" class="pn-fcontent">
				<input type="text" name="entertime" class="Wdate" value="${db.entrancetime }"   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">

					  
				 </td>
				 <td width="12%" class="pn-flabel pn-flabel-h">
				     使用时间：
				 </td>
				 
				<td colspan="1" width="38%" class="pn-fcontent">
				<input type="text" name="lifetime" class="Wdate" value="${db.usetime}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>

				 </td>
				 
			   </tr>
			    <tr>
				
				
			     <td width="12%" class="pn-flabel pn-flabel-h">
				     基本信息：
				</td>
				<td colspan="3" width="38%" class="pn-fcontent"	>  
					   <textarea rows="3" cols="30" name="news">${db.brief }</textarea>
					  
				 </td>
			   </tr>
			     <tr>
						<td colspan="4" class="pn-fbutton">
							<input type="hidden" name="hidd" value="002" />
							<input type="submit" value="提交" class="submit" />
							&nbsp;
							<input type="reset" value="重置" class="reset" />
						</td>
					</tr>
			 </table>
		 </form>
		</div>
		</body>
		</html>
		