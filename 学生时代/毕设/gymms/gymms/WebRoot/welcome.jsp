<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'welcome.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<style type="text/css">
#demo {
	background: #FFF;
	overflow: hidden;
	border: 1px dashed #CCC;
	width: 960px;
}

#demo img {
	border: 3px solid #F2F2F2;
	padding: 0 5px 0 5px;
}

#indemo {
	float: left;
	width: 800%;
}

#demo1 {
	float: left;
}

#demo2 {
	float: left;
}

.ww {
	float: left;
	text-align: center;
}
</style>

		<script type="text/javascript">
var thissize=30;
var thisfront="隶书";
var textcolor=new Array()
textcolor[0]="000000"
textcolor[1]="ccffff"
textcolor[2]="ECF5FF"
textcolor[3]="D2E9FF"
textcolor[4]="C4E1FF"
textcolor[5]="ACD6FF"
textcolor[6]="97CBFF"
textcolor[7]="84C1FF"
textcolor[8]="66B3FF"
textcolor[9]="46A3FF"
textcolor[10]="2894FF"
textcolor[11]="0080FF"
textcolor[12]="0072E3"
textcolor[13]="0066CC"
textcolor[14]="005AB5"
textcolor[15]="004B97"
textcolor[16]="003D79"
textcolor[17]="000079"
textcolor[18]="000079"
var message=new Array()
message[0]="欢迎进入健身房管理系统"
message[1]="感谢您的使用！"

i_message=0
var i_strength=0
var i_message=0
var timer
function glowtext()
{
 if(document.all)//可以用document.all["元素名"].属性名="属性值"来动态改变元素的属性。用这条语句，可以做出许许多多动态网页效果，如：动态变换图片、动态改变文本的背景、动态改变网页的背景、动态改变图片的大小、动态改变文字的大小各颜色等等 
 {
  if(i_strength<=17)
  {
   glowdiv.innerText=message[i_message] //innerHTML是符合W3C标准的属性，而innerText只适用于IE浏览器，因此，尽可能地去使用innerHTML，而少用innerText，如果要输出不含HTML标签的内容，可以使用innerHTML取得包含HTML标签的内容后，再用正则表达式去除HTML标签，下面是一个简单的符合W3C标准的示例：<a href="javascript:alert(document.getElementById('test').innerHTML.replace(/<.+?>/gim,''))">无HTML,符合W3C标准</a>
   document.all.glowdiv.style.filter="glow(color="+textcolor[i_strength]+",strength=4)"//实现辉光滤镜效果，strength为强度 
   i_strength++
   timer=setTimeout("glowtext()",100) //setTimeout  在执行时,是在载入后延迟指定时间后,去执行一次表达式,仅执行一次
  }
  else
  {
   clearTimeout(timer);//清除setTimeout函数设置的定时器
   setTimeout("deglowtext()",1000)
  }
 }
}
function deglowtext() 
{ 
  if(document.all)
  {
   if(i_strength>=0)
   {
    glowdiv.innerText=message[i_message]
    document.all.glowdiv.style.filter="glow(color="+textcolor[i_strength]+",strength=4)"
    i_strength--
    timer=setTimeout("deglowtext()",100)
   }
   else
   {
    clearTimeout(timer)
    i_message++
    if(i_message>=message.length)
    {
     i_message=0
    }
    i_strength=0
    intermezzo()
   }
  }
}
function intermezzo()
{
 glowdiv.innerText=""
 setTimeout("glowtext()",1000)
}
</script>

	</head>

	<body onload="glowtext()">
		<div id="demo">
			<div id="indemo">
				<div id="demo1">
					<div class="ww">
						<a href="FieldPhotoServlet?src=device/device1.jpg"><img src="device/device1.jpg" border="0" /> </a>
					</div>
					<div class="ww">
						<a href="FieldPhotoServlet?src=device/device2.jpg"><img src="device/device2.jpg" border="0" /> </a>
					</div>
					<div class="ww">
						<a href="FieldPhotoServlet?src=device/device3.jpg"><img src="device/device3.jpg" border="0" /> </a>
					</div>
					<div class="ww">
						<a href="FieldPhotoServlet?src=device/device4.jpg"><img src="device/device4.jpg" border="0" /> </a>
					</div>
					<div class="ww">
						<a href="FieldPhotoServlet?src=device/device5.jpg"><img src="device/device5.jpg" border="0" /> </a>
					</div>
					<div class="ww">
						<a href="FieldPhotoServlet?src=device/device6.jpg"><img src="device/device6.jpg" border="0" /> </a>
					</div>
				</div>
				<div id="demo2"></div>
			</div>
		</div>

		<script>
