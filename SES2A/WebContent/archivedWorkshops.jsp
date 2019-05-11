<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.dao.skillsetDao"%>
<%@page import="java.util.*"%>
<%@page import="com.bean.SkillSet"%>
<%
skillsetDao sDao = new skillsetDao();
List<SkillSet> skillSet = sDao.getSkillSet();
System.out.println("Test: "+skillSet);
request.getSession().setAttribute("skillSet", skillSet);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Archived Workshops</title>
	<link rel="stylesheet" href="css/archivedWorkshops.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');			
			
			$("#add_skillset").click(function(){
				var name = $("#skillsInput").val();
				alert(name); 
				$.ajax({
					url: "SkillsetServlet_add",
					type: "post",
					data: "name="+name,
					dataType: "text",
					success: function(data){
						location.href="archivedWorkshops.jsp";
					}
				});
			});
		});
	</script>
</head>
<body>
	<div class="head"></div>
	<div class="wrapper">
		<h2>Archived Workshops</h2>
		<div></div>
		<div class="title">Skill-set:&nbsp;</div>
		<input id="skillsInput" type="text">
		<button id="add_skillset">Add</button>
		<table rules="rows">
			<tbody>
				<tr>
					<th>No</th>
					<th>
						<input type="checkbox">
					</th>
					<th style="width: 70%;">Skill-set</th>
					<th style="width: 30%;">Short Title</th>
					<th></th>
				</tr>
				<c:forEach var="skill_set" items="${skillSet}">
					<tr>
						<th>
							<select>
								<%-- <c:forEach var="" begin="1" end="">
									<option></option>
								</c:forEach> --%>
								<option>${skill_set.skillSetId}</option>
							</select>
						</th>
						<th>
							<input type="checkbox">
						</th>
						<th style="width: 70%;">
							<input placeholder="${skill_set.name}" readonly="readonly">
						</th>
						<th style="width: 30%;">
							<input placeholder="${skill_set.shortName}">
						</th>
						<th>
							<a href="">View</a>
						</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="buttonArea">
			<button>Archive</button>
			<button>Update</button>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>