<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>jeecms-left</title>
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
<script src="./res/jeecms/js/admin.js" type="text/javascript"></script></head>
<body>
  	    <div class="box-positon">
        	 <h1>当前位置: 首页 - 欢迎页</h1>
        </div>
<div class="body-box">
        <div class="welcom-con">
        	 <div class="we-txt">
             	  <p>
                  欢迎使用JEECMS内容管理系统！<br />
                  JEECMS程序版本： jeecms-2012-beta 【<a href="http://www.jeecms.com" target="_blank">查看最新版本</a>】<br />
                  您上次登录的时间是：2011-02-24<br />
                  已用内存：<span style="color:#0078ff;">39.21MB</span>&nbsp;&nbsp;&nbsp;&nbsp;剩余内存：<span style="color:#ff8400;">208.29MB </span>&nbsp;&nbsp;&nbsp;&nbsp;最大内存：<span style="color:#00ac41;">247.5MB</span>
                  </p>
             </div>
             <ul class="ms">
             	<li class="wxx">访问量</li><li class="attribute">　　　系统属性</li>
             </ul>
             <div class="ms-xx">
                 <div class="xx-xx">
             	      <table width="100%" border="0" cellspacing="0" cellpadding="0">
             	       <tr>
                        <td width="20%" height="30" align="right"></td>
                        <td width="25%"><b>PV</b></td>
                        <td width="25%"><b>IP</b></td>
                        <td width="30%"><b>独立访客</b></td>
                    </tr>
                      <tr>
                        <td height="30" align="right">今日：</td>
                     	<td>0</td>
                     	<td>0</td>
                     	<td>0</td>
                    </tr>
                      <tr>
                        <td height="30" align="right">昨日：</td>
                     	<td>0</td>
                     	<td>0</td>
                     	<td>0</td>
                    </tr>
                      <tr>
                        <td height="30" align="right">本周：</td>
                     	<td>0</td>
                     	<td>0</td>
                     	<td>0</td>
                    </tr>
                      <tr>
                        <td height="30" align="right">本月：</td>
                     	<td>0</td>
                     	<td>0</td>
                     	<td>0</td>
                     </tr>
                     <tr>
                        <td height="30" align="right">累计：</td>
                     	<td>0</td>
                     	<td>0</td>
                     	<td>0</td>
                     </tr>
               </table>
                 </div>
                 <div class="attribute-xx" style="float:left">
                 	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="30%" height="30" align="right">操作系统版本：</td>
                            <td height="30"><span class="black">Windows XP 5.1</span></td>
                        </tr>
                          <tr>
                            <td width="30%" height="30" align="right">操作系统类型：</td>
                            <td height="30"><span class="black">x86 32位</span> </td>
                        </tr>
                          <tr>
                            <td width="30%" height="30" align="right">用户、目录、临时目录：</td>
                            <td height="30"><span class="black">Administrator, C:\Program Files\Apache Software Foundation\Tomcat 6.0, C:\Program Files\Apache Software Foundation\Tomcat 6.0\temp</span></td>
                        </tr><tr>
                            <td width="30%" height="30" align="right">JAVA运行环境：</td>
                            <td height="30"><span>Java(TM) SE Runtime Environment 1.6.0_24-b07</span></td>
                          </tr>
                          <tr>
                            <td width="30%" height="30" align="right">JAVA虚拟机：</td>
                            <td height="30"> <span>Java HotSpot(TM) Client VM 19.1-b02</span></td>
                        </tr>
                   </table>  
               </div>

             </div>
             
  </div>
</body>
</html>