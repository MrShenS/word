<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <script>
	$(function(){
			$("#selectCheckModal1").modal('show');
			$("#selectCheckModal1 .submitBtn").on("click",function(){
				$("#selectCheckModal1").modal('hide');
				var id = $("#selectCheckForm input[name='id']").val();

				setTimeout(function(){
					$(".b_main").load("/inspection/findPatientPhysicalExam",{id:id});
				},1000);

			});

	});
 </script>


<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="selectCheckModal1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">检查查询</h4>
      </div>
      <div class="modal-body">
        <form action="findPPByPatientId" id="selectCheckForm">
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<td>患者编号</td>
						<td><input type="text" name="id"/>
						</td>
					</tr>

				</tbody>
			</table>
			<input type="submit" style="display:none">
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default cancelBtn" >取消</button>
        <button type="button" class="btn btn-primary submitBtn">查询</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>