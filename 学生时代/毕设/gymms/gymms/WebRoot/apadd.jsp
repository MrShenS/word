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
		<script type='text/javascript' src='/gymms/dwr/interface/JCusBiz_D.js'></script>
        <script type='text/javascript' src='/gymms/dwr/engine.js'></script>
         <script type='text/javascript' src='/gymms/dwr/util.js'></script>





		
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

   function check_name() {
    
	var aname = document.aFoem.ap.value;
	
	
	if(aname=='' && aname.length==0) {
		alert("器械名不能为空");
		return;
	}

	JCusBiz_D.check_aname(aname,tiantianxiangshang);
	 
	 
}
 
 function tiantianxiangshang(isExit) {
	if(false==isExit) {
		document.getElementById("c001").style.display="block";
		document.getElementById("c002").style.display="none";
	} else {
		document.getElementById("c002").style.display="block";
		document.getElementById("c001").style.display="none";
	}
}

 function check_aid() {
 
    
	var aid = document.aFoem.hao.value;
	
	if(aid=='' && aid.length==0) {
		alert("器械编号不能为空");
		return;
	}
	JCusBiz_D.check_aid(aid,tiantianxiangshang1);
}
 function tiantianxiangshang1(isExit) {
	if(false==isExit) {
		document.getElementById("p001").style.display="block";
		document.getElementById("p002").style.display="none";
	} else {
		document.getElementById("p002").style.display="block";
		document.getElementById("p001").style.display="none";
	}
}
</script>
	<body>
		<div class="box-positon">
			<div class="rpos">
				当前位置: 器械信息 - 器械增加 - 列表
			</div>

			<form class="ropt" >
				<input class="add" type="submit" value="返回"
					onclick="this.form.action='DeviceServlet';" />
			</form>
			<div class="clear"></div>

		</div>
		
		<div class="body-box">
			<form method="post" action="DeviceServlet"  name="aFoem">
				<table width="100%" class="pn-ftable" cellpadding="2"
					cellspacing="1" border="0">
					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							器械名称：
						</td>

						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="ap" onmousemove="" onblur='check_name()'/>
                            <div id="c001" style="display:none;font-size:10px;color:green;">器械名可用</div>
						    <div id="c002" style="display:none;font-size:10px;color:red;">器械名被占用</div>
						</td>

						<td width="12%" class="pn-flabel pn-flabel-h">
							器械编号：
						</td>

						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="hao" onmousemove="" onblur='check_aid()' />
							  <div id="p001" style="display:none;font-size:10px;color:green;">器械编号可用</div>
						    <div id="p002" style="display:none;font-size:10px;color:red;">器械编号被占用</div>
					</tr>

					<tr>
						<td width="12%" class="pn-flabel pn-flabel-h">
							负责人：
						</td>

						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="principal" onmousemove="">

						</td>
						<td width="12%" class="pn-flabel pn-flabel-h">
							放入场地：
						</td>

						<td colspan="1" width="38%" class="pn-fcontent">
							<input type="text" name="number" onmousemove="">

						</td>
					</tr>

					 
			    <tr>
			    <td width="12%" class="pn-flabel pn-flabel-h">
				     进入时间：
				 </td>
				 
			<td colspan="1" width="38%" class="pn-fcontent">
				<input type="text" name="entertime" class="Wdate" value=" "  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">

					  
				 </td>
				 <td width="12%" class="pn-flabel pn-flabel-h">
				     使用时间：
				 </td>
				 
				<td colspan="1" width="38%" class="pn-fcontent">
				<input type="text" name="lifetime" class="Wdate" value=" "  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>

				 </td>
				 
			   </tr>
					<tr>

						
						<td width="12%" class="pn-flabel pn-flabel-h">
							基本信息：
						</td>
						<td colspan="3" width="38%" class="pn-fcontent">
							<textarea rows="3" cols="30" name="news"> </textarea>

						</td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="hidden" name="hidden" value="001" />
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
