<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>健身房管理系统</title>
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
       
       <script type="text/javascript" src="res/common/js/jquery-1.4.2.js"></script>
       <script type="text/javascript" src="res/common/js/jquery-1.4.2-vsdoc.js"></script>
		<script src="./thirdparty/fckeditor/fckeditor.js"
			type="text/javascript"></script>
		<script src="./thirdparty/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>
		<script src="./res/common/js/jquery.js" type="text/javascript"></script>
		<script src="./res/common/js/jquery.ext.js" type="text/javascript"></script>
		<script src="./res/common/js/pony.js" type="text/javascript"></script>
		<script src="./res/jeecms/js/admin.js" type="text/javascript"></script>
		<style type="text/css">
* {
	margin: 0;
	padding: 0
}

a:focus {
	outline: none;
}

html {
	height: 100%;
	overflow: hidden;
}

body {
	height: 100%;
}

#top {
	background-color: #1d63c6;
	height: 69px;
	width: 100%;
}

.logo {
	width: 215px;
	height: 69px;
}

.topbg {
	background: url(./res/jeecms/img/admin/top-tbg.png) no-repeat;
	height: 38px;
}

.login-welcome {
	padding-left: 20px;
	color: #fff;
	font-size: 14px;
	background: url(./res/jeecms/img/admin/topbg.gif) no-repeat;
}

.login-welcome a:link,.login-welcome a:visited {
	color: #fff;
	font-size: 14px;
	text-decoration: none;
}

#welcome {
	color: #FFFFFF;
	padding: 0 30px 0 5px;
}

#logout {
	color: #FFFFFF;
	padding-left: 5px;
}

.nav {
	height: 31px;
	overflow: hidden;
}

.nav-menu {
	background: url(./res/jeecms/img/admin/bg.png) repeat-x;
	height: 31px;
	list-style: none;
	padding-left: 20px;
	font-size: 13px;
}

.nav .current {
	background: url(./res/jeecms/img/admin/navcurrbg.gif) no-repeat 0px 2px;
	color: #fff;
	width: 72px;
	text-align: center;
}

.nav .current a {
	color: #fff;
}

.nav-menu li {
	height: 31px;
	text-align: center;
	line-height: 31px;
	float: left;
}

.nav-menu li a {
	color: #2b2b2b;
	font-weight: bold;
}

.nav-menu li.sep {
	background: url(./res/jeecms/img/admin/step.png) no-repeat;
	width: 2px;
	height: 31px;
	margin: 0px 5px;
}

.nav .normal {
	width: 57px;
	text-align: center;
}

.top-bottom {
	width: 100%;
	background: url(./res/jeecms/img/admin/bg.png) repeat-x 0px -34px;
	height: 3px;
}

.undis {
	display: none;
}

.dis {
	display: block;
}
</style>

<script type="text/javascript">
            var xmlRequest =false;
            
			function countUnreadMsg() {
			
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
				    var url = "ShowEmailCountServlet?rdnumber="+Math.random();	
					xmlRequest.onreadystatechange=haolejiaowo;
					xmlRequest.open("GET",url,true);
					xmlRequest.send(null);
						if(!xmlRequest) {
							alert("XMLHttpRequest创建失败");
						}
					}
				}
				
				
				function haolejiaowo() {
				
				if(xmlRequest.readyState==4 && xmlRequest.status==200) {
					var flag = xmlRequest.responseText;
					document.getElementById('countDiv').innerText=flag;
				}
			}
			
			setInterval("countUnreadMsg()",1000*3);
</script>
	</head>

	<body onload="countUnreadMsg()">
		<div id="top">
			<div class="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="215">
							<div class="logo">
								<img src="./res/jeecms/img/admin/logo.jpg" width="215"
									height="69" />
							</div>
						</td>
						<td valign="top">
							<div class="topbg">
								<div class="login-welcome">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="320" height="38">
												<img src="./res/jeecms/img/admin/welconlogin-icon.png" />
												<span id="welcome">您好, ${sessionScope.username} </span>
												<img src="./res/jeecms/img/admin/loginout-icon.png" />
												<a href="login.jsp?returnUrl=login.jsp" target="_top"
													id="logout" onclick="return confirm('您确定退出吗？');">退出</a>
												<img src="./res/jeecms/img/admin/message-unread.png" />
												
												<a href="email_list.jsp" target="rightFrame">您有<span id="countDiv"></span>条信息未读</a>
											</td>
											<td align="right">
												<form action="index.do" target="_top" method="get">
													<select name="_site_id_param"
														onchange="this.form.submit();">
														<option value="1" selected="selected">
															关于我们
														</option>
													</select>
												</form>
											</td>
											<td width="100">
												&nbsp;
												<a id="view_index" href="/" target="_blank">【查看首页】</a>
												<!--
                                    &nbsp;<a style="color:#FFF" href="javascript:alert($(document).width()+','+$(document).height())">【窗口大小】</a>
                                    -->
											</td>
										</tr>
									</table>
								</div>
								<div class="nav">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td
												style="background-image: url('./res/jeecms/img/admin/nav-left.png')"
												width="14" height="31"></td>
											<td>
												<ul class="nav-menu">
													<li class="current" id="tb_11" onclick="HoverLi(1,1,11);">
														<a href="welcome.jsp" target="rightFrame">首页</a>
													</li>
													<li class="sep"></li>
													<li class="normal" id="tb_12" onclick="HoverLi(1,2,11);">
														<a href="frame/channel_main.do" target="mainFrame">健身管理</a>
													</li>
													<li class="sep"></li>
													<li class="normal" id="tb_14" onclick="HoverLi(1,4,11);">
														<a href="frame/template_main.do" target="mainFrame">教练管理</a>
													</li>
													<li class="sep"></li>
													<li class="normal" id="tb_15" onclick="HoverLi(1,5,11);">
														<a href="frame/resource_main.do" target="mainFrame">用户管理</a>
													</li>
													<li class="sep"></li>
													<li class="normal" id="tb_16" onclick="HoverLi(1,6,11);">
														<a href="frame/assistant_main.do" target="mainFrame">权限管理</a>
													</li>
													<li class="sep"></li>
													<li class="normal" id="tb_17" onclick="HoverLi(1,7,11);">
														<a href="frame/maintain_main.do" target="mainFrame">会员管理</a>
													</li>
													<li class="sep"></li>
													<li class="normal" id="tb_18" onclick="HoverLi(1,8,11);">
														<a href="frame/generate_main.do" target="mainFrame">访客管理</a>
													</li>
						
													<li class="sep"></li>
													<li class="normal" id="tb_110" onclick="HoverLi(1,10,11);">
														<a href="frame/config_main.do" target="mainFrame">卡管理</a>
													</li>
													<li class="sep"></li>
													<li class="normal" id="tb_111" onclick="HoverLi(1,11,11);">
														<a href="frame/statistic_main.do" target="mainFrame">统计报表</a>
													</li>
												</ul>
											</td>
										</tr>
									</table>
								</div>
							</div>
					</tr>
				</table>
			</div>
		</div>
		<div class="top-bottom"></div>
	</body>
</html>