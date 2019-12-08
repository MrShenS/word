<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="rt" %>
<!DOCTYPE html>
<script>
	//添加
	function addRegister(){
		$("#deptSelect option").remove();
		//查询出所有部门
		$.get("/dept/findDepts",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#deptSelect").append('<option value='+id+'>'+name+'</option>');
			}
		});
		
		$("#patientSelect option").remove();
		//查询所有病人信息
		$.get("/patient/findPatients",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#patientSelect").append('<option value='+id+'>'+name+'</option>');
			}
			
		});
		
		//当点击取消按钮时，模态框隐藏
		$("#registerModal .cancelBtn").on("click",function(){
			$("#registerModal").modal('hide');
		});
		$("#registerModal").modal('show');
		
		//当切换部门时查询该部门下的员工，即根据部门id查询出每个部门下的员工
		$("#deptSelect").change(function(){
			//拿到部门id
			$("#deptSelect option:selected").each(function(){
				var id = $(this).val();
				//根据部门id查询员工
				$.get("/user/findUserByDeptId",{id:id},function(data){
					var selection = document.getElementById("userSelect");
					selection.innerHTML = "";
					for(var i=0;i<data.length;i++){
						var id = data[i].id;
						var name = data[i].name;
						$("#userSelect").append('<option value='+id+'>'+name+'</option>');
					}
				});
			});
		});

		$(".modal-footer .submitBtn").on("click",function(){
			$("#registerForm").attr("action","ChargeMan/saveOrUpdateUserPatient");
			$("#registerForm input:submit").trigger("click");
		});
		$("#registerForm").ajaxForm(function(data){
			$("#registerModal").modal("hide");
			alert(data);
			$(".menu dd:contains('门诊挂号')").trigger("click");
		});
	}
	
	$(function(){
		//批量删除
 		$(".optios .deleteBatch").on("click",function(){
 			var ids = $(".dataTable input[type='checkbox']:checked").map(function(index,item){
				return $(item).val();
			}).get();
 			console.log(ids);
			jQuery.ajaxSetup({
				traditional:true// ids数组可以被后台接收到
			});
			$.post("/userPatient/deleteUserPatients",{ids:ids},function(data){
				alert(data);
				$(".menu dd:contains('门诊挂号')").trigger("click");
			});
		});

	});
	//删除
	function deleteRegister(id){
		$.post("/userPatient/deleteUserPatient",{id:id},function(data){
			alert(data);
			$(".menu dd:contains('门诊挂号')").trigger("click");
		});
	}
	
	function updateRegister(uid){
		$("#deptSelect option").remove();
		//查询出所有部门
		$.get("/dept/findDepts",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#deptSelect").append('<option value='+id+'>'+name+'</option>');
			}
			
		});
		$("#registerForm input[name='id']").val(uid);
	/* 	$.get("/ChargeMan/findUserPatient_JS",{},function(data){
			
		}); */
		
		$("#patientSelect option").remove();
		//查询所有病人信息
		$.get("/patient/findPatients",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#patientSelect").append('<option value='+id+'>'+name+'</option>');
			}
			
		});
		
		//当点击取消按钮时，模态框隐藏
		$("#registerModal .cancelBtn").on("click",function(){
			$("#registerModal").modal('hide');
		});
		$(".modal-title").text("修改挂号");
		$("#registerModal").modal('show');
		
		//当切换部门时查询该部门下的员工，即根据部门id查询出每个部门下的员工
		$("#deptSelect").change(function(){
			//拿到部门id
			$("#deptSelect option:selected").each(function(){
				var id = $(this).val();
				//根据部门id查询员工
				$.get("/user/findUserByDeptId",{id:id},function(data){
					var selection = document.getElementById("userSelect");
					selection.innerHTML = "";
					for(var i=0;i<data.length;i++){
						var id = data[i].id;
						var name = data[i].name;
						$("#userSelect").append('<option value='+id+'>'+name+'</option>');
					}
				});
			});
		});

		$(".modal-footer .submitBtn").on("click",function(){
			$("#registerModal").modal("hide");
			$("#registerForm").attr("action","ChargeMan/saveOrUpdateUserPatient");
			$("#registerForm input:submit").trigger("click");
		});
		$("#registerForm").ajaxForm(function(data){
			$("#registerModal").modal("hide");
			alert(data);
			$(".menu dd:contains('门诊挂号')").trigger("click");
		});
		

	}
</script>
<div class="register">
	<div class="optios">
		<button class="addBtn" onclick="addRegister()">添加</button>
		<button class="deleteBatch">批量删除</button>
	</div>
	<div class="data">
		<table class="dataTable table table-striped table-bordered">
			<thead>
				<tr>
					<th>请选择</th>
					<th>挂号单号</th>
					<th>病人姓名</th>
					<th>部门名称</th>
					<th>所属医生</th>
					<th>挂号费</th>
					<th>挂号日期</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userPatientVM}" var="userPatient">
				<tr>
					<td><input type="checkbox" value="${userPatient.id}"/></td>
					<td>${userPatient.id }</td>
					<td>${userPatient.patient.name }</td>
					<td>${userPatient.user.department.name }</td>
					<td>${userPatient.user.name }</td>
					<td>${userPatient.price }</td>
					<td><rt:formatDate value="${userPatient.date }" pattern="yyyy-MM-dd"/></td>
					<td>${userPatient. status}</td>
					
					<td>
						<a href="javascript:void(0)" onclick="deleteRegister(${userPatient.id})">删除</a>
						<a href="javascript:void(0)" onclick="updateRegister(${userPatient.id})">修改</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="registerModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加挂号</h4>
      </div>
      <div class="modal-body">
        <form action="" id="registerForm">
			<table>
				<tbody>
			<!-- 		<tr>
						<td style="width:80px">患者流水号</td>
						<td><input type="text" name="id" />
						</td>
					</tr> -->
					<tr>
						<td style="width:80px">病人姓名</td>
						<td>
							<select name="patientId" id="patientSelect">
								<option value="">---请选择---</option>
							</select>
						</td>
						<!-- <td>
							<input type="text" name="patientId">
						</td> -->
					</tr>
					<tr>
						<td>
							部门
						</td>
						<td>
							<select name="user.department" id="deptSelect">
								<option value="">---请选择---</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							所属医生
						</td>
						<td>
							<select name="userId" id="userSelect">
								<option value="">请选择</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>挂号费</td>
						<td>
							<input type="text" name="price">
						</td>
					</tr>
<!-- 				<!--<tr>
						<td>挂号日期</td>
						<td>
							<input type="text" name="date">
						</td>

					</tr> -->
					<tr>
						<td>状态</td>
						<td>
						<label for="no">
							<input id="no" name="status" type="radio" checked="checked" value="未处理">未处理
						</label>
						<label for="yes">
							<input id="yes" name="status" type="radio" value="已处理">已处理
						</label>
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