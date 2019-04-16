<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
	
</head>
<body>
	<header>
		<nav>
			<a href="OneToOneSessions.jsp">Sessions</a> 
			<a href="setWorkshop.jsp">Workshops</a>
			<a href="//">Advisors</a>
			<a href="//">Students</a> 
			<a href="//">Waiting List</a>
			<a href="reportSession.jsp">Reports</a>
			<a href="//">Template</a>
			<a href="emailTemplate.jsp">Email</a>
			<a href="//">Room</a>
			<a href="//">Message</a>
			<a href="//">Exit</a>
		</nav>
	</header>
	
	<div class="wrapper">

		<!-- Tab: Book Session; Admin Session -->
		<nav>
			<a href="OneToOneSessions.jsp">Book Sessions</a> 
			<a href="OneToOneSessionsAdmin.jsp">Admin Sessions</a>
		</nav>

		<div id="AdminSessionsContent" class="tabcontent">
			<jsp:include page="FilterComponent.jsp"></jsp:include>
			<p class="header_name" id="sessions_available_header" style="margin-top:3em">Sessions Available</p>
			<table class="table_session_available" id="tAdminSessionAvailable">
				<tr class="header" align="left">
					<th style="width:2%;"><input type="checkbox" name="attendance" value="No"><br></th>
					<th style="width:9%;">Date</th>
					<th style="width:7%;">Start Time</th>
					<th style="width:7%;">End Time</th>
					<th style="width:15%;">Room</th>
					<th style="width:15%;">Advisor</th>
					<th style="width:15%;">Type</th>
					<th style="width:15%;">Booked by</th>
					<th style="width:5%;">A/NA</th>
					<th style="width:5%;">Waiting</th>
				</tr>
				
				<tr class="filter_result">
					<td><input type="checkbox" name="attendance" value="No" /></td>
					<td><input type="text" name="datePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="startTimePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="endTimePicker" style="width:100%" value="" /></td>
					<td>
						<select name="roomDropbtn" style="width:100%">
							<option value=""></option>
							<%
							try{
								String Query="SELECT * FROM room";
								String host = "jdbc:mysql://localhost:3306/uts_help";
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								Connection conn=DriverManager.getConnection(host, "root", "rootroot");
								Statement stm = conn.createStatement();
								ResultSet rs = stm.executeQuery(Query);
								while(rs.next()){
									%>
									<option value="<%=rs.getInt("roomId")%>"><%=rs.getString("roomLocation") %></option>
									<%
								}
							} catch(Exception ex){
								ex.printStackTrace();
							}
							%>
						</select>
					</td>
					<td>
						<select name="advisorDropbtn" style="width:100%">
							<option value=""></option>
							<%
							try{
								String Query="SELECT * FROM admin";
								String host = "jdbc:mysql://localhost:3306/uts_help";
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								Connection conn=DriverManager.getConnection(host, "root", "rootroot");
								Statement stm = conn.createStatement();
								ResultSet rs = stm.executeQuery(Query);
								while(rs.next()){
									%>
									<option value="<%=rs.getInt("adminId")%>"><%=rs.getString("firstName") %> <%=rs.getString("lastName") %></option>
									<%
								}
							} catch(Exception ex){
								ex.printStackTrace();
							}
							%>
						</select>
					</td>
					<td>
						<select name="typeDropbtn" style="width:100%">
							<option value=""></option>
							<option value="Type1">Type1</option>
							<option value="Type2">Type2</option>
						</select>
					</td>
					<td><a href="StudentBookingDetails.jsp">Student Name</a></td>
					<td><a href="index.cfm?scope=Program">A/NA</a></td>
					<td><a href="index.cfm?scope=Program">Add</a></td>
				</tr>
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
			<jsp:include page="AddOneToOneSessions.jsp"></jsp:include>
			<div align="left" id="legendDesc">
				<p style="font-weight:bold">Legend</p>
				<p>A: Attended</p>
				<p>NA: Not Attended</p>
			</div>
		</div>
	</div>

<!-- 	
	Switch to different tab content
	<script>
	function openSession(evt, sessionName) {
		// Declare all variables
		var i, tabcontent, tablinks;
		// Get all elements with class="tabcontent" and hide them
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		// Get all elements with class="tablinks" and remove the class "active"
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active", "");
		}
		
		// Show the current tab, and add an "active" class to the button that opened the tab
		document.getElementById(sessionName).style.display = "block";
		evt.currentTarget.className += " active";
	}
	
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
	</script>
 -->	
	

	
	
	
	
</body>
</html>