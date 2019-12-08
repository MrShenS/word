<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript">
		$(function(){
			var msg = "${msg}";
			if(msg){
				alert(msg);
			}
			//批量删除
			$(".deleteBatch").on("click",function(){
				var ids = $(".dataTable input[type='checkbox']:checked").map(function(index,item){
					return $(item).val();
				}).get();
				jQuery.ajaxSetup({
					traditional:true// ids数组可以被后台接收到
				});

				$.post("/drugManage/deleteDrugs",{ids:ids},function(data){
					
					alert(ids);
					$(".menu dd:contains('医用药品管理')").trigger("click");
				});
			});
		});
		//分页
		function pageSelect(curPage){
			var url = "/drugManage/findAllDrugWithCategory/"+curPage;
			$(".b_main").load(url);
		}
		//删除
		function deleteDrug(id){
			$.post("/drugManage/deleteDrug",{id:id},function(data){
				alert(data);
				$(".menu dd:contains('医用药品管理')").trigger("click");
			});

		}
		
		//添加
		function addDrug(){
				$("#drugModal").modal('show');
				$.get("/drugManage/findCates",{},function(data){
				for(var i=0;i<data.length;i++){
					var id = data[i].id;
					var name = data[i].name;
					console.log(name);
					$("#categorySel").append('<option value='+id+'>'+name+'</option>');
				}
				//当点击取消按钮时，模态框隐藏
				$("#drugModal .cancelBtn").on("click",function(){
					$("#drugModal").modal('hide');
				});
				$("#drugModal").modal('show');
			});
			$(".modal-footer .submitBtn").on("click",function(){
				$("#drugForm").attr("action","/drugManage/saveOrUpdateDrug");
				$("#drugForm input:submit").trigger("click");
			});
			$("#drugForm").ajaxForm(function(data){
				$("#drugModal").modal("hide");
				alert(data);
				$(".menu dd:contains('医用药品管理')").trigger("click");
			});
	}
		
		//修改
		function updateDrug(id){
				$("#drugModal").modal('show');
			//当点击取消按钮时，模态框隐藏
			$("#drugModal .cancelBtn").on("click",function(){
				$("#drugModal").modal('hide');
			});
			$.get("/drugManage/findDrugWithCategoryById",{id:id},function(data){
				$("#drugForm input[name='name']").val(data.name);
				$("#drugForm input[name='id']").val(data.id);
				$("#drugForm input[name='barcode']").val(data.barcode);
				$("#drugForm input[name='description']").val(data.description);
				$("#drugForm input[name='dosageform']").val(data.dosageform);
				$("#drugForm input[name='specifications']").val(data.specifications);
				$("#drugForm input[name='primeCost']").val(data.primeCost);
				$("#drugForm input[name='price']").val(data.price);
				$("#drugForm input[name='inventory']").val(data.inventory);
				$("#drugForm input[name='minimum']").val(data.minimum);
				$("#drugForm input[name='unit']").val(data.unit);
				
				var categoryId = data.category.id;
				//查询所有的药品类别显示到下拉列表中
				 $.get("/drugManage/findCates",function(data){
					for(var i=0;i<data.length;i++){
						var id = data[i].id;
						var name = data[i].name;
						$("#categorySel").append('<option value='+id+'>'+name+'</option>');
					}
					$("#categorySel option[value='"+categoryId+"']").attr("selected","selected");
				}); 
				
				$(".modal-header .modal-title").text("修改药品");
				$("#drugModal").modal('show');
			});
			$(".modal-footer .submitBtn").on("click",function(){
				$("#drugForm").attr("action","/drugManage/saveOrUpdateDrug");
				$("#drugForm input:submit").trigger("click");
			});
			$("#drugForm").ajaxForm(function(data){
				$("#drugModal").modal('hide');
				alert(data);
				$(".menu dd:contains('医用药品管理')").trigger("click");
			});
		}
		//取药
		function medicineGetting(id){
			
			$("#dModal .modal-title").text("取药");
			$("#dModal").modal('show');
			//当点击取消按钮时，模态框隐藏
			$("#dModal .cancelBtn").on("click",function(){
				$("#dModal").modal('hide');
			});
			$("#dModal .submitBtn").on("click",function(){
				$("#dForm input[name='operation']").val("取药");
				$("#dForm input[name='id']").val(id);
				$("#dForm").attr("action","/drugManage/medicineGettingAndStore");
				$("#dForm input:submit").trigger('click');
			});
			$("#dForm").ajaxForm(function(data){
				alert("成功");
				$("#dModal").modal('hide');
				$(".menu dd:contains('医用药品管理')").trigger("click");
			});
			
		}
		//入库
		function medicineStorge(id){
			$("#dModal").modal('show');
			$("#dModal tr td:first(1)").text("入库数量");
			$("#dModal .modal-title").text("入库");
			//当点击取消按钮时，模态框隐藏
			$("#dModal .cancelBtn").on("click",function(){
				$("#dModal").modal('hide');
			});
			$("#dModal .submitBtn").on("click",function(){
				$("#dForm input[name='operation']").val("入库");
				$("#dForm input[name='id']").val(id);
				$("#dForm").attr("action","/drugManage/medicineGettingAndStore");
				$("#dForm input:submit").trigger('click');
				$("#dModal").modal('hide');
			});
			$("#dForm").ajaxForm(function(data){
				$("#dModal").modal('hide');
				alert("成功");
				$(".menu dd:contains('医用药品管理')").trigger("click");
			});
		}




	
	
	
