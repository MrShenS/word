<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String path=request.getContextPath();
	String BasePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html>
<head>
<base href="<%=BasePath%>">
<meta charset="UTF-8">
<title>XXX管理系统</title>
	<!-- jquery基础库 -->
	<script type="text/javascript" src="/jquery-3.3.1.min.js"></script>
	<!-- jquery表单异步提交库 -->
	<script type="text/javascript" src="/jquery.form.min.js"></script>
	<!-- bootstrap js -->
	<script type="text/javascript" src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="/bootstrap-3.3.7/css/bootstrap.min.css">
	<!-- font-awesome -->
	<link rel="stylesheet" href="/font-awesome-4.7.0/css/font-awesome.css">
	<!-- 自定义JS -->
	<script type="text/javascript" src="/js/index.js"></script>
	<!-- 自定义CSS -->
	<link rel="stylesheet" href="/css/layout.css">
</head>
<body>
	<div class="b_container">
		<!-- 头部开始 -->
		<div class="b_header">
			<div class="logo">
				<i class="fa fa-hospital-o"></i>	医院管理系统
			</div>
			<div class="loginInfo">
				 欢迎您${user.name }  
				<a href="/user/logout">注销</a>
			</div>
		</div>
		<!-- 头部结束 -->
		<!-- 内容区开始 -->
		<div class="b_content">
			<div class="b_left">
				<dl class="menu">
					<c:if test="${role.id==1 }">
					<dt><i class="fa fw fa-user-o"></i><a href="javascript:void(0)">角色1：医生</a></dt>
					<dd url='<%=response.encodeURL("/doctor/findUnDealdPatient")%>'><a href="javascript:void(0)">科室未处理病人</a></dd>
					<dd url='/doctor/findDealdPatient'><a href="javascript:void(0)">已处理挂号病人</a></dd>
					<dd url='/doctor/toOpenRecipe'><a href="javascript:void(0)">开处方</a></dd>
					<dd url='/doctor/toRecipeSelect'><a href="javascript:void(0)">处方查询</a></dd>
					<dd url='/doctor/toOpenInspection'><a href="javascript:void(0)">开检查</a></dd>
					<dd url='/nurse/toInspectionSelect'><a href="javascript:void(0)">检查查询</a></dd>
					<dd url='/doctor/toDiagnosePatient'><a href="javascript:void(0)">诊断病人</a></dd>
					<dd url='/nurse/toMedicalRecordSelect'><a href="javascript:void(0)">病例档案查询</a></dd>
					</c:if>
					
					<c:if test="${role.id==2 }">
					<dt><i class="fa fw fa-ambulance"></i><a href="javascript:void(0)">角色2：医技人员</a></dt>
					<dd url='/physicalexam/findAllphysicalExam'><a href="javascript:void(0)">辅助检查项目管理</a></dd>
					<dd url='/physicalexam/entryCheckResult'><a href="javascript:void(0)">录入检查结果</a></dd>
					</c:if>
					
					<c:if test="${role.id==3 }">
					<dt><i class="fa fw fa-plus-square"></i><a href="javascript:void(0)">角色3：护士</a></dt>
					<dd url='/nurse/toMedicalRecordSelect'><a href="javascript:void(0)">病例档案查询</a></dd>
					<dd url='/doctor/toRecipeSelect'><a href="javascript:void(0)">处方查询</a></dd>
					<dd url='/nurse/toInspectionSelect'><a href="javascript:void(0)">检查查询</a></dd>
					</c:if>
					
					<c:if test="${role.id==4 }">
					<dt><i class="fa fw fa-hand-o-right"></i><a href="javascript:void(0)">角色4：导医</a></dt>
					<dd url='/patient/findAllPatient'><a href="javascript:void(0)">病人基本信息管理</a></dd>
					</c:if>
					
					<c:if test="${role.id==5 }">
					<dt><i class="fa fw fa-cny"></i><a href="#">角色5：门诊收费员</a></dt>
					<dd url='/ChargeMan/findUserPatient'><a href="javascript:void(0)">门诊挂号</a></dd>
					<dd url='/physicalexam/findAllphysicalExam'><a href="javascript:void(0)">辅助检查项目管理</a></dd>
					<dd url='/ChargeMan/findAllPatient'><a href="javascript:void(0)">就诊卡充值扣费</a></dd>
					</c:if>
					
					<c:if test="${role.id==6}">
					<dt><i class="fa fw fa-pencil"></i><a href="javascript:void(0)">角色6：药房管理员</a></dt>
					<dd url='/drugManage/findAllCategory/1'><a href="javascript:void(0)">药品类别管理</a></dd>
					<dd url='/drugManage/findAllDrugWithCategory/1'><a href="javascript:void(0)">医用药品管理</a></dd>
					</c:if>
					
					<c:if test="${role.id==7}">
					<dt><i class="fa fw fa-address-book-o"></i><a href="javascript:void(0)">角色7：字典维护人员</a></dt>
					<dd url='/dept/findAllDept/1'><a href="javascript:void(0)">部门管理</a></dd>
					<dd url='/user/findUserWithDept/1'><a href="javascript:void(0)">职工管理</a></dd>
					<!-- <dd url='toFindAllCategory?currentPage=1&size=5'><a href="#">药品类别管理</a></dd>
					<dd url='toDrug'><a href="#">医用药品信息管理</a></dd> -->
					<dd url='/physicalexam/findAllphysicalExam'><a href="javascript:void(0)">辅助检查项目管理</a></dd>
					</c:if>
				</dl>
			</div>
			<div class="b_right">
				<div class="b_tip">
					
				</div>
				<!-- 动态内容区 -->
				<div class="b_main">
					<!--内容区  -->

				</div>
			</div>
		</div>
		<!-- 内容区结束 -->
		<!-- 底部开始 -->
		<div class="b_footer">
			版权所有：杰普软件科技有限公司
		</div>
		<!-- 底部结束 -->
	</div>
</body>
</html>