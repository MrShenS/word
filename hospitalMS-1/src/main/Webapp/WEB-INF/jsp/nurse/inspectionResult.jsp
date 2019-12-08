<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<td>患者编号</td>
						<td>姓名</td>
						<td>检查项目</td>
						<td>费用</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${findPatientPhysicalExam}" var="ppvm">
					<tr>
						<td>${ppvm.patient.id }</td>
						<td>${ppvm.patient.name }</td>
						<td>${ppvm.physicalexam.name }</td>
						<td>${ppvm.cost}</td>
					</tr>
					</c:forEach>
				</tbody>
</table>