<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(Reports)HELPS booking system</title>
<link rel="stylesheet" href="css/reportSession.css" />
<link rel="stylesheet" href="css/jquery.datetimepicker.min.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.datetimepicker.full.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js" ></script>
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//alert();
		});
	</script>
</head>
<body>
<div class="header">
<nav>
<a href="http://localhost:8080/SES2A/reportSession.jsp">Session</a> |
<a href="http://localhost:8080/SES2A/reportWorkshop.jsp">Workshop</a>
</nav>
<h3>Reports</h3>

<br/>
<span class="step">- Step 1:</span>
<span>Select a period from</span>

<input type="text" name="datetimepicker1" id="datetimepicker1"/>


<span>to</span>
<input type="text" name="datetimepicker2" id="datetimepicker2"/>
<br/>
<br/>
<span class="step">- Step 2:</span>
<span>Select a report</span>
 <p>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Booked Sessions
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Cancelled Sessions
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Sessions having waiting lists
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Non-attended sessions
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Non-booked sessions
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Student profile data
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Summary of students booking sessions
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Student history:&nbsp;&nbsp;&nbsp;ID:<input type="Text" name="studentID" value=""  />
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Advisors' comment:&nbsp;&nbsp;&nbsp; ID:<input type="Text" name="studentID" value=""  />
<br/>
&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" />&nbsp;Students in the waiting list
</p>
<br/>
<span class="step">- Step 3:</span>
<span>Press "Submit" button</span>
<br/>
<input type="Submit" name="btnSessionsub" value="Submit" id="btnSessionsub" />
</div>

<!-- <script type="text/javascript">
	alert(111);
	$("#datetimepicker").datetimepicker();
	/*$("#datetimepicker").click(function(){
		alert(333);
	});*/
	alert(222);
</script> -->
<script>
			laydate.render({
			  	elem: '#datetimepicker1' 
			});
			laydate.render({
			  	elem: '#datetimepicker2' 
			});
		</script>

</body>
</html>