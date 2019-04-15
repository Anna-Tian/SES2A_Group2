<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HELPS Booking System</title>
	<link rel="stylesheet" href="css/createNewsession.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	
	<!-- Include jQuery, Monment.js and Date Range Picker's file -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
</head>
<body>
	<!-- UTS Logo -->
	<div id="global-utility-bar">
		<div id="uts-logo">
			<a href="http://www.uts.edu.au"><img src="https://web-common.uts.edu.au/images/utslogo.gif" alt="University of Technology, Sydney homepage" width="132" height="30" /></a>
		</div>
	</div>
	
	
	<p class="header_name" id="filter_sessions_header">Creat New Session(s)</p>
	
	<div class="tab">
		<button class="tablinks" onclick="openSession(event, 'Single')" id="defaultOpen">Single</button>
		<button class="tablinks" onclick="openSession(event, 'Multiple')">Multiple</button>
	</div>
	
	<div id="Single" class="tabcontent">
		<div class="add_sessions">
			<p>To add sessions, please enter their details below and click "Add". If you do not wish to add a session that you selected date & time, please click "Clear" next to that session before adding.</p>
			<p>Please note: all the fields are compulsory, otherwise that session will not be added.</p>
			<table class="table_add_sessions" id="tAddSessions" style="padding-bottom:10px">
				<tr class="header" align="left" style="width:90%">
					<th style="width:10%;">Topic</th>
					<th style="width:10%;">Start Date</th>
					<th style="width:10%;">End Date</th>
					<th style="width:10%;">Start Time</th>
					<th style="width:10%;">End Time</th>
					<th style="width:15%;">Room</th>
					<th style="width:5%;">Max</th>
					<th style="width:5%;">C/O</th>
					<th style="width:5%;"></th>
				</tr>
				
				<tr class="add_session_content">
					<td><input type="text" name="topic" style="width:100%" value="" /></td>
					<td><input type="text" name="startDatePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="endDatePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="startTimePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="endTimePicker" style="width:100%" value="" /></td>
					<td>
						<select name="roomDropbtn" style="width:100%">
							<option value=""></option>
							<option value="Room1">Room1</option>
							<option value="Room2">Room2</option>
						</select>
					</td>
					<td><input type="text" name="Max" style="width:100%" value="35" /></td>
					<td><input type="text" name="C/O" style="width:100%" value="24" /></td>
					<td><input type="submit" name="btnClearAddSessions" value="Clear" id="btnClearAddSessions"/></td>					
				</tr>
				<tr class="add_session_content">
					<td><input type="text" name="topic" style="width:100%" value="" /></td>
					<td><input type="text" name="startDatePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="endDatePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="startTimePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="endTimePicker" style="width:100%" value="" /></td>
					<td>
						<select name="roomDropbtn" style="width:100%">
							<option value=""></option>
							<option value="Room1">Room1</option>
							<option value="Room2">Room2</option>
						</select>
					</td>
					<td><input type="text" name="Max" style="width:100%" value="35" /></td>
					<td><input type="text" name="C/O" style="width:100%" value="24" /></td>
					<td><input type="submit" name="btnClearAddSessions" value="Clear" id="btnClearAddSessions"/></td>					
				</tr>
				<tr class="add_session_content">
					<td><input type="text" name="topic" style="width:100%" value="" /></td>
					<td><input type="text" name="startDatePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="endDatePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="startTimePicker" style="width:100%" value="" /></td>
					<td><input type="text" name="endTimePicker" style="width:100%" value="" /></td>
					<td>
						<select name="roomDropbtn" style="width:100%">
							<option value=""></option>
							<option value="Room1">Room1</option>
							<option value="Room2">Room2</option>
						</select>
					</td>
					<td><input type="text" name="Max" style="width:100%" value="35" /></td>
					<td><input type="text" name="C/O" style="width:100%" value="24" /></td>
					<td><input type="submit" name="btnClearAddSessions" value="Clear" id="btnClearAddSessions"/></td>					
				</tr>
			</table>
			<div align="center">
				<input type="submit" name="btnAddSessions" value="Add" id="btnAddSessions"/>
				<p>To use the template, please select one week.</p>
			</div>
		</div>
	</div>
	
	<!-- Switch to different tab content -->
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
			$(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
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
			$(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
		});
		$('input[name="endDatePicker"]').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});
	});
</script>