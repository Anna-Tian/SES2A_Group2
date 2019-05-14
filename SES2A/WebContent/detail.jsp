<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HELPS Booking System</title>
	<link rel="stylesheet" href="css/createNewsession.css" />
	<link rel="stylesheet" href="css/emailTemplate.css" />
    <link rel="stylesheet" href="css/adminMenu.css">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	
    <script type="text/javascript">
		$(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
		});
		
	</script>
	<!-- Include jQuery, Monment.js and Date Range Picker's file -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<style type="text/css">
	.wrapper {
	    width: 75%;
	    margin: 0 auto;
	    height:1300px;
	    padding-left: 10px;
	    padding-right: 10px;
	    border-left: 2px #95e0fd solid;
	    border-right: 2px #95e0fd solid;
	}
	
	.left{
		width:50%;
		float: left;
	}
	.right{
		width:50%;
		float: left;
	}
	</style>
</head>
<body>
   <div class="head"></div>
	<!-- UTS Logo -->
	<!-- <div id="global-utility-bar">
		<div id="uts-logo">
			<a href="http://www.uts.edu.au"><img src="https://web-common.uts.edu.au/images/utslogo.gif" alt="University of Technology, Sydney homepage" width="132" height="30" /></a>
		</div>
	</div> -->
	
	<div class="wrapper">
	<p class="header_name" id="filter_sessions_header">work shop detail</p>
	<div>
		<form action="workshop" method="post">
			<table style="padding-bottom:10px;width: 70%" >
				<tr>
					<td>Topic</td>
					<td>
					<input type="hidden" name="action" value="update">
					<input type="hidden" style="width:60%" name="workShopId"  value="${workShop.workShopId}">
					<input type="text" style="width:60%" name="name"  value="${workShop.name}">
					</td>
				</tr>
				<tr>
					<td>Target Group</td>
					<td><textarea rows="6" cols="80" name="targetGroup" >${workShop.targetGroup}</textarea></td>
				</tr>
				<tr>
					<td>What it covers</td>
					<td><textarea rows="6" cols="80" name="description">${workShop.description }</textarea></td>
				</tr>
				<tr>
					<td>Cat-off</td>
					<td><input type="text" name="placeAvailable" value="${workShop.placeAvailable}"></td>
				</tr>
				<tr>
					<td>MaxiNum</td>
					<td><input type="text" name="maximumPlace" value="${workShop.maximumPlace}"></td>
				</tr>
				<tr>
					<td>When</td>
					<td>${workShop.startDate}</td>
				</tr>
				<tr>
					<td>Room</td>
					<td><select name="roomDropbtn" style="width:40%">
							<c:forEach items="${rooms }" var="tt">
								<option <c:if test="${tt.roomId==workShop.room.roomId}">selected</c:if> value="${tt.roomId}">${tt.roomLocation}</option>
						    </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit"  value="update" id="update"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<p class="header_name" id="filter_sessions_header">student list</p>
	
	
	<div class="left">
	<br>
	<input type="checkbox"> Send an email to students
		<h2>Booking list</h2>
		<form action="workshop">
			<input type="hidden" name="action" value="bookAdd">
			<input type="hidden" name="workShopId"  value="${workShop.workShopId}">
			Student Id:<input type="text" name="stuid"><br>
			<br>
			<input type="submit" value="Add">
		</form>
		<br>
		<table>
		<tr>
			<th><input type="checkbox"></th>
			<th>StudentId</th>
			<th>Booked date</th>
			<th>Attendance</th>
		</tr>
		<c:forEach items="${workShop.attendances}" var="stu">
			<tr>
				<td><input type="checkbox"></td>
				<td>${stu.student.studentId }</td>
				<td><fmt:formatDate value="${stu.date}" pattern="dd/MM/yyyy" /></td>
				<td>${stu.isPresent?'yes':'---'}</td>
			</tr>
		</c:forEach>
		<tr>
		<td colspan="4">
			<input type="button" value="Yes">
			<input type="button" value="No">
			<input type="button" value="Cancel">
		</td>
		</tr>
		</table>
	</div>
	
	<div class="right">
		<br><br>
		<h2>Waiting list</h2>
		
		<br>
		<c:if test="${fn:length(waiting)<=0}">
		<P>There is no student in zhe waiting list</P>
		</c:if>
		<table>
		<c:forEach items="${waiting}" var="ww">
			<tr>
				<td>${ww.studentId }</td>
			</tr>
		</c:forEach>
		<tr>
			
		</tr>
		</table>
	</div>
	</div>
	
	<div class="footer"></div>
	
