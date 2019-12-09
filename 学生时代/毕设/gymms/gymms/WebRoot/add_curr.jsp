<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	</script>

	</head>


	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 健身管理 - 增加课程 - 页面
			</div>
			<form class="ropt">
				<input class="add" type="submit" value="返回"
					onclick="this.form.action='curriculum-check.jsp';" />
			</form>
		</div>
		<div class="body-box">
			<form method="post" action="CourseServlet?id=003" id="jvForm">

				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">

					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							课程名称：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="coursename" value="" size="30" />
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							课程教练：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<select name="coachname"> 
							<c:forEach var="clist" items="${coachList }">
							    <option value="${clist.cname }">
									${clist.cname }
								</option>
						    </c:forEach>
							</select>
						</td>
					</tr>

					<tr>
					    <td width="14%" class="pn-flabel pn-flabel-h">
							授课教室：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<select name="roomname"> 
							<c:forEach var="rlist" items="${roomList }">
							    <option value="${rlist.roomname }">
									${rlist.roomname }
								</option>
						    </c:forEach>
							</select>
						</td>
						<td width="14%" class="pn-flabel pn-flabel-h">
							课程总人数：
						</td>
						<td colspan="1" width="36%" class="pn-fcontent">
							<input type="text" name="carpnumber" value="" class="p" border="false"
								size="30" />
						</td>				
					</tr>
					<tr>
						<td width="14%" class="pn-flabel pn-flabel-h">
							所用器材：
						</td>
						<td colspan="3" width="36%" class="pn-fcontent">
							<select name="devicename"> 
							<c:forEach var="dlist" items="${deviceList }">
							    <option value="${dlist.devicename }">
									${dlist.devicename }
								</option>
						    </c:forEach>
							</select>
						</td>
					</tr>

					<tr>

						<td width="14%" class="pn-flabel pn-flabel-h">
							课程好处：
						</td>
						<td width="36%" class="pn-fcontent" align="left" colspan="3">
							<textarea cols="50" rows="5" name="benifits"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="hidden" name="id" value="5" />
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



