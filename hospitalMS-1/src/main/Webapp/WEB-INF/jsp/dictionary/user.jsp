<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="rt" %>
<!DOCTYPE html>
<script type="text/javascript">
	//分页
	function pageSelect(curPage){
		var url = "/user/findUserWithDept/"+curPage;
		$(".b_main").load(url);
	}
	$(function(){
		//添加
		$(".optios .addBtn").on("click",function(){
			//当点击添加按钮时，先查出所有部门和角色，显示到模态框中的下拉列表中

			//查询所有的部门显示到下拉列表中
			$.get("/dept/findDepts",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#deptSelect").append('<option value='+id+'>'+name+'</option>');
			}
		});
			
			//查询所有的角色显示到下拉列表中
			$.get("/role/findAllRole",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#roleSelect").append('<option value='+id+'>'+name+'</option>');
			}
			
			});
		$("#userModal").modal('show');
		});
		//点击保存按钮
		$(".modal-footer .submitBtn").on("click",function(){
			//改变form表单提交的地址
			$("#userForm").attr("action","/user/saveOrUpdate");
			//模拟点击submit按钮
			$("#userForm input:submit").trigger("click");
		});
		$("#userForm").ajaxForm(function(data){
			$("#userModal").modal('hide');
			alert(data);
			$(".menu dd:contains('职工管理')").trigger("click");
		});
		//批量删除
		$(".deleteBatch").on("click",function(){
			var ids = $(".dataTable input[type='checkbox']:checked").map(function(index,item){
				return $(item).val();
			}).get();
			jQuery.ajaxSetup({
				traditional:true// ids数组可以被后台接收到
			});

			$.post("/user/deleteUsers",{ids:ids},function(data){
				alert(data);
				$(".menu dd:contains('职工管理')").trigger("click");
			});
		});
	});

	//删除
	function deleteUser(id){
		$.post("/user/deleteUser",{id:id},function(data){
			alert(data);
			$(".menu dd:contains('职工管理')").trigger("click");
		});
	}
	//修改
	function updateUser(id){
			$("#userModal").modal('show');
			//查询所有的部门显示到下拉列表中
			$.get("/dept/findDepts",{},function(data){
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					$("#deptSelect").append('<option value='+id+'>'+name+'</option>');
				}
					/* 
						选中原有的部门
					*/
				$("#deptSelect option[value='"+departmentId+"']").attr("selected","selected");
			});
			
			
			//查询所有的角色显示到下拉列表中
			$.get("/role/findAllRole",{},function(data){
			for(var i=0;i<data.length;i++){
				var id = data[i].id;
				var name = data[i].name;
				$("#roleSelect").append('<option value='+id+'>'+name+'</option>');
			}
				/*
					选中原有的角色
				*/
				
			$("#roleSelect option[value='"+roleId+"']").attr("selected","selected");
			});
			
		//先查出对应的user以及关联的部门角色显示到模态框中
		$.get("/user/findUserWithDeptAndRoleById",{id:id},function(data){
			$("#userForm input[name='name']").val(data.name);
			$("#userForm input[name='id']").val(data.id);
			$("#userForm input[name='phone']").val(data.phone);
			$("#userForm input[name='card']").val(data.card);
			$("#userForm input[name='position']").val(data.position);
			$("#userForm input[name='address']").val(data.address);
			$("#userForm input[name='birthS']").val(data.birth);
			$("#userForm input[name='education']").val(data.education);
			$("#userForm input[name='professional']").val(data.professional);
			var radio1 = $("#userForm input[value='男']");
			var radio2 = $("#userForm input[value='女']");
			if(data.gender=='男'){
				radio1.attr("checked","checked");
			}
			
			var departmentId = data.department.id;
			var roleId = data.role.id;
		
			$(".modal-header .modal-title").text("修改部门");
			
			
			
			
			//当点击取消按钮时，模态框隐藏
			$("#userModal .cancelBtn").on("click",function(){
				$("#userModal").modal('hide');
			});
		});
		/* 当点击模太框中的保存按钮时模拟点击form表单中的提交按钮，
		因为使用了jqueryform插件中的ajaxForm方法，
		所以点击form表单中的提交按钮会出发该方法 */
		$("#userModal .submitBtn").on("click",function(){
			$("#userForm").attr("action","/user/saveOrUpdate");
			$("#userForm input:submit").trigger("click");
		});
		$("#userForm").ajaxForm(function(data){
			$("#userModal").modal('hide');
			alert(data);
			$(".menu dd:contains('职工管理')").trigger("click");
		});
	} 
	
