<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	$(function(){
		$("#priscriptionModal").modal('show');
		//查询所有药品,查询完将数据显示到模态框
		$.get("/drugManage/findDrugs",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#drugSelect").append('<option value='+id+'>'+name+'</option>');
			}
			$("#priscriptionModal").modal('show');
		});
		
		$(".modal-footer .submitBtn").on("click",function(){
			$("#prescriptionForm input:submit").trigger("click");
		});
		
		$("#prescriptionForm").ajaxForm(function(data){
			$("#priscriptionModal").modal('hide');
			alert(data);
		});
		
	});
</script>

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="priscriptionModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">开处方</h4>
      </div>
      <div class="modal-body">
        <form action="/patientDrug/savePatientDrug" id="prescriptionForm">
			<table>
				<tbody>
					<tr>
						<td style="width:80px">患者编号</td>
						<td><input type="text" name="patientId"/>
						</td>
					</tr>

					
					<tr>
						<td>药品名称</td>
						<td>
						<select	name="drugId" id="drugSelect">
							<option value="">---请选择---</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>药品数量</td>
						<td><input type="text" name="num"></td>
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