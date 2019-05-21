<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.bean.Admin"%>
<%@page import="com.bean.Session"%>
<%@page import="com.bean.Room"%>

<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/uts_help" user="root" password="rootroot"/>

<%
String date = request.getParameter("datefilter");
String type = request.getParameter("typeDropbtn");
String room = request.getParameter("roomDropbtn");
String advisor = request.getParameter("advisorDropbtn");
boolean showAll = (type==null && room==null && advisor==null) || (type=="" && room=="" && advisor=="");
boolean filtered = (type!=null || room!=null || advisor!=null) && (type!="" || room!="" || advisor!="");
request.setAttribute("date", date);
request.setAttribute("type", type);
request.setAttribute("room", room);
request.setAttribute("advisor", advisor);
request.setAttribute("showAll", showAll);
request.setAttribute("filtered", filtered);

/* out.println("date: " + date + " | type: " + type + " | room " + room + " | advisor: " + advisor + "\n");
out.println("showAll? " + showAll + " | filtered? " + filtered); */
%>
<sql:query var="queryAllSessions" dataSource="${myDS}">
	SELECT * FROM session INNER JOIN room ON session.roomId=room.roomId LEFT JOIN student ON session.studentId=student.studentID;
</sql:query>
<sql:query var="queryFilterSessions" dataSource="${myDS}">
	SELECT * FROM session INNER JOIN room ON session.roomId=room.roomId LEFT JOIN student ON session.studentId=student.studentID WHERE type=? OR session.roomId=? OR adminId=?;
	<sql:param value="${type}" />
	<sql:param value="${room}" />
	<sql:param value="${advisor}" />
</sql:query>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
	<title>HELPS Booking System</title>
	<link rel="stylesheet" href="css/OneToOneSession.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	
	<!-- Include jQuery, Monment.js and Date Range Picker's file -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script type="text/javascript">
		$(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
			$('.filter').load('FilterComponent.jsp');
			$('.addOneToOneSessions').load('AddOneToOneSessions.jsp');
		});
	</script>
