<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<td>患者编号</td>
						<td>姓名</td>
						<td>药品</td>
						<td>数量</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${findPatientDrugVMByPatientId}" var="patientDrug">
					<tr>
						<td>${patientDrug.patient.id }</td>
						<td>${patientDrug.patient.name }</td>
						<td>${patientDrug.drug.name }</td>
						<td>${patientDrug.num}</td>
					</tr>
					</c:forEach>
				</tbody>
</table>