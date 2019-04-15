<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(Reports)HELPS booking system</title>
<link rel="stylesheet" href="css/reportSession.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/laydate/laydate.js" ></script>
	<script type="text/javascript">
		$(function(){
			$("input[id^='details']").click(function(){
				var skill = document.getElementById('skillDetails');
				$(skill).show();
				$(includeRep).show();
			});
			$('#skills').click(function(){
				var selectedValue=$(this).val();
				$(topics).show();
			});
			$('#topics').click(function(){
				var selectedValue=$(this).val();
				$(sessionTime).show();
			});
		
			
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
			<a href="//">Reports</a>
			<a href="//">Template</a>
			<a href="//">Email</a>
			<a href="//">Room</a>
			<a href="//">Message</a>
			<a href="//">Exit</a>
		</nav>
	</header>
<div class="title">
<nav>
<a href="http://localhost:8080/SES2A/reportSession.jsp">Session</a> |
<a href="http://localhost:8080/SES2A/reportWorkshop.jsp">Workshop</a>
</nav>

<h3>Workshop Reports</h3>

<br/>
<span class="step">- Step 1:</span>
<span>Select a period from</span>
<input type="text" name="datetimepicker1" id="datetimepicker1"/>
<span>to</span>
<input type="text" name="datetimepicker1" id="datetimepicker2"/>
<br/>
<br/>
<span class="step">- Step 2:</span>
<span>Select a report</span>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value="" id="details"/>Workshop skill-sets details



<p id="skillDetails" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;Workshop skill-sets


<select  id="skills">
<option value=""></option>
<option value="">Improve your writing</option>
<option value="">Improve your grammar</option>
<option value="">Improve your speaking</option>
<option value="">Write now| Writing Support Sessions</option>
<option value="">U: PASS write</option>
<option value="">U:PASS</option>
<option value="">Conversations@UTS(register not required)</option>
<option value="">Academic Writing Boot Camp Feb 2019</option>
<option value="">Summer Special Workshops 2018-19</option>

</select>
</p>

<p class="topics" id="topics" style="display:none" >&nbsp;&nbsp;&nbsp;&nbsp;Workshop Topics


<select >
<option value="none"></option>
<option value="session">Starting your session</option>
<option value="writing">What is Academic writing</option>
</select>
</p>

<p class="sessionTime" id="sessionTime" style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;Session
<select >
<option value="none"></option>
<option value="date">Date:19/03 Time:14:00-15:00</option>

</select>
</p>

<span class="includeRep" id="includeRep" style="display:none; ">
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Booking
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Waiting
&nbsp;&nbsp;&nbsp;<input type="checkbox" name="includedRep" value="" />Include student profiles
</span>


<br>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="Radio" name="repType" value=""/>Workshop skill-sets summary
<br/>
<br/>
<input type="Submit" name="btnWorksub" value="Submit" id="btnWorksub" />
<br>
</div>
<footer>
		<a>© HELPS Booking System</a>
	</footer>

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