</script>
<div class="user">
	<div class="optios">
		<button class="addBtn">添加</button>
		<button class="deleteBatch">批量删除</button>
	</div>
	<div class="data">
		<table class="dataTable table table-striped table-bordered">
			<thead>
				<tr>
					<th>请选择</th>
					<th>编号</th>
					<th>员工号</th>
					<th>姓名</th>
					<th>所在部门</th>
					<th>性别</th>
					<th>出生日期</th>
					<th>电话号码</th>
					<th>籍贯</th>
					<th>身份证号</th>
					<th>学历</th>
					<th>职称</th>
					<th>职位</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userInfo.list }" var="user" varStatus="state">
					<tr>
						<td><input type="checkbox" value="${user.id }" /></td>
						<td>${state.index+1}</td>
						<td>${user.id }</td>
						<td>${user.name }</td>
						<td>${user.department.name }</td>
						<td>${user.gender }</td>
						<td><rt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/></td>
						<td>${user.phone }</td>
						<td>${user.address }</td>
						<td>${user.card }</td>
						<td>${user.education }</td>
						<td>${user.position }</td>
						<td>${user.professional }</td>
						<td>
						<a href="javascript:void(0)" onclick="deleteUser(${user.id})">删除</a> 
						<a href="javascript:void(0)" onclick="updateUser(${user.id})">修改</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="footTable">
			<tr>
				<td colspan="5">共${userInfo.total } 条记录 每页${userInfo.size } 条
					第${userInfo.pageNum } 页 <a href="javascript:void(0)"
					onclick="pageSelect(1)">首页</a> <c:choose>
						<c:when test="${userInfo.hasPreviousPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect(${userInfo.prePage})">上一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">上一页</font>
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${userInfo.hasNextPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect(${userInfo.nextPage})">下一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">下一页</font>
						</c:otherwise>
					</c:choose> <a href="javascript:void(0)"
					onclick="pageSelect(${userInfo.lastPage })">尾页</a>
				</td>
			</tr>

		</table>
	</div>
</div>


<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="userModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加员工</h4>
			</div>
			<div class="modal-body">
				<form action="" id="userForm">
					<table>
						<tbody>
							<tr>
								<td style="width: 80px">姓名</td>
								<td><input type="text" name="name" /> <input type="hidden"
									name="id"></td>
							</tr>
							<tr>
								<td style="width: 80px">性别</td>
								<td><label for="male"> <input id="male"
										type="radio" name="gender" value="男" />男
								</label> <label for="female"> <input id="female" type="radio"
										name="gender" value="女">女
								</label></td>
							</tr>
							<tr>
								<td>电话号码</td>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<td>身份证号</td>
								<td><input type="text" name="card"></td>
							</tr>
							<tr>
								<td>职称</td>
								<td><input type="text" name="position"></td>
							</tr>
							<tr>
								<td>家庭地址</td>
								<td><input type="text" name="address"></td>
							</tr>
							<tr>
								<td>所在部门</td>
								<td><select name="departmentId" id="deptSelect">
										<option value="">---请选择---</option>
								</select></td>
							</tr>
							<tr>
								<td>角色</td>
								<td><select name="roleId" id="roleSelect">
										<option value="">---请选择---</option>
								</select></td>
							</tr>
							<tr>
								<td>出生日期</td>
								<td><input type="date" name="birthS"></td>
							</tr>
							<tr>
								<td>学历</td>
								<td><input type="text" name="education"></td>
							</tr>
							<tr>
								<td>职位</td>
								<td><input type="text" name="professional"></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" style="display: none">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default cancelBtn">取消</button>
				<button type="button" class="btn btn-primary submitBtn">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
