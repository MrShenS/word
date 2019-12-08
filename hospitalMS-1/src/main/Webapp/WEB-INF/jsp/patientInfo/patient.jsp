<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="rt" %>

<!DOCTYPE html>
<script type="text/javascript">
	function dateFormat_1(longTypeDate){  
	    var dateType = "";  
	    var date = new Date();  
	    date.setTime(longTypeDate);  
	    dateType += date.getFullYear();   //年  
	    dateType += "-" + date.getMonth(date); //月   
	    dateType += "-" + date.getDay(date);   //日  
	    return dateType;
	}

   function getFormatDateByLong(l, pattern) {   
        return getFormatDate(new Date(l), pattern);   
    } 
	$(function(){
		//批量删除
		$(".deleteBatch").on("click",function(){
			var ids = $(".dataTable input[type='checkbox']:checked").map(function(index,item){
				return $(item).val();
			}).get();
			jQuery.ajaxSetup({
				traditional:true// ids数组可以被后台接收到
			});

			$.post("/patient/deletePatients",{ids:ids},function(data){
				alert("批量删除病人信息");
				$(".menu dd:contains('病人基本信息管理')").trigger("click");
			});
		});
	});
	//添加
	function addPatient(){
		//点击添加模态框显示
		$("#patientModal").modal('show');
		//点击模态框中的保存，模拟点击form表单的提交按钮
		$(".modal-footer .submitBtn").on("click",function(){
			$("#patientForm").attr("action","/patient/saveOrUpdatePatient");
			$("#patientForm input:submit").trigger("click");
		});
		
		$("#patientForm").ajaxForm(function(data){
			//alert(data);
			$("#patientModal").modal('hide');
			alert("添加成功");
			$(".menu dd:contains('病人基本信息管理')").trigger("click");
		});
	}
	//删除
	function deletePatient(id){
		$.post("/patient/deletePatient",{id:id},function(data){
			alert(data);
			$(".menu dd:contains('病人基本信息管理')").trigger("click");
		});
	}

	//修改
	function updatePatient(id){
		$("#patientModal").modal('show');
		//先查出对应的本门显示到模态框中
		$.get("/patient/findPatientById",{id:id},function(data){
		/* 	console.log(data)*/
			console.log(data.drugallergy) 
			console.log(data.cardno) 
			console.log(data.cardNo) 
			$("#patientForm input[name='name']").val(data.name);
			$("#patientForm input[name='id']").val(data.id);
			$("#patientForm input[name='age']").val(data.age);
		    $("#patientForm input[name='birthS']").val(data.birth); 
			$("#patientForm input[name='merriage']").val(data.merriage);
			$("#patientForm input[name='address']").val(data.address);
			$("#patientForm input[name='drugallergy']").val(data.drugallergy);
			$("#patientForm input[name='cardno']").val(data.cardno);
			$("#patientForm input[name='balance']").val(data.balance);
			var radio1 = $("#patientForm input[value='男']");
			var radio2 = $("#patientForm input[value='女']");
			if(data.gender=='男'){
				radio1.attr("checked","checked");
			}else{
				radio2.attr("checked","checked");
			}
			$(".modal-header .modal-title").text("修改病人信息");
		});
		
		$("#patientModal .submitBtn").on("click",function(){
			$("#patientForm").attr("action","/patient/saveOrUpdatePatient");
			$("#patientForm input:submit").trigger("click"); 
		/* 	$.post("/patient/findAllPatient_1",{},function(data){
                alert(data)				
			}); */
			/* 
			   $("#patientForm input:submit").trigger("click");*/
		});
		
		$("#patientForm").ajaxForm(function(data){
			$("#patientModal").modal('hide');
			alert("修改成功"); nmn
			$(".menu dd:contains('病人基本信息管理')").trigger("click");
			
			
		});
		
	}
</script>
<div class="patient">
	<div class="optios">
		<button class="addBtn" onclick="addPatient()">添加</button>
		<button class="deleteBatch">批量删除</button>
	</div>
	<div class="data">
		<table class="dataTable table table-striped table-bordered">
			<thead>
				<tr>
					<th>请选择</th>
					<th>患者流水号</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>性别</th>
					<th>出生日期</th>
					<th>婚姻</th>
					<th>住址</th>
					<th>过敏史</th>
					<th>卡号</th>
					<th>余额</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${patientList }" var="patient">
				<tr>
					<td><input type="checkbox" value="${patient.id }"/></td>
					<td>${patient.id }</td>
					<td>${patient.name }</td>
					<td>${patient.age }</td>
					<td>${patient.gender }</td>
					<td><rt:formatDate value="${patient.birth }" pattern="yyyy-MM-dd"/></td>
					<td>${patient.merriage }</td>
					<td>${patient.address }</td>
					<td>${patient.drugallergy }</td>
					<td>${patient.cardno }</td>
					<td>${patient.balance }</td>
					<td>
						<a href="javascript:void(0)" onclick="deletePatient(${patient.id})">删除</a>
						<a href="javascript:void(0)" onclick="updatePatient(${patient.id})">修改</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>


<!-- 模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="patientModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加病人</h4>
      </div>
      <div class="modal-body">
        <form action="" id="patientForm">
			<table>
				<tbody>
					<tr>
						<td style="width:80px">姓名</td>
						<td><input type="text" name="name"/>
							<input type="hidden" name="id">
						</td>
					</tr>
					<tr>
						<td style="width:80px">性别</td>
						<td>
						<label for="male">
							<input id="male" type="radio" name="gender" value="男"/>男
						</label>
						<label for="female">
							<input id="female" type="radio" name="gender" value="女">女
						</label>
						</td>
					</tr>
					<tr>
						<td>年龄</td>
						<td>
							<input type="text" name="age">
						</td>
					</tr>
					<tr>
						<td>出生日期</td>
						<td>
							<input type="date" name="birthS">
						</td>
					</tr>
					<tr>
						<td>婚姻状况</td>
						<td>
							<input type="text" name="merriage">
						</td>
					</tr>
					<tr>
						<td>家庭地址</td>
						<td>
							<input type="text" name="address">
						</td>
					</tr>
					<tr>
						<td>过敏史</td>
						<td>
							<input type="text" name="drugallergy">
						</td>
					</tr>
					<tr>
						<td>卡号</td>
						<td>
							<input type="text" name="cardno"><font color="red">${msg }</font>
						</td>
					</tr>
					<tr>
						<td>余额</td>
						<td>
							<input type="text" name="balance">
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