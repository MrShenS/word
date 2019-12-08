<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="card">
	<div class="data">
		<table class="dataTable table table-striped table-bordered" id="tableData">
			<thead>
				<tr>
					<th>医院id</th>
					<th>医院姓名</th>
					<th>成立时间</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${hos}" var="hos">
				<tr>
					<td>${hos.id }</td>
					<td>${hos.name}</td>
					<td>${hos.time}</td>
					<td>
						<a href="" >增加</a>
						<a href="" >删除</a>
						<a href="" >删除</a>
						<a href="" >删除</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

