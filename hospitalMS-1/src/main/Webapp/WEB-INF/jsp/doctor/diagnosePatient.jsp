<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	$(function(){
		$("#diagnosisModal").modal('show');
		$(".submitBtn").on("click",function(){
			$("#diagnosisForm input:submit").trigger('click');
		});
		
		$("#diagnosisForm").ajaxForm(function(data){
			$("#diagnosisModal").modal('hide');
			alert(data);
		});
	});
</script>

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="diagnosisModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">病人诊断</h4>
      </div>
      <div class="modal-body">
        <form action="/doctor/saveOrUpdateUserPatient" id="diagnosisForm">
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<td style="width:80px">挂号单号</td>
						<td><input type="text" name="id"/>
						</td>
					</tr>
					
					<tr>
						<td>患者症状</td>
						<td>
							<textarea rows="" cols="" name="symptom"></textarea>
							<!-- <input type="text" name="symptom"> -->
						</td>
					</tr>
					<tr>
						<td>治疗建议</td>
						<td>
							<textarea rows="" cols="" name="advice"></textarea>
							<!-- <input type="text" name="advice"> -->
						</td>
					</tr>
					<tr>
						<td>病人主诉</td>
						<td>
							<textarea rows="" cols="" name="complained"></textarea>

							<!-- <input type="text" name=""> -->
						</td>
					</tr>
					<tr>
						<td>既往史</td>
						<td>
							<textarea rows="" cols="" name="pastmedicalhistory"></textarea>
							<!-- <input type="text" name="pastMedicalHistory"> -->
						</td>
					</tr>
					<tr>
						<td>现病史</td>
						<td>
							<textarea rows="" cols="" name="historyofpresentillness"></textarea>
							<!-- <input type="text" name="historyOfPresentIllness"> -->
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