</body>
</html>

<!-- Date Range Picker -->
<script type="text/javascript">
	$(function() {
		$('input[name="startDatePicker"]').daterangepicker({
			autoUpdateInput: false,
			locale: {
				cancelLabel: 'Clear'
			}
		});
		$('input[name="startDatePicker"]').on('apply.daterangepicker', function(ev, picker) {
			//$(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
			//$(this).val(picker.startDate.format('DD/MM/YYYY'));
		});
		$('input[name="startDatePicker"]').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$('input[name="endDatePicker"]').daterangepicker({
			autoUpdateInput: false,
			locale: {
				cancelLabel: 'Clear'
			}
		});
		$('input[name="endDatePicker"]').on('apply.daterangepicker', function(ev, picker) {
			//$(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
			//$(this).val(picker.startDate.format('DD/MM/YYYY')); 
		});
		$('input[name="endDatePicker"]').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});
	});
	
	var skillSetId='${param.skillSetId}';
	$(function(){
		$("#btnAddSessions").click(function(){
			var ss="";
			
			$(".add_session_content").each(function(index,item){
				
				var topic = $(item).find(".topic").val();
				
				var startDatePicker = $(item).find(".startDatePicker").val();
				var endDatePicker = $(item).find(".endDatePicker").val();
				var startTimePicker = $(item).find(".startTimePicker").val();
				var endTimePicker = $(item).find(".endTimePicker").val();
				
				var roomDropbtn = $(item).find("[name=roomDropbtn]").val();
				var Max = $(item).find("[name=Max]").val();
				var CO = $(item).find("[name=CO]").val();
				
				console.log(topic+" "+startDatePicker+" "+endDatePicker+" "+startTimePicker+" "+endTimePicker+" "
						+roomDropbtn+" "+Max+" "+CO+" "+skillSetId);
				
				var startDate=startDatePicker+" "+startTimePicker;
				var endDate = endDatePicker+" "+endTimePicker;
				
				ss+=topic+","+startDate+","+endDate+","+Max+","+CO+","+roomDropbtn+","+skillSetId+"@";
				
				
			});
			
			 $.ajax({
				url:"workshop",
				data:{"ss":ss,"action":'addworkshop'},
				type:"post",
				async: false ,
				success:function(result){
					if(result=='success'){
						window.location.href="workshop?action=showWorkShop&skillSetId="+skillSetId;
					}
				}
			}); 
			
		});
		
		
		$("#all").click(function(){
			
			var ischeck = $(this).prop("checked");
			if(ischeck){
				$("[name=ck]").prop('checked',true);
			}else{
				$("[name=ck]").prop('checked',false);
			}
			
		})
		
		
		$("#delete").click(function(){
			var cks = '';
			$("[name=ck]:checked").each(function(index,item){
				cks += $(item).val()+",";
			});
			
			 $.ajax({
				url:"workshop",
				data:{"cks":cks,"action":'deleteworkshop'},
				type:"post",
				async: false ,
				success:function(result){
					if(result=='success'){
						window.location.href="workshop?action=showWorkShop&skillSetId="+skillSetId;
					}
				}
			});
			
		})
		
	})
</script>
<script type="text/javascript">
		$(document).ready(function(){
			$('select').change(function(){
				var value=$("select").find("option:selected").val();
				
				if(value!=" "){
					$(changeTemplate).removeClass('hide');
				}else{
					$(changeTemplate).addClass('hide');
				}
			})
		})
	</script>








