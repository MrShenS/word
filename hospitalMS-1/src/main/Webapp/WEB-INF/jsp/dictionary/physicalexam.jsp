<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script>

	$(function(){
		//批量删除
		$(".deleteBatch").on("click",function(){
			var ids = $(".dataTable input[type='checkbox']:checked").map(function(index,item){
				return $(item).val();
			}).get();
			jQuery.ajaxSetup({
				traditional:true// ids数组可以被后台接收到
			});

			$.post("/physicalexam/deletePhysicalExams",{ids:ids},function(data){
				alert(data);
				$(".menu dd:contains('辅助检查项目管理')").trigger("click");
			});
		});
	});

	//添加
	function addPe(){
		//点击添加模态框显示
		$("#peModal").modal('show');
		//点击模态框中的保存，模拟点击form表单的提交按钮
		$(".modal-footer .submitBtn").on("click",function(){
			$("#peForm").attr("action","/physicalexam/saveOrUpdatePe");
			$("#peForm input:submit").trigger("click");
		});
		$("#peForm").ajaxForm(function(data){
			$("#peModal").modal('hide');
			alert(data);
			$(".menu dd:contains('辅助检查项目管理')").trigger("click");
		});

	}
	//删除
	function deletepe(id){
		$.post("/physicalexam/deletePhysicalExam",{id:id},function(data){
			alert(data);
			$(".menu dd:contains('辅助检查项目管理')").trigger("click");
		});
	}
	//修改
	function updatePe(id){
		$("#peModal").modal('show');
		//先查出对应的本门显示到模态框中
		$.get("/physicalexam/findphysicalExamById",{id:id},function(data){
			console.log("回来了")
			$("#peForm input[name='name']").val(data.name);
			$("#peForm input[name='id']").val(data.id);
			$("#peForm input[name='price']").val(data.price);
			$(".modal-header .modal-title").text("修改辅助项目");
			//当点击取消按钮时，模态框隐藏
			$("#peModal .cancelBtn").on("click",function(){
				$("#peModal").modal('hide');
			});
		});
		/* 当点击模太框中的保存按钮时模拟点击form表单中的提交按钮，
		因为使用了jqueryform插件中的ajaxForm方法，
		所以点击form表单中的提交按钮会出发该方法 */
		$("#peModal .submitBtn").on("click",function(){
			$("#peForm").attr("action","/physicalexam/saveOrUpdatePe");
			$("#peForm input:submit").trigger("click");
		});
		$("#peForm").ajaxForm(function(data){
			$("#peModal").modal('hide');
			alert(data);
			$(".menu dd:contains('辅助检查项目管理')").trigger("click");
		});
	}
</script>
<div class="pe">
	<div class="optios">
		<button class="addBtn" onclick="addPe()">添加</button>
		<button class="deleteBatch">批量删除</button>
	</div>
	<div class="data">
		<table class="dataTable table table-striped table-bordered">
			<thead>
				<tr>
					<th>编号</th>
					<th>检查项目</th>
					<th>检查费用</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${peList }" var="pe" varStatus="state">
				<tr>
					<td><input type="checkbox" value="${pe.id }"/></td>
					<td>${pe.name }</td>
					<td>${pe.price }</td>
					<td>
						<a href="javascript:void(0)" onclick="deletepe(${pe.id})">删除</a>
						<a href="javascript:void(0)" onclick="updatePe(${pe.id})">修改</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="peModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加辅助项目</h4>
      </div>
      <div class="modal-body">
        <form action="" id="peForm">
			<table>
				<tbody>
					<tr>
						<td style="width:80px">检查项目</td>
						<td><input type="text" name="name"/>
							<input type="hidden" name="id">
						</td>
					</tr>
					<tr>
						<td style="width:80px">检查费用</td>
						<td>
						<input type="text" name="price">
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