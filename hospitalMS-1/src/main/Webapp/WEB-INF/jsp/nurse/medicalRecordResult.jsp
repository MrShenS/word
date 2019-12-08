<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="table table-striped table-bordered">
				
				
				<tbody>
					<tr>
						<td>患者编号</td>
						<td>患者姓名</td>
						<td>症状</td>
						<td>建议</td>
						<td>患者主诉</td>
						<td>既往史</td>
						<td>现病史</td>
						<td>辅助检查结果</td>
					</tr>
					<tr>
						<td>${userPatient.patient.id }</td>
						<td>${userPatient.patient.name }</td>
						<td>${userPatient.symptom }</td>
						<td>${userPatient.advice }</td>
						<td>${userPatient.complained }</td>
						<td>${userPatient.pastmedicalhistory }</td>
						<td>${userPatient.historyofpresentillness }</td>
						<td>${userPatient.physicalexamresult }</td>
					</tr>
				</tbody>
			</table>