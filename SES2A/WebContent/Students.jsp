<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="Students.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
</head>
<body>
	<div class="divStyle">
		<h3>Program detail</h3>
		<div class="div1">
			<form action="" method="">
				<table>
					<tr>
						<td class="td1">Name:</td>
						<td><input type="text" style="width: 600px;"/></td>
					</tr>
					<tr>
						<td class="td1">Max:</td>
						<td><input type="text" style="width: 50px;"/></td>
					</tr>
					<tr>
						<td class="td1">Cutoff:</td>
						<td><input type="text" style="width: 50px;"/></td>
					</tr>
					<tr>
						<td class="td1">Reminder:</td>
						<td>
							<select name="reminder">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="all" selected="selected">all</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="td1">Start Date:</td>
						<td><span>Start Date</span></td>
					</tr>
					<tr>
						<td class="td1">Weeks:</td>
						<td><span>Weeks</span></td>
					</tr>
					<tr>
						<td class="td1">Days:</td>
						<td><span>Days</span></td>
					</tr>
				</table>
				<input type="submit" value="Update" />
			</form>
		</div>
		<h3>Students</h3>
		<div class="div2">
			<form action="" method="">
				<table>
					<tr>
						<td class="td1">StudentName:</td>
						<td><input type="text" style="width: 130px;"/></td>
					</tr>
					<tr>
						<td class="td1">Action:</td>
						<td>
							<select name="action" style="width: 170px;">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="create_booking" selected="selected">Create booking</option>
							</select>
						</td>
					</tr>
				</table>
				<h4>Select sessions</h4>
				<table>
					<tr class="sessions">
						<th style="padding-right: 25px;"><input type="checkbox"/></th>
						<th>Date</th>
						<th>Start Time</th>
						<th>End Time</th>
						<th>Room</th>
					</tr>
					<tr class="sessions">
						<td style="padding-right: 25px;"><input type="checkbox"/></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<input type="submit" value="Save" />
			</form>
		</div>
		<a href="#" onclick="javascript:history.back();">Back to list</a>
	</div>
</body>
</html>