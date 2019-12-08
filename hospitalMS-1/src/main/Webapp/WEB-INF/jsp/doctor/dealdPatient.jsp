<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="rt" %>
<!DOCTYPE html>
<script type="text/javascript">
/* $(function(){
	$("#diagnosisModal").modal('show');
	$(".submitBtn").on("click",function(){
		$("#diagnosisForm input:submit").trigger('click');
	});
	$("#diagnosisForm").ajaxForm(function(data){
		$("#diagnosisModal").modal('hide');
		alert(data);
	});
}); */
   
</script>
<div class="register">
<!-- 	<div class="optios">
		<button class="addBtn">处理病人</button>
	</div> -->
	<div class="data">
		<table class="dataTable table table-striped table-bordered" id="tableData">
			<thead>
				<tr>
					<th>请选择</th>
					<th>患者编号</th>
					<th>病人姓名</th>
					<th>部门名称</th>
					<th>所属医生</th>
					<th>挂号费</th>
					<th>挂号日期</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${findDealdPatient}" var="userPatient">
				<tr>
					<td><input type="checkbox" value="${userPatient.id }"/></td>
					<td>${userPatient.patient.id }</td>
					<td>${userPatient.patient.name }</td>
					<td>${userPatient.user.department.name}</td>
					<td>${userPatient.user.name}</td>
					<td>${userPatient.price }</td>
					<td>
					<rt:formatDate value="${userPatient.date }" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						已处理
						<button></button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
</div>