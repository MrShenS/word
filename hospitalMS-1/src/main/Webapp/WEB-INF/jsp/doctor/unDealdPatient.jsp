<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="rt" %>
<!DOCTYPE html>
<script>
	$(function(){

		$(".addBtn").on("click",function(){
			var ids = $("#tableData input[type='checkbox']:checked").map(function(index,item){
				return $(item).val();
			}).get();
			jQuery.ajaxSetup({
				traditional:true// ids数组可以被后台接收到
			});
			$.get("/doctor/updatePatientStatus",{ids:ids},function(data){
				$(".menu dd:contains('科室未处理病人')").trigger("click");
			});
		});
	});
</script>
<div class="register">
	<div class="optios">
		<button class="addBtn">处理病人</button>
	</div>
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
			<c:forEach items="${UserPatientVMList}" var="UserPatientVMList">
				<tr>
					<td><input type="checkbox" value="${UserPatientVMList.id }"/></td>
					<td>${UserPatientVMList.patient.id }</td>
					<td>${UserPatientVMList.patient.name }</td>
					<td>${UserPatientVMList.user.department.name }</td>
					<td>${UserPatientVMList.user.name }</td>
					<td>${UserPatientVMList.price }</td>
					<td><rt:formatDate value="${UserPatientVMList.date }" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						未处理
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
</div>