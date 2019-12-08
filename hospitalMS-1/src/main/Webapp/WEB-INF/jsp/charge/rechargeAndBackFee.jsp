<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script>
	function payCard(id){
		$("#cardMoal").modal('show');
		//当点击取消按钮时，模态框隐藏
		$("#cardMoal .cancelBtn").on("click",function(){
			$("#cardMoal").modal('hide');
		});
		$("#cardMoal .submitBtn").on("click",function(){
			$("#modalForm").attr("action","/ChargeMan/rechargeAndBackFee");
			$("#modalForm input[name='operation']").val("充值");
			$("#modalForm input[name='id']").val(id);
			$("#modalForm input:submit").trigger('click');
		});
		$("#modalForm").ajaxForm(function(data){
			$("#cardMoal").modal('hide');
			 alert(data); 
			$(".menu dd:contains('就诊卡充值扣费')").trigger("click");
		});
	}
	function quitCard(id){
		$(".modal-header .modal-title").text("就诊卡扣费");
		$("#cardMoal").modal('show');
		//当点击取消按钮时，模态框隐藏
		$("#cardMoal .cancelBtn").on("click",function(){
			$("#cardMoal").modal('hide');
		});
		$("#cardMoal .submitBtn").on("click",function(){
			$("#modalForm").attr("action","/ChargeMan/rechargeAndBackFee");
			$("#modalForm input[name='operation']").val("扣费");
			$("#modalForm input[name='id']").val(id);
			$("#modalForm input:submit").trigger('click');
		});
		$("#modalForm").ajaxForm(function(data){
			$("#cardMoal").modal('hide');
			alert(data);
			$(".menu dd:contains('就诊卡充值扣费')").trigger("click");
		});
	}
</script>

<div class="card">
	<!-- <div class="optios">
		<button class="payCard" onclick="payCard()">充值</button>
		<button class="quitCard" onclick="quitCard()">退款</button>
	</div> -->
	<div class="data">
		<table class="dataTable table table-striped table-bordered" id="tableData">
			<thead>
				<tr>
					<th>患者流水号</th>
					<th>病人姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>卡号</th>
					<th>余额</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${patientList }" var="patient">
				<tr>
					<td>${patient.id }</td>
					<td>${patient.name}</td>
					<td>${patient.gender}</td>
					<td>${patient.age}</td>
					<td>${patient.cardno}</td>
					<td>${patient.balance}</td>
					<td>
						<a href="javascript:void(0)" onclick="payCard(${patient.id })">充值</a>
						<a href="javascript:void(0)" onclick="quitCard(${patient.id })">扣费</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>




<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="cardMoal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">就诊卡充值</h4>
      </div>
      <div class="modal-body">
        <form action="" id="modalForm">
			<table class="table table-striped table-bordered">
				<tbody>
					
					<tr>
						<td>额度</td>
						<td>
							<input type="text" name="price" value=0.0>
							<input type="hidden" name="operation">
							<input type="hidden" name="id">
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" style="display:none">
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default cancelBtn" >取消</button>
        <button type="button" class="btn btn-primary submitBtn">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>