</head>
<body>
	<div class="head"></div>
	
	<div class="wrapper">

		<!-- Tab: Book Session; Admin Session -->
		<nav align="center">
			<a href="OneToOneSessions.jsp">Book Sessions</a> 
			<a href="OneToOneSessionsAdmin.jsp" style="border: 1px #000000 solid">Admin Sessions</a>
		</nav>

		<div id="AdminSessionsContent" class="tabcontent">
			<div class="filter" style="width:50%; float:left;"></div>
			<form method="GET" style="width:50%; float:right;">
				<p class="header_name" style="width:95%" >Your Selection:</p>
				<p>Date: <%=request.getParameter("datefilter")%></p>
				<p>Type: <%=request.getParameter("typeDropbtn")%></p>
				<p>Room: <%=request.getParameter("roomDropbtn")%></p>
				<p>Advisor: <%=request.getParameter("advisorDropbtn")%></p>
				<p><br></p>
			</form>
			
			<p class="header_name" id="sessions_available_header" style="float:left; width:97%">Sessions Available</p>
			<table class="table_session_available" id="tAdminSessionAvailable">
				<tr class="header" align="left">
					<th style="width:2%;"><input type="checkbox" name="attendance" value="No"><br></th>
					<th style="width:12%;">Date</th>
					<th style="width:7%;">Start Time</th>
					<th style="width:7%;">End Time</th>
					<th style="width:10%;">Room</th>
					<th style="width:15%;">Advisor</th>
					<th style="width:22%;">Type</th>
					<th style="width:10%;">Booked by</th>
					<th style="width:5%;">A/NA</th>
					<th style="width:5%;">Waiting</th>
				</tr>
				<c:if test="${showAll}">
					<c:forEach var="item" items="${queryAllSessions.rows }">
						<tr class="filter_result">
							<td><input type="checkbox" name="stu_attendance" value="No" /></td>
							<td><fmt:formatDate type="date" value="${item.date}"/>
							<td><fmt:formatDate pattern="HH:mm" value="${item.startTime}"/>
							<td><fmt:formatDate pattern="HH:mm" value="${item.endTime}"/>
							<td>${item.roomLocation}</td>
							<td>${item.advisorName}</td>
							<td>${item.type}</td>
							<c:choose>
									<c:when test="${item.booked =='1'}">
										<td><form action="StudentBookingDetails.jsp" method="POST">
											<input type="hidden" name="get_sessionId" value = "${item.sessionId}">
											<input type="hidden" name="get_date" value = "${item.date}">
											<input type="hidden" name="get_startTime" value = "${item.startTime}">
											<input type="hidden" name="get_endTime" value = "${item.endTime}">
											<input type="hidden" name="get_room" value = "${item.roomLocation}">
											<input type="hidden" name="get_type" value = "${item.type}">
											<input type="hidden" name="get_adminId" value = "${item.adminId}">
											<input type="hidden" name="get_advisorName" value = "${item.advisorName}">
											<input type="hidden" name="get_studentId" value = "${item.studentId}">
											<input type="hidden" name="get_studentFirstName" value = "${item.firstName}">
											<input type="hidden" name="get_studentLastName" value = "${item.lastName}">
											<input type="hidden" name="get_studentEmail" value = "${item.email}">
											<input type="hidden" name="get_subjectName" value = "${item.subjectName}">
											<input type="hidden" name="get_assignType" value = "${item.assignType}">
											<input type="hidden" name="get_isAssignment" value = "${item.isAssignment}">
											<input type="hidden" name="get_helpType" value = "${item.rule}">
											<input type="hidden" name="get_isSendToStudent" value = "${item.isSendToStudent}">
											<input type="hidden" name="get_isSendToLecture" value = "${item.isSendToLecture}">
											<input type="submit" value="${item.studentId}" id="bookedName"/>
											</form></td>
									</c:when>
									<c:otherwise>
										<td><form action="BookSpecificSession.jsp" method="POST">
											<input type="hidden" name="get_sessionId" value = "${item.sessionId}">
											<input type="hidden" name="get_date" value = "${item.date}">
											<input type="hidden" name="get_startTime" value = "${item.startTime}">
											<input type="hidden" name="get_endTime" value = "${item.endTime}">
											<input type="hidden" name="get_room" value = "${item.roomLocation}">
											<input type="hidden" name="get_type" value = "${item.type}">
											<input type="hidden" name="get_adminId" value = "${item.adminId}">
											<input type="hidden" name="get_advisorName" value = "${item.advisorName}">
											<input type="submit" value="Student Name" id="bookedName"/>
										</form></td>
									</c:otherwise>
								</c:choose>
							<td><a href="AddToWaitingList.jsp">A/Na</a></td>
							<td><a href="AddToWaitingList.jsp">Add</a></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${filtered}">
					<c:forEach var="item" items="${queryFilterSessions.rows }">
						<tr class="filter_result">
							<td><input type="checkbox" name="stu_attendance" value="No" /></td>
							<td><fmt:formatDate type="date" value="${item.date}"/>
							<td><fmt:formatDate pattern="HH:mm" value="${item.startTime}"/>
							<td><fmt:formatDate pattern="HH:mm" value="${item.endTime}"/>
							<td>${item.roomLocation}</td>
							<td>${item.advisorName}</td>
							<td>${item.type}</td>
							<c:choose>
									<c:when test="${item.booked =='1'}">
										<td><form action="StudentBookingDetails.jsp" method="POST">
											<input type="hidden" name="get_sessionId" value = "${item.sessionId}">
											<input type="hidden" name="get_date" value = "${item.date}">
											<input type="hidden" name="get_startTime" value = "${item.startTime}">
											<input type="hidden" name="get_endTime" value = "${item.endTime}">
											<input type="hidden" name="get_room" value = "${item.roomLocation}">
											<input type="hidden" name="get_type" value = "${item.type}">
											<input type="hidden" name="get_adminId" value = "${item.adminId}">
											<input type="hidden" name="get_advisorName" value = "${item.advisorName}">
											<input type="hidden" name="get_studentId" value = "${item.studentId}">
											<input type="hidden" name="get_studentFirstName" value = "${item.firstName}">
											<input type="hidden" name="get_studentLastName" value = "${item.lastName}">
											<input type="hidden" name="get_studentEmail" value = "${item.email}">
											<input type="hidden" name="get_subjectName" value = "${item.subjectName}">
											<input type="hidden" name="get_assignType" value = "${item.assignType}">
											<input type="hidden" name="get_isAssignment" value = "${item.isAssignment}">
											<input type="hidden" name="get_helpType" value = "${item.rule}">
											<input type="hidden" name="get_isSendToStudent" value = "${item.isSendToStudent}">
											<input type="hidden" name="get_isSendToLecture" value = "${item.isSendToLecture}">
											<input type="submit" value="${item.studentId}" id="bookedName"/>
											</form></td>
									</c:when>
									<c:otherwise>
										<td><form action="BookSpecificSession.jsp" method="POST">
											<input type="hidden" name="get_sessionId" value = "${item.sessionId}">
											<input type="hidden" name="get_date" value = "${item.date}">
											<input type="hidden" name="get_startTime" value = "${item.startTime}">
											<input type="hidden" name="get_endTime" value = "${item.endTime}">
											<input type="hidden" name="get_room" value = "${item.roomLocation}">
											<input type="hidden" name="get_type" value = "${item.type}">
											<input type="hidden" name="get_adminId" value = "${item.adminId}">
											<input type="hidden" name="get_advisorName" value = "${item.advisorName}">
											<input type="submit" value="Student Name" id="bookedName"/>
										</form></td>
									</c:otherwise>
								</c:choose>
							<td><a href="AddToWaitingList.jsp">A/Na</a></td>
							<td><a href="AddToWaitingList.jsp">Add</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="edit_available_sessions" align="center">
				<button onclick="updAvlbSess()" id="updateAblbSess">Update</button>
				<button onclick="delAvlbSess()" id="deleteAvlbSess">Delete</button>
			</div>
			<div class="attendance">
				<p align="center">Did student(s) attend these selected session(s)?</p>
				<div align="center">
					<select name="isAttended" style="width:5%">
							<option value="">---</option>
							<option value="Yes">Yes</option>
							<option value="No">No</option>
					</select>
					<input type="submit" name="btnMarkAttendance" value="Mark Attendance" id="btnMarkAttendance"/>
				</div>
			</div>
			<div class="addOneToOneSessions"></div>
			<div align="left" id="legendDesc">
				<p style="font-weight:bold">Legend</p>
				<p>A: Attended</p>
				<p>NA: Not Attended</p>
			</div>
		</div>
	</div>
	
	<div class="footer"></div>

</body>
</html>