
<%@page import="java.util.*"%>
<%@page import="com.bean.Student"%>
<%@page import="com.dao.Yuan2"%>
<%
	List<Student> list = (new Yuan2()).getStudents();
	session.setAttribute("list_yuan", list);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script>
	$(function(){
		$("input[id^='999']").click(function(){
			var studentId = this.id.split("_")[1];
			
			$.ajax({
				url:"Yuan3",
				type:"post",
				data:"studentId="+studentId,
				dataType:"text",
				success:function(data){
					window.location.href="myInformation.jsp";
					//window.location.reload(true);
				}
			});
		});
	});
</script>
</head>
<body>
	<table align="center" width="500px" class="table table-hover">
		<tr align="left">
			<th>student name</th>
		</tr>
		<c:forEach var="student" items="${list_yuan }">
		  	<tr align="left">
			  	<td><input id="999_${student.studentId }" value="${student.firstName }"></td>
		 	</tr>
	  </c:forEach>		
	</table>	
</body>
</html>