<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
 <script>
	//分页
	function pageSelect(curPage){
		var url = "/drugManage/findAllCategory/"+curPage;
		$(".b_main").load(url);
	}
	
 	$(function(){
 		//添加
 		$(".addBtn").on("click",function(){
 			$("#categoryModal").modal('show');
 			
 			//当点击取消按钮时，模态框隐藏
			$("#categoryModal .cancelBtn").on("click",function(){
				$("#categoryModal").modal('hide');
			});
 			
 			$(".modal-footer .submitBtn").on("click",function(){
 	 			$("#categoryForm").attr("action","/drugManage/saveOrUpdateCategory");
 	 			$("#categoryForm input:submit").trigger("click");
 	 		});
 	 		$("#categoryForm").ajaxForm(function(data){
 	 			$("#categoryModal").modal('hide');
 	 			alert(data);
 	 			$(".menu dd:contains('药品类别管理')").trigger("click");
 	 		});
 		});
		
 		
 		
 		//批量删除
 		$(".optios .deleteBatch").on("click",function(){
 			var ids = $(".dataTable input[type='checkbox']:checked").map(function(index,item){
				return $(item).val();
			}).get();
 			jQuery.ajaxSetup({
				traditional:true// ids数组可以被后台接收到
			});
			$.post("/drugManage/deleteCategorys",{ids:ids},function(data){
				$(".menu dd:contains('药品类别管理')").trigger("click");
				alert(data);
			});
		});
 	});
 	//删除
 	function deleteCategory(id){
 		$.post("/drugManage/deleteCategory",{id:id},function(data){
 			alert(data);
 			$(".menu dd:contains('药品类别管理')").trigger("click");
 		});
 	}
 	//修改
 	function updateCategory(id){
 			$("#categoryModal").modal('show');
 		//当点击取消按钮时，模态框隐藏
		$("#categoryModal .cancelBtn").on("click",function(){
			$("#categoryModal").modal('hide');
		});
 		$.get("/drugManage/findCategoryById",{id:id},function(data){
 			console.log(data.description);
 			$("#categoryForm input[name='name']").val(data.name);
 			$("#categoryForm input[name='description']").val(data.description);
 			$("#categoryForm input[name='id']").val(data.id);
 		});
 		$("#categoryModal .submitBtn").on("click",function(){
			$("#categoryForm").attr("action","/drugManage/saveOrUpdateCategory");
			$("#categoryForm input:submit").trigger("click");
		});
		$("#categoryForm").ajaxForm(function(data){
			$("#categoryModal").modal('hide');
			alert(data);
			$(".menu dd:contains('药品类别管理')").trigger("click");
		});
 	}
 </script>
<div class="category">
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
					<th>药品类别名称</th>
					<th>药品类别描述</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categoryInfo.list }" var="category" varStatus="state">
				<tr>
					<td><input type="checkbox" value="${category.id }"/></td>
					<td>${category.id }</td>
					<td>${category.name }</td>
					<td>${category.description }</td>
					<td>
						<a href="javascript:void(0)" onclick="deleteCategory(${category.id})">删除</a>
						<a href="javascript:void(0)" onclick="updateCategory(${category.id})">修改</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="footTable">
			<tr>
				<td colspan="5">共${categoryInfo.total} 条记录 每页${categoryInfo.size } 条 第${categoryInfo.pageNum } 页 <a
					href="javascript:void(0)" onclick="pageSelect(1)">首页</a>
						<c:choose>	
							<c:when test="${categoryInfo.hasPreviousPage }">
							<a href="javascript:void(0)" onclick="pageSelect(${categoryInfo.prePage})">上一页</a>
							</c:when>
							<c:otherwise>
							<font color="#ABA8AB">上一页</font>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${categoryInfo.hasNextPage }">
							<a href="javascript:void(0)" onclick="pageSelect(${categoryInfo.nextPage})">下一页</a>
							</c:when>
							<c:otherwise>
							<font color="#ABA8AB">下一页</font>
							</c:otherwise>
						</c:choose>
					 <a href="javascript:void(0)" onclick="pageSelect(${categoryInfo.lastPage })">尾页</a>
				</td>
			</tr>

		</table>
	</div>
</div>

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="categoryModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加药品类别</h4>
      </div>
      <div class="modal-body">
        <form action="" id="categoryForm">
			<table>
				<tbody>
					<tr>
						<td style="width:80px">药品类别名称</td>
						<td><input type="text" name="name"/>
							<input type="hidden" name="id">
						</td>
					</tr>

					<tr>
						<td>描述</td>
						<td>
							<input type="text" name="description">
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