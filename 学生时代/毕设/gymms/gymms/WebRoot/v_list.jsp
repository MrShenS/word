<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	f.action="AllDeleteServlet?mid=001";
	f.submit();
	
	var xmlRequest;
			function send_request(cno) {
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

					alert(mno);
					var url = "CheckMemberServlet?mno="+mno+"&rdnumber="+Math.random();
					
					
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
					document.getElementById('div001').innerHtml=flag;
				}
				
			}
}
</script>
	</head>
	<body>
		<div class="box-positon">
			<div class="rpos">&nbsp; 
				当前位置: 会员信息 - 列表 
			</div>
			<form class="ropt" action="CheckMemberServlet" method="post">
				<select name="flag">
								<option value="1">
									会员名
								</option>
								<option value="2">
									身份证
								</option>
							</select>
				<input type="text" name="text">
				 <input class="query" type="submit" value="查询"/>
				<input class="add" type="submit" value="添加"
					onclick="this.form.action='v_add.jsp';" />
			</form>
			<div class="clear"></div>
		</div>
		<div class="body-box" id='div001'>
			<form id="tableForm" method="post">
				<input type="hidden" name="pageNo" value="" />
				<table class="pn-ltable" style="" width="100%" cellspacing="1"
					cellpadding="0" border="0">
					<thead class="pn-lthead">
						<tr>
							<th width="20">
								<input type='checkbox' onclick='Pn.checkbox("ids",this.checked)' />
							</th>
							<th>
								会员编号
							</th>
							<th>
								会员名
							</th>
							<th>
								身份证号
							</th>
							<th>
								会员组
							</th>
							<th>
								邮箱
							</th>
							<th>
								操作选项
							</th>
						</tr>
					</thead>
					<tbody class="pn-ltbody">
					    <c:forEach var="mb" items="${mList }">
						<tr onmouseover="this.bgColor='#eeeeee'"
							onmouseout="this.bgColor='#ffffff'">
							<td>
								<input type='checkbox' name='ids' value='${mb.mno }' />
							</td>
							<td align="center">
								${mb.mno }
							</td>
							<td align="center">
								${mb.mname }
							</td>
							<td align="center">
								${mb.id }
							</td>
							<td align="center">
								${mb.mgroup }
							</td>
							<td align="center">
								${mb.email }
							</td>
							<td align="center">
								<a href="v_mod.jsp?mno=${mb.mno }" class="pn-opt">修改</a> |
								<a href="CheckMemberServlet?mno=${mb.mno}"
									onclick="if(!confirm('您确定删除吗？')) {return false;}"
									class="pn-opt">删除</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center" class="pn-sp">
							共 ${podi.itemcount}条&nbsp; 每页
							<input type="text" value="${podi.pagesize}" style="width: 30px" name="pagesize"
								onfocus="this.select();"
								onblur="$.cookie('_cookie_page_size',this.value,{expires:3650});"
								onkeypress="if(event.keyCode==13){$(this).blur();return false;}" />
							条&nbsp;
							<input class="first-page" type="button" value="首 页"
								onclick="_gotoPage('1');"  />
							<input class="pre-page" type="button" value="上一页"
								onclick="_gotoPage('2');"  />
							<input class="next-page" type="button" value="下一页"
								onclick="_gotoPage('3');"  />
							<input class="last-page" type="button" value="尾 页"
								onclick="_gotoPage('4');" />
							&nbsp; 当前${podi.curpage}/${podi.pagecount} 页 &nbsp;转到第
							<input type="text" id="_goPs" style="width: 50px"
								onfocus="this.select();"
								onkeypress="if(event.keyCode==13){$('#_goPage').click();return false;}" />
							页
							<input class="go" id="_goPage" type="button" value="转"
								onclick="_gotoPage('0000'+$('#_goPs').val());" />
						</td>
						<td>
						  <input type="hidden" value="000" name="hidden">
						</td>
					</tr>
				</table>
				<script type="text/javascript">
function _gotoPage(pageNo) {
	try{
		var tableForm = getTableForm();
		$("input[name=pageNo]").val(pageNo);
		tableForm.action="MemberServlet";
		tableForm.onsubmit=null;
		tableForm.submit();
	} catch(e) {
		alert('_gotoPage(pageNo)方法出错');
	}
}
</script>
				<div>
					<input class="del-button" type="button" value="删除"
						onclick="optDelete();" />
				</div>
			</form>
		</div>
	</body>
</html>