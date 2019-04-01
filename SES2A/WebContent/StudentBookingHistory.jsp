<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HELPS Booking System</title>
	<link rel="stylesheet" href="css/BookSpecificSession.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script type="text/javascript">
		$(function(){
			{
				var sessions1 = "${sessions_a }";
				var sessions2 = "${sessions_b }";
				var sessions3 = "${sessions_c }";
				var sessions4 = "${sessions_d }";
				if(sessions1==""){
					$("#hasBooking").hide();
					$("#nonBooking").show();
				}else{
					$("#hasBooking").show();
					$("#nonBooking").hide();
				}
				if(sessions2==""){
					$("#hasWaitingSessions").hide();
					$("#nonWaitingSessions").show();
				}else{
					$("#hasWaitingSessions").show();
					$("#nonWaitingSessions").hide();
				}
				if(sessions3==""){
					$("#hasWorkshopBooking").hide();
					$("#nonWorkshopBooking").show();
				}else{
					$("#hasWorkshopBooking").show();
					$("#nonWorkshopBooking").hide();
				}
				if(sessions4==""){
					$("#hasWorkshopWaiting").hide();
					$("#nonWorkshopWaiting").show();
				}else{
					$("#hasWorkshopWaiting").show();
					$("#nonWorkshopWaiting").hide();
				}
			}
		});
	</script>
</head>
<body>
	<div id="global-utility-bar">
		<div id="uts-logo">
			<a href="http://www.uts.edu.au"><img src="https://web-common.uts.edu.au/images/utslogo.gif" alt="University of Technology, Sydney homepage" width="132" height="30" /></a>
		</div>
	</div>

	<p class="header_name" id="student_booking_history_header" style="margin-top:2em">
		Student history: Na Tian. (Preferred First Name: Anna)(ID:12879678)
	</p>
	<p>Registration date: 02/04/2019</p>
	<div style="border-bottom: 1px solid #000000;padding-bottom:5px">
		<h3>Bookings</h3>
		<div id="hasBooking">
			<p>Student booked into the following session(s):</p>
			<table style="border-bottom: 1px solid #ddd;">
				<tr >
					<th style="width:30%;">Date/Time</th>
					<th style="width:10%;">Campus</th>
					<th style="width:25%;">Type</th>
					<th style="width:10%;">Advisor</th>
					<th style="width:20%;">Attended</th>
					<th style="width:5%;"></th>
				</tr>
				<c:forEach var="session1" items="${sessions_a }">
					<tr align="left">
						<td>${session1.attr1 }</td>
						<td>${session1.attr2 }</td>
						<td>${session1.attr3 }</td>
						<td>${session1.attr4 }</td>
						<td>${session1.attr5 }</td>
						<td>${session1.attr6 }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="nonBooking">
			<p>Student did not book any sessions</p>
		</div>
	</div>
	<div style="border-bottom: 1px solid #000000;padding-bottom:5px">
		<h3>Waiting sessions</h3>
		<div id="hasWaitingSessions">
			<table style="border-bottom: 1px solid #ddd;">
				<tr >
					<th style="width:30%;">Date/Time</th>
					<th style="width:10%;">Campus</th>
					<th style="width:25%;">Type</th>
					<th style="width:30%;">Lecture</th>
					<th style="width:5%;"></th>
				</tr>
				<c:forEach var="session2" items="${sessions_b }">
					<tr align="left">
						<td>${session2.attr1 }</td>
						<td>${session2.attr2 }</td>
						<td>${session2.attr3 }</td>
						<td>${session2.attr4 }</td>
						<td>${session2.attr5 }</td>
						<td>${session2.attr6 }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="nonWaitingSessions">
			<p>Student did not wait for any sessions</p>
		</div>
	</div>
	<div style="border-bottom: 1px solid #000000;padding-bottom:5px">
		<h3>Workshop booking</h3>
		<div id="hasWorkshopBooking">
			<table style="border-bottom: 1px solid #ddd;">
				<tr >
					<th style="width:30%;">Topic</th>
					<th style="width:15%;">Start Date</th>
					<th style="width:15%;">Finish Date</th>
					<th style="width:15%;">Time</th>
					<th style="width:15%;">Campus</th>
				</tr>
				<c:forEach var="session3" items="${sessions_c }">
					<tr align="left">
						<td>${session3.attr1 }</td>
						<td>${session3.attr2 }</td>
						<td>${session3.attr3 }</td>
						<td>${session3.attr4 }</td>
						<td>${session3.attr5 }</td>
						<td>${session3.attr6 }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="nonWorkshopBooking">
			<p>Student did not book any workshops</p>
		</div>
	</div>
	<div style="padding-bottom:5px">
		<h3>Workshop waiting</h3>
		<div id="hasWorkshopWaiting">
			<table style="border-bottom: 1px solid #ddd;">
				<tr >
					<th style="width:30%;">Topic</th>
					<th style="width:15%;">Start Date</th>
					<th style="width:15%;">Finish Date</th>
					<th style="width:15%;">Time</th>
					<th style="width:15%;">Campus</th>
				</tr>
				<c:forEach var="session4" items="${sessions_d }">
					<tr align="left">
						<td>${session4.attr1 }</td>
						<td>${session4.attr2 }</td>
						<td>${session4.attr3 }</td>
						<td>${session4.attr4 }</td>
						<td>${session4.attr5 }</td>
						<td>${session4.attr6 }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="nonWorkshopWaiting">
			<p>Student did not wait for any workshop sessions</p>
		</div>
	</div>

</body>
</html>