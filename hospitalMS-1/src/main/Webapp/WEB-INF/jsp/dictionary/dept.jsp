<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script>
	function pageSelect(curPage){
		var url = "/dept/findAllDept/"+curPage;
		$(".b_main").load(url);
	}
	
	 $(function(){
		//添加
		$(".addBtn").on("click",function(){
			//点击添加模态框显示
			$("#deptModal").modal('show');
			//当点击取消按钮时，模态框隐藏
			$("#deptModal .cancelBtn").on("click",function(){
				$("#deptModal").modal('hide');
			});
			//点击模态框中的保存，模拟点击form表单的提交按钮，此时会出发ajaxForm方法
			$(".modal-footer .submitBtn").on("click",function(){
				$("#deptForm").attr("action","/dept/saveOrupdateDept");
				$("#deptForm input:submit").trigger("click");
			});
			$("#deptForm").ajaxForm(function(data){
				$("#deptModal").modal('hide');
				alert(data);
				$(".menu dd:contains('部门管理')").trigger("click");
			});
		});

		//批量删除
		$(".deleteBatch").on("click",function(){
			var ids = $(".dataTable input[type='checkbox']:checked").map(function(index,item){
				return $(item).val();
			}).get();
			jQuery.ajaxSetup({
				traditional:true// ids数组可以被后台接收到
			});

			$.post("/dept/deleteDepts",{ids:ids},function(data){
				alert(data);
				$(".menu dd:contains('部门管理')").trigger("click");
			});
		});
	});
	//删除
	function deleteDept(id){
		$.post("/dept/deleteDept",{id:id},function(data){
			alert(data);
			$(".menu dd:contains('部门管理')").trigger("click");
		});
	}
	//修改
	function updateDept(id){
		//先查出对应的本门显示到模态框中
		$.get("/dept/findDeptById",{id:id},function(data){
			$("#deptForm input[name='name']").val(data.name);
			$("#deptForm input[name='id']").val(data.id);
			$("#deptForm input[name='description']").val(data.description);
			var radio1 = $("#deptForm input[value='是']");
			var radio2 = $("#deptForm input[value='否']");
			if(data.status=='是'){
				radio1.attr("checked","checked");
			}
			$(".modal-header .modal-title").text("修改部门");
			$("#deptModal").modal('show');
			//当点击取消按钮时，模态框隐藏
			$("#deptModal .cancelBtn").on("click",function(){
				$("#deptModal").modal('hide');
			});
		});
		/* 当点击模太框中的保存按钮时模拟点击form表单中的提交按钮，
		因为使用了jqueryform插件中的ajaxForm方法，
		所以点击form表单中的提交按钮会出发该方法 */
		$("#deptModal .submitBtn").on("click",function(){
			$("#deptForm").attr("action","/dept/saveOrupdateDept");
			$("#deptForm input:submit").trigger("click");
		});
		$("#deptForm").ajaxForm(function(data){
			$("#deptModal").modal('hide');
			alert(data);
			$(".menu dd:contains('部门管理')").trigger("click");
		});
	} 

</script>
<div class="dept">
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
					<th>部门名称</th>
					<th>是否可以挂号</th>
					<th>部门描述</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${deptInfo.list }" var="dept">
				<tr>
					<td><input type="checkbox" value="${dept.id }"/></td>
					<td>${dept.id }</td>
					<td>${dept.name }</td>
					<td>${dept.status }</td>
					<td>${dept.description }</td>
					<td>
						<a href="javascript:void(0)" onclick="deleteDept(${dept.id})">删除</a>
						<a href="javascript:void(0)" onclick="updateDept(${dept.id})">修改</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="footTable">
			<tr>
				<td colspan="5">共${deptInfo.total } 条记录 每页${deptInfo.size } 条 第${deptInfo.pageNum } 页 <a
					href="javascript:void(0)" onclick="pageSelect(1)">首页</a>
						<c:choose>	
							<c:when test="${deptInfo.hasPreviousPage }">
							<a href="javascript:void(0)" onclick="pageSelect(${deptInfo.prePage})">上一页</a>
							</c:when>
							<c:otherwise>
							<font color="#ABA8AB">上一页</font>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${deptInfo.hasNextPage }">
							<a href="javascript:void(0)" onclick="pageSelect(${deptInfo.nextPage})">下一页</a>
							</c:when>
							<c:otherwise>
							<font color="#ABA8AB">下一页</font>
							</c:otherwise>
						</c:choose>
					 <a href="javascript:void(0)" onclick="pageSelect(${deptInfo.lastPage })">尾页</a>
				</td>
			</tr>

		</table>
	</div>
</div>

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="deptModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加部门</h4>
			</div>
			<div class="modal-body">
				<form action="" id="deptForm">
					<table>
						<tbody>
							<tr>
								<td style="width: 80px">部门名称</td>
								<td><input type="text" name="name" /> <input type="hidden"
									name="id" value=""></td>
							</tr>
							<tr>
								<td style="width: 80px">是否可挂号</td>
								<td><label for="yes"> <input id="yes" type="radio"
										name="status" value="是" />是
								</label> <label for="no"> <input id="no" type="radio"
										name="status" value="否">否
								</label></td>
							</tr>
							<tr>
								<td>描述</td>
								<td><input type="text" name="description"></td>
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