</script>

<div class="drug">
	<div class="optios">
		<button class="addBtn" onclick="addDrug()">添加</button>
		<button class="deleteBatch">批量删除</button>
		<!-- <button class="medicineGetting" onclick="medicineGetting()">取药</button>
		<button class="storge" onclick="medicineStorge()">入库</button> -->
	</div>
	<div class="data">
		<table class="dataTable table table-striped table-bordered">
			<thead>
				<tr>
					<th>请选择</th>
					<th>编号</th>
					<th>名称</th>
					<th>药品类别</th>
					<th>条形码</th>
					<th>剂型</th>
					<th>规格</th>
					<th>单位</th>
					<th>进货价</th>
					<th>零售价</th>
					<th>库存量</th>
					<th>库存下限</th>
					<th>简介</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${drugInfo.list }" var="drugvm" varStatus="state">
					<tr>
						<td><input type="checkbox" value="${drugvm.id }" /></td>
						<td>${state.index+1 }</td>
						<td>${drugvm.name}</td>
						<td>${drugvm.category.name }</td>
						<td>${drugvm.barcode }</td>
						<td>${drugvm.dosageform }</td>
						<td>${drugvm.specifications }</td>
						<td>${drugvm.unit }</td>
						<td>${drugvm.primeCost }</td>
						<td>${drugvm.price }</td>
						<td>${drugvm.inventory }</td>
						<td>${drugvm.minimum }</td>
						<td>${drugvm.description }</td>
						<td>
						<a href="javascript:void(0)" onclick="deleteDrug(${drugvm.id})">删除</a> 
						<a href="javascript:void(0)" onclick="updateDrug(${drugvm.id})">修改</a>
						<a href="javascript:void(0)" onclick="medicineGetting(${drugvm.id})">取药</a>
						<a href="javascript:void(0)" onclick="medicineStorge(${drugvm.id})">入库</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="footTable">
			<tr>
				<td colspan="5">共${drugInfo.total} 条记录 每页${drugInfo.size } 条
					第${drugInfo.pageNum } 页 <a href="javascript:void(0)"
					onclick="pageSelect(1)">首页</a> <c:choose>
						<c:when test="${drugInfo.hasPreviousPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect(${drugInfo.prePage})">上一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">上一页</font>
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${drugInfo.hasNextPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect(${drugInfo.nextPage})">下一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">下一页</font>
						</c:otherwise>
					</c:choose> <a href="javascript:void(0)"
					onclick="pageSelect(${drugInfo.lastPage })">尾页</a>
				</td>
			</tr>

		</table>
	</div>
</div>

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="drugModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加药品</h4>
			</div>
			<div class="modal-body">
				<form action="" id="drugForm">
					<table>
						<tbody>
							<tr>
								<td style="width: 80px">药品名称</td>
								<td><input type="text" name="name" /> <input type="hidden"
									name="id"></td>
							</tr>
							<tr>
								<td style="width: 80px">请输入条形码</td>
								<td><input type="text" name="barcode"></td>
							</tr>
							<tr>
								<td>药品描述</td>
								<td><input type="text" name="description"></td>
							</tr>
							<tr>
								<td>药剂</td>
								<td><input type="text" name="dosageform"></td>
							</tr>
							<tr>
								<td>规格</td>
								<td><input type="text" name="specifications"></td>
							</tr>
							<tr>
								<td>药品单位</td>
								<td><input type="text" name="unit"></td>
							</tr>
							<tr>
								<td>所属类别</td>
								<td><select name="categoryId" id="categorySel">
										<option value="">---请选择---</option>
								</select></td>
							</tr>
							<tr>
								<td>进货价</td>
								<td><input type="text" name="primeCost"></td>
							</tr>
							<tr>
								<td>出售价</td>
								<td><input type="text" name="price"></td>
							</tr>
							<tr>
								<td>库存量</td>
								<td><input type="text" name="inventory"></td>
							</tr>
							<tr>
								<td>库存下限</td>
								<td><input type="text" name="minimum"></td>
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

<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="dModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">取药</h4>
			</div>
			<div class="modal-body">
				<form action="" id="dForm">
					<table>
						<tbody>
							<!-- <tr>
								<td style="width: 80px">药品名称</td>
								<td><input type="text" name="name" /> <input type="hidden"
									name="id"></td>
							</tr> -->
							<tr>
								<td style="width: 80px">取出数量</td>
								<td><input type="text" name="num"></td>
								<td><input type="hidden" name="operation"></td>
								<td><input type="hidden" name="id"></td>
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