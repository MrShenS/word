<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	$(function(){
		$("#selectPrescriptionModal").modal('show');
		$(".submitBtn").on("click",function(){
			$("#selectPrescriptionModal").modal('hide');
			var id = $(".modal-body input[name='id']").val();
			setTimeout(function(){
				$(".b_main").load("/recipe/findPatientDrugById",{id:id});
			},1000);;
		});
	});
</script>
<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="selectPrescriptionModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">处方查询</h4>
      </div>
      <div class="modal-body">
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<td>患者编号</td>
						<td><input type="text" name="id"/>
						</td>
					</tr>
				</tbody>
			</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default cancelBtn" >取消</button>
        <button type="button" class="btn btn-primary submitBtn">查询</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>