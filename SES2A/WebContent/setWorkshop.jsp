<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELPS Booking System</title>
<link rel="stylesheet" href="css/setWorkshops.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.head').load('admin_head.html');
		$('.footer').load('admin_footer.html');
	});
</script>
</head>
<div class="head"></div>
<body>
	

	<div class="wrapper">
		
		<div style="margin-top:2em"></div>
		<form action="workshop" method="post">
			<div class="title">Skill-set:&nbsp;</div>
			<input type="hidden" name="action" value="insertSkillSet" required="required"/> 
			<input id="skillsInput" name="name" type="text"> 
			<input type="submit" value="Add"/>
		</form>
		<table rules="rows">
			<tbody>
				<tr>
					<th>No</th>
					<th>
						<!-- <input type="checkbox"> -->select
					</th>
					<th>Skill-set</th>
					<th>Short Title</th>
					<th></th>
				</tr>

				<c:forEach items="${skillSets}" var="item" varStatus="status">
					<tr>
						<th>
							<%-- <select class="skillSetId" data-index="${item.skillSetId }">
								<c:forEach var="s"  begin="1" end="${fn:length(skillSets)}" >
									<option   <c:if test="${status.index+1 == s }"> selected </c:if> >${s}</option>
								</c:forEach>
							</select> --%> ${status.index+1 }
						</th>
						<th><input type="radio" name="sel" class="sel"
							value="${item.skillSetId}"></th>
						<th style="width: 30%;"><input readonly="readonly"
							value="${item.name}"></th>
						<th style="width: 30%;"><input name="shortName"
							value="${item.shortName}"></th>
						<th><a href="/SES2A/Work2?showWorkShop&skillSetId=${item.skillSetId}">SetWorkshops</a></th><!-- workshop?action=showWorkShop&skillSetId=${item.skillSetId} -->
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="buttonArea">
			<button>Archive</button>
			<button id="Update">Update</button>
		</div>
	</div>
	<div class="footer"></div>
</body>
<script type="text/javascript">
 $(function(){
	
	$("#Update").click(function(){
		
		var skillSetId = $(".sel:checked").val();
		var shortName = $(".sel:checked").parent().next().next().children().val();
		
		$.ajax({
			url:"workshop",
			data:{"skillSetId":skillSetId,"shortName":shortName,"action":'updateSkillSet'},
			type:"post",
			async: false ,
			success:function(result){
				if(result=='success'){
					window.location.href="workshop?action=toSkillSet"
				}
			}
		});
		
		
	});
	
	
	/* $(".skillSetId").change(function(){
		
		var newv = $(this).val();
		var oldv=$(this).attr("data-index");
		
		$.ajax({
			url:"workshop",
			data:{"id1":newv,"id2":oldv,"action":'changeSkillSet'},
			type:"post",
			async: false ,
			success:function(result){
				if(result=='success'){
					window.location.href="workshop?action=toSkillSet"
				}
			}
		});
	}) */
	
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
</html>