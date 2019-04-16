<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Archived Workshops</title>
	<link rel="stylesheet" href="css/archivedWorkshops.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				
				
			});
		</script>
</head>
<body>
	<header>
		<nav>
			<a href="//">Sessions</a> 
			<a href="//">Workshops</a>
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
		<nav>
			<a href="//">Current</a> 
			<a href="//">Archived</a>
		</nav>
		<div></div>
		<div class="title">Skill-set:&nbsp;</div>
		<input id="skillsInput" type="text">
		<button>Add</button>
		<table rules="rows">
			<tbody>
				<tr>
					<th>No</th>
					<th>
						<input type="checkbox">
					</th>
					<th>Skill-set</th>
					<th>Short Title</th>
					<th></th>
				</tr>
				<tr>
					<th>
						<select>
							<option>1</option>
						</select>
					</th>
					<th>
						<input type="checkbox">
					</th>
					<th style="width: 60%;">
						<input placeholder="Improve your writing" readonly="readonly">
					</th>
					<th style="width: 30%;">
						<input placeholder="Writing 2019">
					</th>
					<th>
						<a href="">View</a>
					</th>
				</tr>
				<tr style="background-color: #eff0f3;">
					<th>
						<select>
							<option>2</option>
						</select>
					</th>
					<th>
						<input type="checkbox">
					</th>
					<th style="width: 55%;">
						<input placeholder="U:PASSwrite" readonly="readonly">
					</th>
					<th style="width: 25%;">
						<input placeholder="U:PASSWrite 2019">
					</th>
					<th>
						<a href="">View</a>
					</th>
				</tr>
				<tr>
					<th>
						<select>
							<option>3</option>
						</select>
					</th>
					<th>
						<input type="checkbox">
					</th>
					<th style="width: 55%;">
						<input placeholder="Improve your grammar" readonly="readonly">
					</th>
					<th style="width: 25%;">
						<input placeholder="Grammar 2019">
					</th>
					<th>
						<a href="">View</a>
					</th>
				</tr>
				<tr style="background-color: #eff0f3;">
					<th style="width: 7%;">
						<select>
							<option>4</option>
						</select>
					</th>
					<th style="width: 3%;">
						<input type="checkbox">
					</th>
					<th style="width: 55%;">
						<input placeholder="Improve your speaking" readonly="readonly">
					</th>
					<th style="width: 25%;">
						<input placeholder="Speaking 2019">
					</th>
					<th style="width: 10%;">
						<a href="">View</a>
					</th>
				</tr>
				<tr>
					<th>
						<select>
							<option>5</option>
						</select>
					</th>
					<th>
						<input type="checkbox">
					</th>
					<th style="width: 55%;">
						<input placeholder="U:PASS" readonly="readonly">
					</th>
					<th style="width: 25%;">
						<input placeholder="U:PASS">
					</th>
					<th>
						<a href="">View</a>
					</th>
				</tr>
			</tbody>
		</table>
		<div class="buttonArea">
			<button>Archive</button>
			<button>Update</button>
		</div>
	</div>
	<footer>
		<a>© HELPS Booking System</a>
	</footer>
</body>
</html>