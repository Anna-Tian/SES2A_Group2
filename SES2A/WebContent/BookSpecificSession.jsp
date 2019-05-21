<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.text.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.bean.Admin"%>
<%@page import="com.bean.Session"%>
<%@page import="com.bean.Room"%>

<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/uts_help" user="root" password="rootroot"/>


<%
String sessionId = request.getParameter("get_sessionId");
String dateStr = request.getParameter("get_date");
String startTimeStr = request.getParameter("get_startTime");
String endTimeStr = request.getParameter("get_endTime");
String room = request.getParameter("get_room");
String type = request.getParameter("get_type");
String advisorName = request.getParameter("get_advisorName");
String adminId = request.getParameter("get_adminId");

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date util_a = dateFormat.parse(dateStr);
java.util.Date util_b = timeFormat.parse(startTimeStr);
java.util.Date util_c = timeFormat.parse(endTimeStr);
java.sql.Date date = new java.sql.Date(util_a.getTime());
java.sql.Timestamp startTime = new java.sql.Timestamp(util_b.getTime());
java.sql.Timestamp endTime = new java.sql.Timestamp(util_c.getTime());

request.setAttribute("sessionId", sessionId);
request.setAttribute("date", date);
request.setAttribute("startTime", startTime);
request.setAttribute("endTime", endTime);
request.setAttribute("room", room);
request.setAttribute("type", type);
request.setAttribute("advisorName", advisorName);
request.setAttribute("adminId", adminId);
%>




<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HELPS Booking System</title>
	<link rel="stylesheet" href="css/BookSpecificSession.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	  	/* help others box */
		$(function(){
	  		$('[name="helpType"][value="Others"]').change(function(){
	  			if ($(this).is(':checked')) {
	  				document.getElementById('otherHelpTypeRichText').style.display = "block";
				}else{
					document.getElementById('otherHelpTypeRichText').style.display = "none";
				}
			});
		});
	  	/* check detailed rules */
	  	$(function(){
	  		$('[name="additionalBook"][value="checkRule"]').change(function(){
	  			if ($(this).is(':checked')) {
	  				document.getElementById('checkRuleDetails').style.display = "block";
				}else{
					document.getElementById('checkRuleDetails').style.display = "none";
				}
			});
		});
	</script>
	
	<script type="text/javascript">
		$(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
		});
	</script>
</head>
<body>
	<div class="head"></div>
	<div class="wrapper">
		<p class="header_name" id="specific_book_header">Book Session</p>
		<form method="POST" action="BookSpecSessConfirm.jsp" id="specific_book_form">
			<input type="hidden" name="get_sessionId" value = "${sessionId}">
			<div>
				<div class="form_part1">
					<p>Date: <strong><fmt:formatDate type="date" value="${date}" /></strong></p>
					<p>Time: <strong><fmt:formatDate pattern="HH:mm" value="${startTime}"/> - <fmt:formatDate pattern="HH:mm" value="${endTime}"/></strong></p>
				</div>
				<div class="form_part2">
					<p>Advisor: <strong><c:out value="${advisorName}"/></strong></p>
					<p>Campus: <strong><c:out value="${room}"/></strong></p>
				</div>
			</div>
			
			<div class="form_part3" style="width:100%">
				<p>Type: <strong><c:out value="${type}"/></strong></p>
				<p>Student ID*: <input type="Text" name="studentId" value="" maxlength="10"/></p>
				<p>Subject Name* <input type="Text" name="subjectName" value="" width="70%"/></p>
				<p>Assignment Type* 
					<select name="assignmentTypeDropbtn" style="width:10%">
							<option value=""></option>
							<option value="Abstract and Executive Summary">Abstract and Executive Summary</option>
							<option value="Annotated Bibliography">Annotated Bibliography</option>
							<option value="Case Study">Case Study</option>
							<option value="Critical Review">Critical Review</option>
							<option value="Essay">Essay</option>
							<option value="Literature Review">Literature Review</option>
							<option value="Reflective Journal">Reflective Journal</option>
							<option value="Report">Report</option>
							<option value="Research Proposal">Research Proposal</option>
					</select>
				</p>
				<p>Is this a group assignment?
					<input type="radio" name="rdoGroupAssignment" value="Yes" id="rdoGroupAssignment_Yes"/>Yes
					<input type="radio" name="rdoGroupAssignment" value="No" id="rdoGroupAssignment_No"/>No
				</p>
				<p>I need help with ... </p>
				<input type="checkbox" name="helpType" value="Answer question">Answering the assignment question (please provide the question to your advisor)<br>
				<input type="checkbox" name="helpType" value="Marking criteria">Addressing the marking criteria (please provide the criteria to your advisor)<br>
				<input type="checkbox" name="helpType" value="Structure">Structure<br>
				<input type="checkbox" name="helpType" value="Paragraph Development">Paragraph development<br>
				<input type="checkbox" name="helpType" value="Referencing">Referencing<br>
				<input type="checkbox" name="helpType" value="Grammar">Grammar<br>
				<input type="checkbox" name="helpType" value="Others">Other, please specify below<br>
				<textarea rows="4" cols="50" id="otherHelpTypeRichText"></textarea>
				<div align="center" style="margin-top:3em">
					<input type="submit" name="btnBookSpecificSession" value="Book this sessions" id="btnBookSpecificSession"><br>
					<input type="checkbox" name="sendToStudent" value="true">Send email to student<br>
					<input type="checkbox" name="sendToLecture" value="true">Send email to lecturer (by default, no email is sent to lecturer)<br>
					<input type="checkbox" name="additionalBook" value="checkRule">Check rule<br>
				</div>
				<div id="checkRuleDetails" style="display:none">
					<p>Rule:</p>
					<p>- A session must be booked / cancelled / put into the waiting list at least 24 hour before appointment.</p>
					<p>- Student can only be put into the waiting list for the max 3 sessions for the week</p>
					<p>- Student cannot make appointments for 1 year after 2nd no-show</p>
					<p>- Student can book for up to 1 session per week</p>
					<p>- Student can book for up to 3 sessions in advance</p>
				</div>
			</div>
			
		</form>
	</div>
	<div class="footer" style="margin-top:3em"></div>
</body>
</html>