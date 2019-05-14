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
	<script type="text/javascript">
		$(function(){
			$('.head').load('admin_head.html');
			$('.footer').load('admin_footer.html');
			$('.filter').load('FilterComponent.jsp');
		});
	</script>
</head>
<body>
	<div class="head"></div>
	
	<div class="wrapper">

		<!-- Tab: Book Session; Admin Session -->
		<nav>
			<a href="OneToOneSessions.jsp">Book Sessions</a> 
			<a href="OneToOneSessionsAdmin.jsp">Admin Sessions</a>
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
				<%
				try{
					String host = "jdbc:mysql://localhost:3306/uts_help";
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn=DriverManager.getConnection(host, "root", "rootroot");
					Statement stm = conn.createStatement();
					
					String date = request.getParameter("datefilter");
					String type = request.getParameter("typeDropbtn");
					String room = request.getParameter("roomDropbtn");
					String advisor = request.getParameter("advisorDropbtn");
					
					if((type==null && room==null && room==null)|| (type=="" && room=="" && advisor=="")){
						String QueryAllSessions="SELECT * FROM session LEFT JOIN room ON session.roomId=room.roomId";
						ResultSet rs = stm.executeQuery(QueryAllSessions);
						while(rs.next()){
							%>
							<tr class="filter_result">
								<td><input type="checkbox" name="attendance" value="No" /></td>
								<td><%=rs.getDate("date") %>
								<td><%=rs.getTime("startTime") %>
								<td><%=rs.getTime("endTime") %>
								<td><%=rs.getString("roomLocation") %>
								<td><%=rs.getString("advisorName") %>
								<td><%=rs.getString("type") %>
								<td><form action="StudentBookingDetails.jsp" method="POST">
									<%
									String get_sessionId = rs.getString("sessionId").toString();
									Date get_date = rs.getDate("date");
									Time get_startTime = rs.getTime("startTime");
									Time get_endTime = rs.getTime("endTime");
									String get_room = rs.getString("roomLocation").toString();
									String get_type = rs.getString("type").toString();
									String get_advisorName = rs.getString("advisorName").toString();
									%>
									<input type="hidden" name="get_sessionId" value = "<%=get_sessionId %>">
									<input type="hidden" name="get_date" value = "<%=get_date %>">
									<input type="hidden" name="get_startTime" value = "<%=get_startTime %>">
									<input type="hidden" name="get_endTime" value = "<%=get_endTime %>">
									<input type="hidden" name="get_room" value = "<%=get_room %>">
									<input type="hidden" name="get_type" value = "<%=get_type %>">
									<input type="hidden" name="get_advisorName" value = "<%=get_advisorName %>">
									<input type="submit" value="Student Name" />
								</form></td>
								<td><a href="AddToWaitingList.jsp">A/Na</a></td>
								<td><a href="AddToWaitingList.jsp">Add</a></td>
							</tr>
							<%
						}
					}
					if(type!="" || room!="" || advisor!=""){
						String Query="SELECT * FROM session LEFT JOIN room ON session.roomId=room.roomId WHERE type='" + type + "' OR session.roomId='" + room + "' OR adminId='" + advisor + "'";						
						ResultSet rs = stm.executeQuery(Query);
						while(rs.next()){
							%>
							<tr class="filter_result">
								<td><input type="checkbox" name="attendance" value="No" /></td>
								<td><%=rs.getDate("date") %>
								<td><%=rs.getTime("startTime") %>
								<td><%=rs.getTime("endTime") %>
								<td><%=rs.getString("roomLocation") %>
								<td><%=rs.getString("advisorName") %>
								<td><%=rs.getString("type") %>
								<td><form action="StudentBookingDetails.jsp" method="POST">
									<%
									String get_sessionId = rs.getString("sessionId").toString();
									Date get_date = rs.getDate("date");
									Time get_startTime = rs.getTime("startTime");
									Time get_endTime = rs.getTime("endTime");
									String get_room = rs.getString("roomLocation").toString();
									String get_type = rs.getString("type").toString();
									String get_advisorName = rs.getString("advisorName").toString();
									%>
									<input type="hidden" name="get_sessionId" value = "<%=get_sessionId %>">
									<input type="hidden" name="get_date" value = "<%=get_date %>">
									<input type="hidden" name="get_startTime" value = "<%=get_startTime %>">
									<input type="hidden" name="get_endTime" value = "<%=get_endTime %>">
									<input type="hidden" name="get_room" value = "<%=get_room %>">
									<input type="hidden" name="get_type" value = "<%=get_type %>">
									<input type="hidden" name="get_advisorName" value = "<%=get_advisorName %>">
									<input type="submit" value="Student Name" />
								</form></td>
								<td><a href="AddToWaitingList.jsp">A/Na</a></td>
								<td><a href="AddToWaitingList.jsp">Add</a></td>
							</tr>
							<%
						}
					}
					
					
				} catch(Exception ex){
					ex.printStackTrace();
				}
				%>
				
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
	
	<div class="footer"></div>

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