<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
<script src="./res/jeecms/js/admin.js" type="text/javascript"></script><script src="./res/common/js/message.js" type="text/javascript"></script>
<script type="text/javascript">


</script>

  </head>
  
  <body>
    <div class="box-positon">
			<div class="rpos"> 
				l当前位置: 站内信管理 - 查看邮件 
			</div>
			<form class="ropt" action="email_list.jsp" method="post"
				id="listFrom">
				<input type="hidden" name="box" value="0" id="box" />
				<input class="send-message" type="submit" value="发送站内信"
					onclick="this.form.action='send_email.jsp'" />
				<input class="inbox" type="button" value="收件箱管理" onclick="window.location='email_list.jsp'" />
			</form>
			<div class="clear"></div>
		</div>
		<c:set var="email" scope="page" value="${requestScope.email_show}"></c:set>
		  <table>
		  <tr>
		    <td> <h2  id="titleId">${email.title }</h2></td>
		  </tr>
		  <tr>
		    <td> 发件人:<span>${email.send_name }</span></td>
		      </tr>
		    <tr> 
		    <td> 时间: <span>${email.sendDate }</span></td>
		    </tr>	
		  </table>	
		  	 <hr size="1">	
		 <div align="center">
		 <div align="left">
		    <p>
	    <font size="4">
	    <p>
	      ${email.context }  
	    </p>
	   
	    </font>	  
		    </p>
		    </div>
		 </div>  	 
  </body>
</html>