<!--
var speed=10; //数字越大速度越慢
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
if(tab2.offsetWidth-tab.scrollLeft<=0)
tab.scrollLeft-=tab1.offsetWidth;
else{
tab.scrollLeft++;
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)}
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
-->

</script>

		<br>
		<div id="glowdiv"
			style="visibility: visible; width: 600px; text-align: center; top: 150px; left: 50px; font-family: Verdana, Geneva, sans-serif; font-size: 28px; color: #000000">
		</div>
		<br>

		<center>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top">
					</td>
					<td valign=top>
						<div id=demoo
							style="overflow: hidden; height: 160 px; width: 710 px;">
							<table align=left cellpadding=0 cellspace=0 border=0>
								<tr>
									<td id=demoo1 valign=top>
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<TR>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src=coach/chenhu.jpg"> <img src="coach/chenhu.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>陈虎</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src=coach/chen.jpg"> <img src="coach/chen.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>陈晓健</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src=coach/hu.jpg"> <img src="coach/hu.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>胡定艳</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src=coach/qin.jpg"> <img src="coach/qin.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>秦二磊</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src=coach/wu.jpg"> <img src="coach/wu.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>巫月</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src=coach/yang.jpg"> <img src="coach/yang.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>杨迷</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src="coach/zhao.jpg""> <img src="coach/zhao.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>赵鸿强</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src="coach/ma.jpg""> <img src="coach/ma.jpg"> </a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>马姗姗</b>
															</TD>
														</TR>
													</TABLE>
												</td>
												<TD align="center" valign=top>
													<TABLE cellSpacing="2" cellPadding="2" width="100%"
														border="0">
														<TR>
															<TD>
																<table width="183" height="133" border="0"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<a href="CoachPhotoServlet?src="coach/zhaocheng.jpg""> <img src="coach/zhaocheng.jpg">
																			</a>
																		</td>
																	</tr>
																</table>
															</TD>
														</TR>
														<TR>
															<TD class="fffff" align="center">
																<b>赵承俊</b>
															</TD>
														</TR>
													</TABLE>
												</td>
											</tr>
										</table>
									</td>
									<td id=demoo2 valign=top>
									</td>
								</tr>
							</table>
						</div>
						<script> 
							var speedo=30 
							demoo2.innerHTML=demoo1.innerHTML 
							function Marqueeo(){ 
							if(demoo2.offsetWidth-demoo.scrollLeft<=0) 
							demoo.scrollLeft-=demoo1.offsetWidth 
							else{ 
							demoo.scrollLeft++ 
							} 
							} 
							var MyMaro=setInterval(Marqueeo,speedo) 
							demoo.onmouseover=function() {clearInterval(MyMaro)} 
							demoo.onmouseout=function() {MyMaro=setInterval(Marqueeo,speedo)} 
						</script>
					</td>
				</tr>
			</table>
			<br>
			<br>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
				<tr>
					<TD align="center">
						<font color="#66ccff" size="2.6px">服务热线：xxxx-xxxxxxxx&nbsp;&nbsp; 传真：xxxx-xxxxxxxx</font>
					</td>
				</tr>
				<tr>
					<TD align=center>
						<font color="#66ccff" size="2.6px">地址：xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</font>
					</td>
				</tr>
				<tr>
					<TD align=center>

						<font color="#66ccff" size="2.6px">备案号：
						湘ICP备09066208号 技术支持：
						xxxxx</font>
					</td>
				</tr>
			</table>
	</body>
</html>
