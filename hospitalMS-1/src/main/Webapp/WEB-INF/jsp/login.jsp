<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	var msg = "${msg}";
	if(msg){
		alert(msg);
	}
	$(document).ready(function() {
	var $username=$("input[name='name']");
	var $password=$("input[name='password']");
	$username.blur(function() {
		var v=$username.val();
		 $(".name").css("color","red");
		if(v==""){
			/* ^[a-zA-Z0-9\u4e00-\u9fa5]$ */
			console.log(v)
			$(".name").text("请输入用户名");
		console.log($(".name").text());
		}else if(v.length<2/* &v!= /^[a-zA-Z0-9\u4e00-\u9fa5]$/ */){
			console.log(v)
			$(".name").text("用户名不少于6个字符，不能包含特殊字符");
		console.log($(".name").text());
			
		}else {
		 $(".name").css("color","blue").text("用户名很好");
		 
		} 
	});
	$("input[name='password']").blur(function() {
		var v=$password.val();
		if(v.length<6){
			console.log(v);
			$(".pswd").css("color","red").text("密码真不好");
			alert("密码过短或者为空")
		}else{
			$(".pswd").css("color","blue").text("密码也很好");
		}
			
	})
	
	$(".b1").on("click",function(){
		var name=$username.val();
		var password=$password.val();
		if(name==""|password==""){
		alert("用户名或密码为空 将返回登录页面内");
		window.location.href="http://localhost:8888/login_before";
		return false;
		}
	});
   
	
	
	
});
	
</script>
<meta charset="UTF-8">
<title>登录</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
#wrap {
	height: 719px;
	width: 100;
	background-image: url();
	background-repeat: no-repeat;
	background-position: center center;
	position: relative;
}
#head {
	height: 120px;
	width: 100;
	background-color: #457CD6;
	text-align: center;
	position: relative;
}
#foot {
	width: 100;
	height: 126px;
	background-color: #457CD6;
	position: relative;
}
#wrap .logGet {
	height: 408px;
	width: 368px;  
	position: absolute;
	background-color: #FFFFFF;
	top: 20%;
	right: 15%;
}
.logC a button {
	width: 100%;
	height: 45px;
	background-color: #457CD6;
	border: none;
	color: white;
	font-size: 18px;
}
.logGet .logD.logDtip .p1 {
	display: inline-block;
	font-size: 28px;
	margin-top: 30px;
	width: 86%;
}
#wrap .logGet .logD.logDtip {
	width: 86%;
	border-bottom: 1px solid #457CD6;
	margin-bottom: 60px;
	margin-top: 0px;
	margin-right: auto;
	margin-left: auto;
}
.logGet .lgD img {
	position: absolute;
	top: 12px;
	left: 8px;
}
.logGet .lgD input {
	width: 100%;
	height: 42px;
	text-indent: 2.5rem;
}
#wrap .logGet .lgD {
	width: 86%;
	position: relative;
	margin-bottom: 30px;
	margin-top: 30px;
	margin-right: auto;
	margin-left: auto;
}
#wrap .logGet .logC {
	width: 86%;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
}
 
 
.title {
	font-family: "宋体";
	color: #FFFFFF;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);  /* 使用css3的transform来实现 */
	font-size: 36px;
	height: 40px;
	width: 30%;
}
 
.copyright {
	font-family: "宋体";
	color: #FFFFFF;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);  /* 使用css3的transform来实现 */
	height: 60px;
	width: 40%;
	text-align:center;
}
	
 
#foot .copyright .img {
	width: 100%;
	height: 24px;
	position: relative;
}
.copyright .img .icon {
	display: inline-block;
	width: 24px;
	height: 24px;
	margin-left: 22px;
	vertical-align: middle;
	background-image: url();
	background-repeat: no-repeat;
	vertical-align: middle;
	margin-right: 5px;
}
	
.copyright .img .icon1 {
	display: inline-block;
	width: 24px;
	height: 24px;
	margin-left: 22px;
	vertical-align: middle;
	background-image: url();
	background-repeat: no-repeat;
	vertical-align: middle;
	margin-right: 5px;
}
.copyright .img .icon2 {
	display: inline-block;
	width: 24px;
	height: 24px;
	margin-left: 22px;
	vertical-align: middle;
	background-image: url();
	background-repeat: no-repeat;
	vertical-align: middle;
	margin-right: 5px;
}
#foot .copyright p {
	height: 24px;
	width: 100%;
}
</style>
</head>
 
<body>
<div class="header" id="head">
  <div class="title">XXX医院管理系统</div>
	
</div>
	
<div class="wrap" id="wrap">
	<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
			</div>
			<form action="<%=response.encodeURL("/login_behind")%>" method="post" >
		     <!-- "" -->
			<!-- 输入框 -->
			<div class="lgD">
				<img src="" width="20" height="20" alt=""/>
				<input type="text"
					placeholder="输入用户名" name="name" class="name"/>
					<div class="name"></div>
			</div>
			<div class="lgD">
				<img src="" width="20" height="20" alt=""/>
				<input type="password"
					placeholder="输入用户密码" name="password" class="password"/>
					<div class="pswd"></div>
			</div>
			<div class="logC">
				<a href="" target="_self"><button class="b1">登 录</button></a>
			</div>
			</form>
		</div>
</div>
	
<div class="footer" id="foot">
  <div class="copyright">
    <p>Copyright © briup.com</p>
    <div class="img">
		<i class="icon"></i><span>联系邮箱：zhangcj@briup.com</span>
	</div>
	
	<div class="img">
		<i class="icon1"></i><span>联系地址：昆山杰普软件科技</span>
	</div>
	  
	<div class="img">
	  <i class="icon2"></i><span>联系电话：17751283826</span>
	</div>
 
 
  </div>
	
</div>
	
	
</body>
</html>