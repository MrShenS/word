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
		<title>jeecms-left</title>
		<link href="res/jeecms/css/admin.css" rel="stylesheet"
			type="text/css" />
		<link href="res/common/css/theme.css" rel="stylesheet"
			type="text/css" />
		<link href="res/common/css/jquery.validate.css" rel="stylesheet"
			type="text/css" />
		<link href="res/common/css/jquery.treeview.css" rel="stylesheet"
			type="text/css" />
		<link href="res/common/css/jquery.ui.css" rel="stylesheet"
			type="text/css" />

	   <link rel="stylesheet" href="res/common/css/jquery-1.7.1.js">
	   
		<link rel="stylesheet" href="res/common/css/demos.css" type="text/css" />

		<script src="thirdparty/fckeditor/fckeditor.js"
			type="text/javascript"></script>
		<script src="thirdparty/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>
		<script src="res/common/js/jquery.js" type="text/javascript"></script>
		<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
		<script src="res/common/js/pony.js" type="text/javascript"></script>
		<script src="res/jeecms/js/admin.js" type="text/javascript"></script>

		<script src="res/common/css/jquery-1.7.1.js"></script>
		<script src="ui/jquery.ui.core.js"></script>
		<script src="ui/jquery.ui.widget.js"></script>
		<script src="ui/jquery.ui.accordion.js"></script>

		<script>
	$(function() {
		$( "#accordion" ).accordion({
			autoHeight: false,
			navigation: true,
			collapsible: true
		});
	});
	</script>

		<script type="text/javascript">	
$(function(){
	Cms.lmenu('lmenu');
});
</script>
	</head>
	<body class="lbody">
		<div class="left">
			<div class="date">
				<span>现在时间： <script language="javascript">
       var day="";
       var month="";
       var ampm="";
       var ampmhour="";
       var myweekday="";
       var year="";
       mydate=new Date();
       myweekday=mydate.getDay();
       mymonth=mydate.getMonth()+1;
       myday= mydate.getDate();
       year= mydate.getFullYear();
       if(myweekday == 0)
       weekday=" 星期日 ";
       else if(myweekday == 1)
       weekday=" 星期一 ";
       else if(myweekday == 2)
       weekday=" 星期二 ";
       else if(myweekday == 3)
       weekday=" 星期三 ";
       else if(myweekday == 4)
       weekday=" 星期四 ";
       else if(myweekday == 5)
       weekday=" 星期五 ";
       else if(myweekday == 6)
       weekday=" 星期六 ";
       document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
      </script> </span>
			</div>
			<ul class="w-lful">
				<div class="demo">

					<div id="accordion">
						<h3>
							<a href="#section">首页</a>
						</h3>
						<div>
							<p>
								<a href="welcome.jsp" target="rightFrame">欢迎页</a>
							</p>
						</div>
						<h3>
							<a href="#section1">健身管理</a>
						</h3>
						<div>
							<p>
								<a href="CourseServlet" target="rightFrame">健身课程</a>
							</p>
							<p>
								<a href="DeviceServlet" target="rightFrame">器械信息</a>
							</p>
							<p>
								<a href="FieldInfoServlet" target="rightFrame">场地信息</a>
							</p>
						</div>
						
						<h3>
							<a href="#section6">会员管理</a>
						</h3>
						<div>
							<p>
								<a href="v_c_set.jsp" target="rightFrame">卡设置</a>
							</p>
							<p>
								<a href="MemberServlet" target="rightFrame">会员信息</a>
							</p>
							<p>
								<a href="v_c_sell.jsp" target="rightFrame">售卡</a>
							</p>
							<p>
								<a href="personal_trainer.jsp" target="rightFrame">购买私教</a>
							</p>
						</div>
						<h3>
							<a href="#section7">访客管理</a>
						</h3>
						<div>
							<p>
								<a href="visitor_order.jsp" target="rightFrame">访客预约</a>
							</p>
							<p>
								<a href="visitor_register.jsp" target="rightFrame">访客登记</a>
							</p>
						</div>
						
						<h3>
							<a href="#section9">卡管理</a>
						</h3>
						<div>
							<p>
								<a href="c_lost.jsp" target="rightFrame">卡挂失</a>
							</p>
							<p>
								<a href="c_recharge.jsp" target="rightFrame">卡充值</a>
							</p>
							<p>
								<a href="c_reissue.jsp" target="rightFrame">卡补发</a>
							</p>
						</div>
						<h3>
							<a href="#section10">统计报表</a>
						</h3>
						<div>
							<p>
								<a href="TableServlet?id=1&di=0" target="rightFrame">卡信息统计</a>
							</p>
							<p>
								<a href="TableServlet?id=2&di=0" target="rightFrame">课程统计</a>
							</p>
							<p>
								<a href="TableServlet?id=3&di=0" target="rightFrame">器材统计</a>
							</p>
							<p>
								<a href="TableServlet?id=4&di=0" target="rightFrame">收入与支出</a>
							</p>
						</div>
					</div>

				</div>
	</body>
</html>
